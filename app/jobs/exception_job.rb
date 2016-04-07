class ExceptionJob < ActiveJob::Base
  queue_as :default

  def perform 
    1 / 0  
  end
end
