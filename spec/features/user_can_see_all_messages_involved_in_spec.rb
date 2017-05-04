require "rails_helper"

feature "user can see all messages" do
  scenario "user sees all messages sent to another user" do
    user = create(:user)
    chat = create_list(:chat, 3, sender: user)

    login_user user
    visit chats_path

    expect(page).to have_css('.chat li', count: 3)
    expect(page).to have_text chat.first.receiver.name
  end

  scenario "user sees all messages received from another user" do
    user = create(:user)
    create(:chat, sender: user)
    create_list(:chat, 4)
    chat = create_list(:chat, 2, receiver: user)

    login_user user
    visit chats_path

    expect(page).to have_text chat.first.sender.name
    expect(page).to have_css('.chat li', count: 3)
  end
end
