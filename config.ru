require 'rubygems'
require 'bundler'

Bundler.require(:default, ENV['RACK_ENV'].to_sym)

require './app'

use Rack::Static, :urls => ['/data'], :root => 'public'

map '/assets' do
  environment = Sprockets::Environment.new
  environment.append_path 'assets/javascripts'
  run environment
end

map '/' do
  run ExampleApp
end
