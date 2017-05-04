require "rails_helper"

feature "user can post new message" do
  scenario "posts message successfully to another user" do
    create_list(:user, 2)
    trainer = create(:user, :trainer)
    user = create(:user)
    login_user user

    visit new_chat_path

    expect(page).to have_text "Compose a new message"

    select trainer.name_with_role, from: 'Receiver'
    fill_in "Message", with: "Random Text"
    click_on "Send"

    expect(page).to have_text "Your message has been sent successfully"
  end

  scenario "does not post message successfully to another user" do
    create_list(:user, 2)
    trainer = create(:user, :trainer)
    user = create(:user)
    login_user user

    visit new_chat_path

    expect(page).to have_text "Compose a new message"

    select trainer.name_with_role, from: 'Receiver'
    click_on "Send"

    expect(page).to have_text "Your message could not be sent"
  end
end
