Sidekiq.configure_server do |config|
  config.redis = { url: "redis://localhost:6379/0", password: "G7NzxXYBHAjTL8hFXXcQY8m5BgJPpzYz" }
end

Sidekiq.configure_client do |config|
  config.redis = { url: "redis://localhost:6379/0", password: "G7NzxXYBHAjTL8hFXXcQY8m5BgJPpzYz" }
end
