require 'rails_helper'

feature "add new manufacturer to list", %q(
  As a car salesperson
  I want to record a car manufacturer
  So that I can keep track of the types of cars found in the lot
  ) do
  # I must specify a manufacturer name and country.
  # If I do not specify the required information,
  #   I am presented with errors.
  # If I specify the required information,
  #   the manufacturer is recorded and
  #   I am redirected to the index of manufacturers

  scenario "user adds new manufacturer with valid information" do
    visit '/manufacturers/new'
    fill_in 'Name', with: 'Alfa Romeo'
    fill_in 'Country', with: 'Italy'
    click_button 'Add Manufacturer'

    expect(page).to have_content('Successfully added new manufacturer')
    expect(page).to have_content('Alfa Romeo')
    expect(page).to have_content('Italy')
  end

  scenario "user adds manufacturer with invalid information" do
    visit '/manufacturers/new'
    fill_in 'Name', with: 'Car Maker'
    click_button 'Add Manufacturer'

    expect(page).to have_content('Invalid submission. Please include all
      required information about the manufacturer')
    expect(page).to_not have_content 'Car Maker'
  end

  scenario "user adds manufacturer already in database" do
    manufacturer = FactoryGirl.create(:manufacturer)

    visit '/manufacturers/new'
    fill_in 'Name', with: manufacturer.name
    fill_in 'Country', with: manufacturer.country
    click_button 'Add Manufacturer'

    expect(page).to have_content('has already been taken')
  end
end
