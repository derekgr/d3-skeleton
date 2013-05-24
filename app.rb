require 'bundler'
Bundler.require(:default, ENV['RACK_ENV'].to_sym)

class ExampleApp < Sinatra::Base
  configure do
    environment = Sprockets::Environment.new
    environment.append_path 'assets/javascripts'
    Sprockets::Helpers.configure do |config|
      config.environment = environment
    end
  end

  helpers do
    include Rack::Utils
    include Sprockets::Helpers
  end

  get '/' do
    erb :index
  end
end
