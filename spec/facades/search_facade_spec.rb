require 'rails_helper'

describe SearchFacade do
  it "returns parks for a given state" do
    response = File.read("spec/fixtures/tennessee_parks.json")
    stub_request(:get, "https://developer.nps.gov/api/v1/parks?api_key=PoPD5xeyT2LkkVAzPQTxG9Q2oRyjduIlHkpps5kB&stateCode=TN").
      to_return(status: 200, body: response, headers: {})

    state = "TN"
    parks = SearchFacade.parks(state)
    expect(parks).to be_an(Array)
    expect(parks.first).to be_a(Park)
    expect(parks.first.name).to be_a(String)
    expect(parks.first.description).to be_a(String)
    expect(parks.first.directions).to be_a(String)
    expect(parks.first.standard_hours).to be_a(Hash)
  end
end
