require 'rails_helper'
RSpec.describe Booking, type: :model do
  describe "Write test cases for Booking" do
    context "Association for Booking" do
      it { should belong_to(:user) }
      it { should belong_to(:bookable) }
    end

    context "Validation for Booking" do
      it { should validate_presence_of(:name) }
      it { should validate_presence_of(:age) }
      it { should validate_presence_of(:gender) }
      it { should validate_presence_of(:seat_no) }
      it { should validate_presence_of(:date) }
    end
  
    describe 'validations' do
      it { should allow_value('male').for(:gender) }
      it { should allow_value('female').for(:gender) }
    end
  end
end