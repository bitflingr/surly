class Surly
  class SinatraApp < ::Sinatra::Base
    helpers do

      def generate_short_url(url)
        #rand(8**url.length).base62_encode
        #rand(36**url.length).to_s(36)
        (Time.now.to_i + rand(36**8)).base62_encode
      end

    end
  end
end