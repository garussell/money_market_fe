require 'rails_helper'

RSpec.describe "Vendor Show Page" do
  before do
    vendor = stub_request(:get, 'vendors/55823')
      .to_return(status: 200, body: '[{"id": "55823", "name": "The Charcuterie Corner", "phone": "1-147-179-9747", "credit_accepted": false, "description": "Vendor selling a variety of artisanal cured meats and sausages."}]')

    vendor_response = JSON.parse(vendor.response.body, symbolize_names: true)
    vendor_id = vendor_response[0][:id].to_i

    visit "/vendors/#{vendor_id}"
  end

  describe "as a visitor" do
    describe "when I visit a vendor's show page 'vendors/:id'" do
      it "I see that vendor's name, contact information, whether they accept credit, and a description of what they sell" do
        expect(page).to have_content("Contact Info")
        expect(page).to have_content("The Charcuterie Corner")
        expect(page).to have_content("name: Claudie Langworth III")
        expect(page).to have_content("phone: 1-147-179-9747")
        expect(page).to have_content("Credit Accepted?: NO")
        expect(page).to have_content("Description: Vendor selling a variety of artisanal cured meats and sausages.")
      end
    end
  end
end