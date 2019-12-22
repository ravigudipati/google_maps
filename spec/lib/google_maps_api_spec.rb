require 'google_maps_api'
require 'rails_helper'

describe GoogleMapsApi::Search do
  let(:config) { YAML.load(File.read("#{Rails.root}/config/maps_attributes.yml")) }

  describe '#base_url' do
    gma = GoogleMapsApi::Search.new(config)
    url = "https://maps.googleapis.com/"

    expect(@gma.base_url).to eq(url)
  end

  describe '#get_locations' do
    it 'returns xml output format' do
       gma =  GoogleMapsApi::Search.new(config['customerA'])
       res = "<xml>something</xml>"

       expect(gma). to receive(:get_locations).and_return(res)
    end

    it 'returns json output format' do
       gma =  GoogleMapsApi::Search.new(config['customerB'])
       res = "[ {locations: 'xyz'} ]"

       expect(gma). to receive(:get_locations).and_return(res)
    end
  end
end

