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

    context "Validation for Bus" do
      it { should validate_presence_of(:name) }
    end

    context "Validation for Bus" do
      it { should validate_presence_of(:number) }
    end

    context "Validation for Bus" do
      it { should validate_presence_of(:total_seats) }
    end

    context "Validation for Bus" do
      it { should validate_presence_of(:bus_class) }
    end

    context "Validation for Bus" do
      it { should validate_presence_of(:price) }
    end
 
    context "Validation for Bus" do
      it {  should validate_uniqueness_of(:number) }
    end
  end
end
