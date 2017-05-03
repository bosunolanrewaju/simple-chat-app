module LoginHelper
  def sign_in(user)
    visit new_user_session_path
    within "#new_user" do
      fill_form(
        :user_session,
        Email: user.email,
        Password: "password"
      )
      click_on "Log in"
    end
  end
end

RSpec.configure do |config|
  config.include LoginHelper
end
