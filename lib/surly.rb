require 'rubygems'
require 'sinatra'
require 'sinatra/base'
require 'sinatra/config_file'
require 'data_mapper'
require 'dm-sqlite-adapter'
require 'base62'

class Surly

  require 'surly/sinatra_app'
  require 'surly/helpers'
  require 'models/short_url'
  require 'models/click_track'
  def initialize()

  end

end
