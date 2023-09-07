require 'rails_helper'

RSpec.describe "Markets Show Page" do
  before do
    market = stub_request(:get, '/markets')
      .to_return(status: 200, body: '[{"id": "322458", "name": "14&U Farmers Market", "city": "Washington", "state": "District of Columbia"}]')

    vendors = stub_request(:get, 'markets/322485/vendors')
      .to_return(status: 200, body: '[{"id": "55823", "name": "The Charcuterie Corner", "phone": "1-147-179-9747", "credit_accepted": false, "description": "Vendor selling a variety of artisanal cured meats and sausages."}]')

    market_response = JSON.parse(market.response.body, symbolize_names: true)
    vendors_response = JSON.parse(vendors.response.body, symbolize_names: true)
    
    market_id = market_response[0][:id].to_i
    visit "/markets/#{market_id}"
  end
  
  describe "as a visitor" do
    describe "when I visit a market's show page 'markets/:id'" do
      it "I see that market's name and readable address" do
        expect(page).to have_content("14&U Farmers' Market")
        expect(page).to have_content("1400 U Street NW Washington, District of Columbia 20009")
      end
      
      it "and I also see a list of all the Vendors that are at that market and each vendor name is a link to that vendor's show page" do
        expect(page).to have_link("The Charcuterie Corner")
      end
    end
  end
end