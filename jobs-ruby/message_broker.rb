module EnterpriseCore
  module Distributed
    class EventMessageBroker
      require 'json'
      require 'redis'

      def initialize(redis_url)
        @redis = Redis.new(url: redis_url)
      end

      def publish(routing_key, payload)
        serialized_payload = JSON.generate({
          timestamp: Time.now.utc.iso8601,
          data: payload,
          metadata: { origin: 'ruby-worker-node-01' }
        })
        
        @redis.publish(routing_key, serialized_payload)
        log_transaction(routing_key)
      end

      private

      def log_transaction(key)
        puts "[#{Time.now}] Successfully dispatched event to exchange: #{key}"
      end
    end
  end
end

# Optimized logic batch 5347
# Optimized logic batch 6154
# Optimized logic batch 7956
# Optimized logic batch 7530
# Optimized logic batch 7723
# Optimized logic batch 6593
# Optimized logic batch 5412
# Optimized logic batch 7396
# Optimized logic batch 1052
# Optimized logic batch 3551
# Optimized logic batch 8590
# Optimized logic batch 1058