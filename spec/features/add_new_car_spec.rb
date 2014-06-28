require 'rails_helper'

feature 'add a new car to the lot', %q(
  As a car salesperson
  I want to record a newly acquired car
  So that I can list it in my lot
  ) do
  # I must specify the manufacturer, color, year, and mileage of the car.
  # Only years from 1920 and above can be specified.
  # I can optionally specify a description of the car.
  # If I enter all of the required information in the required formats, the car
    # is recorded and I am presented with a notification of success
  # If I do not specify all of the required information in the required formats,
    # the car is not recorded and I am presented with errors.
  # Upon successfully creating a car, I am redirected back to the index of cars.
  
  let(:manufacturers) { FactoryGirl.create_list(:manufacturer, 10) }
  
  scenario 'new car submitted with valid information' do
    visit '/cars/new'
    # expect(page).to have_css(DROPDOWN, with manufacturers listed)
    fill_in 'Manufacturer', with: manufacturers[0].name
    fill_in 'Color', with: 'Beige'
    fill_in 'Year', with: '1993'
    fill_in 'Mileage', with: '111234'
    click_button 'Add Car'
    expect(page).to have_content 'Successfully added new car'
    expect(page).to have_content manufacturers[0].name
  end

  scenario 'new car submitted with invalid information' do 
    visit '/cars/new'
    # expect(page).to have_css(DROPDOWN, with manufacturers listed)
    fill_in 'Manufacturer', with: manufacturers[0].name
    fill_in 'Color', with: '2006'
    fill_in 'Mileage', with: 'Boo'
    click_button 'Add Car'
    expect(page).to have_content 'Invalid submission. Please include all 
      required information about the car'
    expect(page).to_not have_content manufacturers[0].name
  end
end
