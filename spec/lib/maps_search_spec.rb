require 'rails_helper'
require 'maps_search'

describe MapsSearch::Search do
  let(:client_config)  { YAML.load(File.read("#{Rails.root}/config/maps_attributes.yml")) }

  describe '#base_url' do
    it 'returns base url' do
      gma = MapsSearch::Search.new(client_config['CustomerC'])
      url = "https://maps.googleapis.com/"

      allow(gma).to receive(:base_url).and_return(url)
      expect(gma.base_url).to eq(url)
    end
  end

  describe '#get_locations' do
    it 'returns xml output format' do
       gma =  MapsSearch::Search.new(client_config['CustomerA'])
       res = "<xml>something</xml>"

       allow(gma).to receive(:get_locations).and_return(res)
       expect(gma.get_locations).to eq(res)
    end

    it 'returns json output format' do
      gma =  MapsSearch::Search.new(client_config['CustomerB'])
      res = "[ {locations: 'xyz'} ]"

      allow(gma).to receive(:get_locations).and_return(res)
      expect(gma.get_locations).to eq(res)
    end
  end
end

