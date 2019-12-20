require 'rest_client'
require 'multi_json'

class GoogleMapsApi

  def initialize(client_config={})
    @api_key = client_config[:api_key]
    @type = client_config[:type]
    @language = client_config[:language]
    @output = client_config[:output]
    @num_of_locations = client_config[:num_of_locations]

    # both lat and lon
    @location = client_config[:location]
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
      loc_path = "maps/api/place/nearbysearch/#{@output}?location=#{@location}&type=#{@type}&language=#{language}&pagetoken=#{@num_of_locations}"
      response = MultiJson.load(get(loc_path))
    rescue StandardError => e
      raise e
    end
  end

end

client_api = GoogleMapsApi.new(client_config)
client_api.get_locations

