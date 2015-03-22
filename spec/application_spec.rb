$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))
ENV['RACK_ENV'] = 'test'
require 'surly'
require 'rack/test'

set :environment, :test

def app
  Sinatra::Application
end

#describe 'URL Shortening Service' do
#  include Rack::Test::Methods
#end