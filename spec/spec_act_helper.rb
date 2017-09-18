RSpec.configure do |config|
  require "selenium-webdriver"
  require "capybara"
  require "capybara/dsl"
  require "capybara/rspec"
  require "require_all"

  require_all File.dirname(__FILE__) + "/support/page/"

  Capybara.default_max_wait_time = 30
  Capybara.run_server = false
  Capybara.default_driver = :selenium
  Capybara.app_host = 'https://www.w3schools.com'

  Capybara.register_driver :selenium do |app|
    Capybara::Selenium::Driver.new(app, :browser => :firefox )
  end

  config.example_status_persistence_file_path = "scripts/tests-fail.txt"
end

