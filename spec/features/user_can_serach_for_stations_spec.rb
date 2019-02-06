require 'rails_helper'


describe 'As a user on the root path' do
  it 'can search by zipcode & find stations' do
    # As a user
    # When I visit "/"
    visit '/'

    within(".navbar") do
      # And I fill in the search form with 80203 (Note: Use the existing search form)
      fill_in "input[value='Search by zip...']", with: 80203
      # And I click "Locate"
      click_on 'Locate'
    end
    # Then I should be on page "/search"
    expect(current_path).to eq('/search')
    # Then I should see a list of the 10 closest stations within 6 miles sorted by distance
    expect(station.count).to eq(10)
    # And the stations should be limited to Electric and Propane
    within(first(".station")) do
      # And for each of the stations I should see Name, Address, Fuel Types, Distance, and Access Times
      expect(page).to have_css(".name")
      expect(page).to have_css(".address")
      expect(page).to have_css(".fuel_type")
      expect(page).to have_css(".distance")
      expect(page).to have_css(".access_time")
    end
  end
end
