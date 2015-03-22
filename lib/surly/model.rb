class Surly
  class Model
    #require 'sinatra' unless defined?(Sinatra)

    def initialize()
      dbdir = File.join(File.expand_path(File.dirname(__FILE__)), '../..', 'db')
      #DataMapper::setup(:default, "sqlite3://#{Dir.pwd}/#{dbdir}/surly-dev.db")

      #require 'model/click_track'
      #require 'model/short_url'

    end

    # configure :production do
    #   DataMapper::setup(:default, "sqlite3://#{Dir.pwd}/#{dbdir}/surly-prod.db")
    # end
    #
    # configure :development do
    #   DataMapper::setup(:default, "sqlite3://#{Dir.pwd}/#{dbdir}/surly-dev.db")
    # end
    #
    # configure :test do
    #   DataMapper::setup(:default, "sqlite3://#{Dir.pwd}/#{dbdir}/surly-test.db")
    # end

  end
end

