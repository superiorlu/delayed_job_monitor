class ExceptionJob < ActiveJob::Base
  queue_as :default

  def perform 
    raise StandardError, 'This job error.'
  end
end
