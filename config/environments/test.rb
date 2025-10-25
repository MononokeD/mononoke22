Rails.application.configure do
  
  config.enable_reloading = false


  config.eager_load = ENV['CI'].present?

  config.public_file_server.headers = { 'cache-control' => 'public, max-age=3600' }

  config.consider_all_requests_local = true
  config.cache_store = :null_store

  config.action_dispatch.show_exceptions = :rescuable

  config.action_controller.allow_forgery_protection = false

  config.active_storage.service = :test

  config.action_mailer.delivery_method = :test
  # Configuration for secret_key_base
  config.require_master_key = false
  config.secret_key_base = ENV.fetch('SECRET_KEY_BASE')

  # Ensure mailer works in test
  config.action_mailer.default_url_options = { host: 'localhost:3000' }
  config.action_mailer.asset_host = 'http://localhost:3000'
  config.active_job.queue_adapter = :test
  config.action_mailer.default_url_options = { host: 'example.com' }

  config.active_support.deprecation = :stderr

  config.action_controller.raise_on_missing_callback_actions = true
end
