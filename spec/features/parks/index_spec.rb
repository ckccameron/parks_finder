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
      within ".park" do
        expect(page).to have_css(".name")
        expect(".name").to_not be_empty
        expect(page).to have_css(".description")
        expect(".description").to_not be_empty
        expect(page).to have_css(".directions-info")
        expect(".directions-info").to_not be_empty
        expect(page).to have_css(".hours-of-operation")
        expect(".hours-of-operation").to_not be_empty
      end
    end
  end
end
