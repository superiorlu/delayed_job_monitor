require 'benchmark'
class SlowJob < ActiveJob::Base
  queue_as :default

  def perform 
    sleep 10
  end
end
