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

  scenario 'new car submitted with valid information' do
    man = FactoryGirl.create(:manufacturer)

    visit '/cars/new'

    within '#car_manufacturer_id' do
      select man.name
    end

    fill_in 'Color', with: 'Beige'
    fill_in 'Year', with: '1993'
    fill_in 'Mileage', with: '111234'
    fill_in 'Description', with: "A beautiful ride."
    click_button 'Add Car'
    expect(page).to have_content 'Successfully added new car'
    expect(page).to have_content man.name
  end

  scenario 'new car submitted with invalid information' do
    FactoryGirl.create(:manufacturer)

    visit '/cars/new'

    fill_in 'Color', with: '2006'
    fill_in 'Mileage', with: 'Boo'
    click_button 'Add Car'
    expect(page).to have_content 'Invalid submission. Please include all
      required information about the car'
  end
end
