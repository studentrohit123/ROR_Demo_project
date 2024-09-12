require "rails_helper"

RSpec.describe BookingsController, type: :controller do

  describe 'before actions' do
    describe 'authenticate_user!' do
      it 'is expected to define before action' do
        is_expected.to use_before_action(:authenticate_user!)
      end
    end
  end

  describe 'before actions' do
    describe 'set_booking' do
      it 'is expected to define before action' do
        is_expected.to use_before_action(:set_booking)
      end
    end
  end

  describe 'before actions' do
    describe 'set_bookable' do
      it 'is expected to define before action' do
        is_expected.to use_before_action(:set_bookable)
      end
    end
  end

  before do
    @user = FactoryBot.create(:user)
    sign_in @user
  end

  describe "GET #index" do
    it "assigns all bookings to @bookings" do
      booking = FactoryBot.create(:booking, user: @user)
      get :index
      expect(assigns(:bookings)).to eq(@user.bookings)
    end
  end
end
