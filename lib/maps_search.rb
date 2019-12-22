require 'rest_client'

module MapsSearch
  class Search
    def initialize(client_config={})
      @api_key = client_config['api_key']
      @type = client_config['type']
      @language = client_config['language']
      @output = client_config['response_output']
      @num_of_locations = client_config['number_of_locations']

      # both lat and lon
      @location = "#{client_config['lat']},#{client_config['lon']}"
    end

    def base_url
      "https://maps.googleapis.com/"
    end

    def default_header_options
      {:Authorization => "Basic #{@api_key}"}
    end

    def get(path, options={})
      RestClient.get(base_url + path, default_header_options.merge(options))
    end

    def get_locations
      begin
        loc_path = "maps/api/place/nearbysearch/#{@output}?location=#{@location}&type=#{@type}&language=#{@language}&pagetoken=#{@num_of_locations}"
        response = get(loc_path)
      rescue StandardError => e
        raise e
      end
    end
  end
end

