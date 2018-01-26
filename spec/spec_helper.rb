ENV["RACK_ENV"] = "test"

require 'bundler'

Bundler.require(:default, :test)
require File.expand_path('../../config/environment.rb', __FILE__)
require 'capybara/dsl'

require 'capybara/rspec'
Capybara.app = LaughTracksApp
Capybara.save_and_open_page_path = 'tmp/capybara'

DatabaseCleaner.strategy = :truncation

RSpec.configure do |c|
  c.before(:all) do
    DatabaseCleaner.clean
  end


  c.include Capybara::DSL

  c.append_after(:each) do
    DatabaseCleaner.clean
  end
end
