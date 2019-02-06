require 'rails_helper'

describe 'As a user on the root path' do
  it 'can search by zipcode & find stations' do
    visit '/'

    within(".form-group") do
      fill_in :input[value='Search by zip...'], with: 80203
      click_on 'Locate'
    end

    expect(current_path).to eq('/search')
    #10 closest stations within 6 miles sorted by distance
save_and_open_page
    expect(page).to have_content("Station Count: 10")
    #should be limited to Electric and Propane
    within(first(".station")) do
      #I should see Name, Address, Fuel Types,
      #Distance, and Access Times
      expect(page).to have_css(".name")
      expect(page).to have_css(".address")
      expect(page).to have_css(".fuel_type")
      expect(page).to have_css(".distance")
      expect(page).to have_css(".access_time")
    end
  end
end
