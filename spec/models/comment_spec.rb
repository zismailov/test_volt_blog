require "rails_helper"

RSpec.describe Comment, type: :model do
  describe "validations" do
    it { is_expected.to validate_presence_of :author }
    it { is_expected.to validate_presence_of :post }
    it { is_expected.to validate_presence_of :body }
  end

  describe "associations" do
    it { is_expected.to belong_to :post }
    it { is_expected.to belong_to :author }
  end
end
