require 'rails_helper'

describe 'As a user on the root path' do
  it 'can search by zipcode & find stations' do
    visit '/'

    within(".form-group") do
      fill_in :input[value='Search by zip...'], with: 80203
      click_on 'Locate'
    end

    expect(current_path).to eq('/search')
    expect(page).to have_content("Station Count: 10")
    within(first(".station")) do
      expect(page).to have_css(".name")
      expect(page).to have_css(".address")
      expect(page).to have_css(".fuel_type")
      expect(page).to have_css(".distance")
      expect(page).to have_css(".access_time")
    end
  end
end
