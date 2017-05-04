require 'rails_helper'

RSpec.describe Chat, type: :model do
  it { is_expected.to validate_presence_of :message }
  it { is_expected.to belong_to :sender }
  it { is_expected.to belong_to :receiver }
end
