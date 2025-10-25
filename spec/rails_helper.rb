require 'spec_helper'
ENV['RAILS_ENV'] ||= 'test'
require_relative '../config/environment'

abort("The Rails environment is running in production mode!") if Rails.env.production?
require 'rspec/rails'

begin
  ActiveRecord::Migration.maintain_test_schema!
rescue ActiveRecord::PendingMigrationError => e
  abort e.to_s.strip
end

Dir[Rails.root.join('spec', 'support', '**', '*.rb')].sort.each { |f| require f }

RSpec.configure do |config|
  config.fixture_paths = [Rails.root.join('spec/fixtures')]
  config.use_transactional_fixtures = true
  config.include FactoryBot::Syntax::Methods
  config.include(Shoulda::Matchers::ActiveModel, type: :model)
  config.include(Shoulda::Matchers::ActiveRecord, type: :model)

  config.before(:each, type: :request) do
    ActionController::Base.allow_forgery_protection = false
  end

  config.after(:each, type: :request) do
    ActionController::Base.allow_forgery_protection = true
  end

  config.infer_spec_type_from_file_location!
  config.filter_rails_from_backtrace!
end


