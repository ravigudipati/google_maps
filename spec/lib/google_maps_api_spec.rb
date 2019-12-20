describe GoogleMapsApi do
  let!(:config) { {
    api_key: "AIzaSyCI33WirMl2FJlzwi5vey0C8T63qnFh4Jg"
    type: 'atm'
    language: 'english'
    output: 'json'
    num_locations: 20
  } }
 
  describe '#base_url' do
    gma = GoogleMapsApi.new(config)

    url = "https://maps.googleapis.com/"

    expect(@gma.base_url).to eq(url)
  end

  describe '#get_locations' do

    it 'returns xml output format' do
       gma =  GoogleMapsApi.new(config.merge({ out: 'xml'}))

       res = "<xml>something</xml>"

       expect(gma). to receive(:get_locations).and_return(res)
    end

    it 'returns json output format' do
       gma =  GoogleMapsApi.new(config.merge({ out: 'json'}))

       res = "[ {locations: 'xyz'} ]"

       expect(gma). to receive(:get_locations).and_return(res)
    end

  end
end


