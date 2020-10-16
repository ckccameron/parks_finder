require 'rails_helper'

describe ParkService do
  before :each do
    @service = ParkService.new
  end

  it "exists" do
    expect(@service).to be_a(ParkService)
  end

  it "returns parks for a given state" do
    response = File.read("spec/fixtures/tennessee_parks.json")
    stub_request(:get, "https://developer.nps.gov/api/v1/parks?api_key=PoPD5xeyT2LkkVAzPQTxG9Q2oRyjduIlHkpps5kB&stateCode=TN").
      to_return(status: 200, body: response, headers: {})
      
    state = "TN"
    parks = @service.get_parks(state)

    expect(parks[:data].first).to have_key(:fullName)
    expect(parks[:data].first[:fullName]).to be_a(String)
    expect(parks[:data].first).to have_key(:description)
    expect(parks[:data].first[:description]).to be_a(String)
    expect(parks[:data].first).to have_key(:directionsInfo)
    expect(parks[:data].first[:directionsInfo]).to be_a(String)
    expect(parks[:data].first).to have_key(:operatingHours)
    # expect(parks[:data].first[:operatingHours][:standardHours]).to be_a(String)
  end
end
