require 'oneapm_ci'
class Ci
 
  def self.report
    statsd.gauge('delayed_job.enqueued', enqueued)
    statsd.gauge('delayed_job.working', working)
    statsd.gauge('delayed_job.pending', pending)
    statsd.gauge('delayed_job.failed', failed)
  end

  class << self
    def enqueued
      counter('enqueued'){ DelayedJob.count }
    end

    def working
      counter('working'){ DelayedJob.where('locked_at IS NOT NULL').count }
    end

    def pending
      counter('pending'){ DelayedJob.where(attempts: 0, locked_at: nil).count }
    end

    def failed
      counter('failed'){ DelayedJob.where('last_error IS NOT NULL').count }
    end

    def counter type
      counter = yield
      puts "#{Time.now.to_s(:db)} #{type}: #{counter}"
      counter
    end

    def statsd
      @statsd ||= OneapmCi::Statsd.new
    end
  end
  
end