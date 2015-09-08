redis_url = ENV["REDIS_URL"] || "redis://localhost:6379/"

Sidekiq.configure_server do |config|
  config.redis = { url: redis_url, namespace: "rattle_#{Rails.env}" }
end

Sidekiq.configure_client do |config|
  config.redis = { url: redis_url, namespace: "rattle_#{Rails.env}" }
end

Sidekiq.default_worker_options = { 'backtrace' => true }
