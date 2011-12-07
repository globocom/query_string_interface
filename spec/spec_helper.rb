begin
  require 'simplecov'
  SimpleCov.start do
    add_filter '/spec/'
  end
  SimpleCov.coverage_dir 'coverage'
rescue LoadError
  # ignore simplecov in ruby < 1.9
end

begin
  require 'bundler/setup'
  Bundler.require(:default, :development)
rescue LoadError
  puts 'Bundler is not installed, you need to gem install it in order to run the specs.'
  exit 1
end

# Requires supporting files with custom matchers and macros, etc,
# in ./support/ and its subdirectories.
Dir[File.expand_path('support/**/*.rb', File.dirname(__FILE__))].each { |f| require f }

# Requires lib.
Dir[File.expand_path('../lib/**/*.rb', File.dirname(__FILE__))].each { |f| require f }

RSpec.configure do |config|
  # == Mock Framework
  #
  # If you prefer to use mocha, flexmock or RR, uncomment the appropriate line:
  #
  # config.mock_with :mocha
  # config.mock_with :flexmock
  # config.mock_with :rr
  config.mock_with :rspec

  config.include ParseDates

  config.before :all do
    Time.zone = 'Brasilia'
  end
end
