require "rails_helper"

RSpec.describe User, type: :model do
  describe "validations" do
    it { is_expected.to validate_presence_of :nickname }
    it { is_expected.to validate_presence_of :password }
    it { is_expected.to validate_presence_of :email }
  end

  describe "associations" do
    it { is_expected.to have_many :posts }
    it { is_expected.to have_many :comments }
  end
end
