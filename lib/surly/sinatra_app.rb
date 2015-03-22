class Surly
  class SinatraApp < ::Sinatra::Base
    def initialize()
      super()
    end

    register Sinatra::ConfigFile
    config_file File.join(File.expand_path(File.dirname(__FILE__)), '../..', 'config', 'surly.yml')
    #SimpleNavigation::config_file_paths << File.join(File.expand_path(File.dirname(__FILE__)), '../..', 'config')

    set :environments, %w{development test production}

    # configure :production do
    # end

    configure :development do
      db_dir = File.join(File.expand_path(File.dirname(__FILE__)), '../..', 'db')
      DataMapper::setup(:default, "#{dm_scheme}://#{db_dir}/#{settings.dm_database}")
    end

    # configure :test do
    # end

    configure do
      set :views, File.join(File.expand_path(File.dirname(__FILE__)), '../..', 'views')
      set :static, true
      set :public_folder, File.join(File.expand_path(File.dirname(__FILE__)), '../..', 'public')
      DataMapper.finalize
    end

    before do
      #logdir = File.join(File.expand_path(File.dirname(__FILE__)), '../..', 'log')
      #Dir.mkdir(logdir) unless File.exist?(logdir)
      DataMapper.finalize
    end

    get '/' do
      if params[:url] and not params[:url].empty?
        generate_short_url(params[:url])
      else
        @urls = ShortUrl.all
        erb :index
      end
    end

    post '/' do
      if params[:url] and not params[:url].empty?
        url = params[:url]
        short = generate_short_url(url)
        time = Time.now
        @short_url = ShortUrl.create(short_url: short, url: url, created_at: time, updated_at: time)
      else
        @urls = ShortUrl.all

        erb :index
      end
    end

    get '/:short_url' do
      short_url = ShortUrl.get(params[:short_url])
      if short_url
        "#{short_url[:short_url]}"
        redirect "#{short_url[:url]}", 301
      else
        status 404
      end
    end

    def get_site_url(short_url)
      #SiteConfig.url_base + short_url
      @url_base + short_url
    end

  end
end
