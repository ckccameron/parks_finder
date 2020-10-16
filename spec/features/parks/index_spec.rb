# As a user,
# When I select "Tennessee" from the form,
# (Note: use the existing form)
# And click on "Find Parks",
# I see the total of parks found,
# And for each park I see:
# - full name of the park
# - description
# - direction info
# - standard hours for operation

require 'rails_helper'

describe "parks index page" do
  describe "when a user selects a state from the form to find parks" do
    before :each do
      response = File.read("spec/fixtures/tennessee_parks.json")
      stub_request(:get, "https://developer.nps.gov/api/v1/parks?api_key=PoPD5xeyT2LkkVAzPQTxG9Q2oRyjduIlHkpps5kB&stateCode=TN").
        to_return(status: 200, body: response, headers: {})

      visit root_path

      select :Tennessee, from: :state
      click_on "Find Parks"
    end

    it "they should see total number of parks found" do
      expect(current_path).to eq(parks_path)
      expect(page).to have_content("16 Results")
      expect(page).to have_css(".park", count: 16)
    end

    it "they should see full name, description, direction info and standard hours of operation for each park" do
      expect(current_path).to eq(parks_path)

      within first(".park") do
        expect(page).to have_css(".name")
        name = find(".name").text
        expect(name).to_not be_empty

        expect(page).to have_css(".description")
        description = find(".description").text
        expect(description).to_not be_empty

        expect(page).to have_css(".directions-info")
        directions_info = find(".directions-info").text
        expect(directions_info).to_not be_empty

        expect(page).to have_css(".hours-of-operation")
        hours_of_operation = find(".hours-of-operation").text
        expect(hours_of_operation).to_not be_empty
      end
    end
  end
end
