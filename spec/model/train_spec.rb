require 'rails_helper'

RSpec.describe Train, type: :model do
  describe "Write test cases for Train" do
    context "Association for Train" do 
      it { should belong_to(:route) }
    end
    
    context "Association for Train" do 
      it { should have_many(:bookings)}
    end
  end
end

