require 'rails_helper'

RSpec.describe Bus, type: :model do
  describe "Write test cases for Bus" do
    context "Validation for Bus" do
      it { should belong_to(:route) }
    end

    context "Association for Bus" do
      it { should have_many(:bookings)}
    end
    
    context "Image for Bus" do
      it { should have_one_attached(:image) }
    end
  end
end