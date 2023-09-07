require 'rails_helper'

RSpec.describe "Markets Index Page" do
  before do
    stub_request(:get, 'localhost:3000/api/v0/marets')
      .to_return(status: 200, body: '[{"id": "322458", "name": "14&U Farmers Market", "city": "Washington", "state": "District of Columbia"}]')

    visit "/markets"
  end

  describe "as a visitor" do
    describe "when I visit '/markets'" do
      it "I see all markets listed with their name, city, and state" do

        expect(page).to have_content("14&U Farmers' Market")
        expect(page).to have_content("Washington")
        expect(page).to have_content("District of Columbia")
      end

      it "when I click a button to see more info on that @market I'm taken to that market's show page '/markets/:id'" do
        expect(page).to have_button("More Info")

        click_on "More Info"

        response = JSON.parse('[{"id": "322458", "name": "14&U Farmers Market", "city": "Washington", "state": "District of Columbia"}]')
        market_id = response[0]['id'].to_i
        expect(page).to have_current_path("/markets/#{market_id}")
      end
    end
  end
end