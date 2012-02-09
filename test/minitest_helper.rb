ENV["RAILS_ENV"] ||= 'test'
require File.expand_path("../../config/environment", __FILE__)

# Load support files
Dir["#{File.dirname(__FILE__)}/support/**/*.rb"].each { |f| require f }

# Database cleaner.
# Go ahead and clear out the database first
DatabaseCleaner.strategy = :truncation
DatabaseCleaner.clean

# Then set up for running the actual tests.
DatabaseCleaner.strategy = :transaction
class MiniTest::Spec
  before do
    DatabaseCleaner.start
  end
  after do
    DatabaseCleaner.clean
  end
end
