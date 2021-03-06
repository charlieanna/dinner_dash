require 'simplecov'
require 'spork'
SimpleCov.start 'rails'

# uncomment the following line to use spork with the debugger
# require 'spork/ext/ruby-debug'

Spork.prefork do
  # This file is copied to spec/ when you run 'rails generate rspec:install'
  ENV['RAILS_ENV'] ||= 'test'
  require 'spec_helper'
  require File.expand_path('../../config/environment', __FILE__)
  require 'rspec/rails'
  require 'shoulda/matchers'
  require 'paperclip/matchers'
  # require 'capybara/email/rspec'
  # Requires supporting ruby files with custom matchers and macros, etc, in
  # spec/support/ and its subdirectories. Files matching `spec/**/*_spec.rb` are
  # run as spec files by default. This means that files in spec/support that end
  # in _spec.rb will both be required and run as specs, causing the specs to be
  # run twice. It is recommended that you do not name files matching this glob to
  # end with _spec.rb. You can configure this pattern with the --pattern
  # option on the command line or in ~/.rspec, .rspec or `.rspec-local`.
  Dir[Rails.root.join('spec/support/**/*.rb')].each { |f| require f }

  # Checks for pending migrations before tests are run.
  # If you are not using ActiveRecord, you can remove this line.
  ActiveRecord::Migration.maintain_test_schema!

  RSpec.configure do |config|
    Capybara.javascript_driver = :poltergeist
    config.include FactoryGirl::Syntax::Methods
    config.include Feature, type: :feature
    config.use_transactional_fixtures = false
    config.include Paperclip::Shoulda::Matchers
    config.mock_with :rspec
    # config.include Features, :type => :features
    # RSpec Rails can automatically mix in different behaviours to your tests
    # based on their file location, for example enabling you to call `get` and
    # `post` in specs under `spec/controllers`.
    #
    # You can disable this behaviour by removing the line below, and instead
    # explicitly tag your specs with their type, e.g.:
    #
    #     RSpec.describe UsersController, :type => :controller do
    #       # ...
    #     end
    #
    # The different available types are documented in the features, such as in
    # https://relishapp.com/rspec/rspec-rails/docs
    config.infer_spec_type_from_file_location!
  end
end

Spork.each_run do
  # This code will be run each time you run your specs.
end
