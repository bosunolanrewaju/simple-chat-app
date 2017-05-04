require "rails_helper"

feature "user can post new message" do
  scenario "posts message successfully to another user" do
    user = create(:user)
    chat = create_list(:chat, 3, sender: user)

    login_user user
    visit chats_path

    expect(page).to have_text chat.first.receiver.name

    within "ol li:first" do
      click_on chat.first.receiver.name
    end

    expect(page).to have_text chat.first.message
  end
end
