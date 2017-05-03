RSpec.configure do |config|
  config.include Devise::Test::ControllerHelpers, type: :controller
end

class ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers
end
