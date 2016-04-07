require 'benchmark'
class SlowJob < ActiveJob::Base
  queue_as :default

  def perform 
    time = Benchmark.realtime do   
      sum = 0
      r = []
      100_000_00.times {
      r << ((sum +=1) ** 2)
      }
      r
    end
    Rails.logger.info "slow job consume: #{time} ms."
  end
end
