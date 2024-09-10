require 'rails_helper'

RSpec.describe User, type: :model do
  describe "Write test cases for User" do
    context "Association for User" do
      it { should have_many(:bookings)}
    end
  end
end