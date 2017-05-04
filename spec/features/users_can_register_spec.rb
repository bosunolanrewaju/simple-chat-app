require "rails_helper"

feature "users can register" do
  scenario "user registers" do
    visit new_user_registration_path

    fill_in "First name", with: 'James'
    fill_in "Last name", with: 'Bond'
    fill_in "Email", with: 'james@example.com'
    fill_in "Password", with: 'password'
    fill_in "Password confirmation", with: 'password'
    select "user", from: 'Sign up as'
    click_on "Sign up"

    expect(page).to have_text "You have signed up successfully"
    expect(User.last.role).to eq 'user'
  end

  scenario "trainer registers" do
    visit new_user_registration_path

    fill_in "First name", with: 'James'
    fill_in "Last name", with: 'Bond'
    fill_in "Email", with: 'james@example.com'
    fill_in "Password", with: 'password'
    fill_in "Password confirmation", with: 'password'
    select "trainer", from: 'Sign up as'
    click_on "Sign up"

    expect(page).to have_text "You have signed up successfully"
    expect(User.last.role).to eq 'trainer'
  end
end
