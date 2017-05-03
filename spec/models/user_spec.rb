require 'rails_helper'

RSpec.describe User, type: :model do
  it { is_expected.to validate_presence_of :email }
  it { is_expected.to validate_presence_of :password }

  it "defaults user role to user" do
    user = create(:user)
    expect(user.role).to eq 'user'
  end

  it "sets user role" do
    trainer = create(:user, :trainer)
    admin = create(:user, :admin)

    expect(trainer.role).not_to eq 'user'
    expect(trainer.role).to eq 'trainer'
    expect(admin.role).not_to eq 'trainer'
    expect(admin.role).to eq 'admin'
  end
end
