require "rails_helper"

feature "admin can manage chats" do
  scenario "admin can edit any chat" do
    user = create(:user, :admin)
    chat = create(:chat)
    new_message = "A new random chat message"

    login_user user
    visit chats_path

    expect(page).to have_text chat.message
    expect(page).not_to have_text new_message

    click_on "Edit"

    fill_in "Message", with: new_message

    expect(page).not_to have_text chat.message
    expect(page).to have_text new_message
  end

  scenario "admin can delete any chat" do
    user = create(:user, :admin)
    chat = create(:chat)

    login_user user
    visit chats_path

    expect(page).to have_text chat.message

    click_on "Delete"

    expect(page).not_to have_text chat.message
  end
end
