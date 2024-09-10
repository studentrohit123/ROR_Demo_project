require 'rails_helper'

RSpec.describe Route, type: :model do
  describe "Write test cases for route" do
    context "Association for route" do
      it { should have_many(:buses)}
      it { should have_many(:trains)}
    end

    context "Validation for route" do
      it { should validate_presence_of(:source) }
      it { should validate_presence_of(:destination) }
      it { should validate_presence_of(:distance) }
    end
  end
end
