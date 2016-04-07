require 'oneapm_ci'
class Ci
  include singleton

  def report
    statsd.gauge('delayed_job.enqueued', enqueued)
    statsd.gauge('delayed_job.working', working)
    statsd.gauge('delayed_job.pending', pending)
    statsd.gauge('delayed_job.failed', failed)
  end

  def enqueued
    DelayedJob.count
  end

  def working
    DelayedJob.where('locked_at IS NOT NULL').count
  end

  def pending
    DelayedJob.where(attempts: 0, locked_at: nil).count
  end

  def failed
    DelayedJob.where('last_error IS NOT NULL').count
  end

  def statsd
    @statsd ||= OneapmCi::Statsd.new
  end
  
end