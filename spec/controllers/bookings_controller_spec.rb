require "rails_helper"

RSpec.describe BookingsController, type: :controller do

  let(:user) { FactoryBot.create(:user) }
  let(:booking) { FactoryBot.create(:booking, user: user) }
  let(:bus) { FactoryBot.create(:bus) }
  # let(:bus) { FactoryBot.create(:bus, total_seats: 50) }
  # let!(:booking1) { FactoryBot.create(:booking, bookable: bus, seat_no: 1, user: user) }
  # let!(:booking2) { FactoryBot.create(:booking, bookable: bus, seat_no: 2, user: user) }


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
    sign_in user
  end

  describe "GET #index" do
    it "assigns all bookings to @bookings" do
      get :index
      expect(assigns(:bookings)).to eq(user.bookings)
    end
  end

  # context 'with invalid attributes' do
  #   it 'does not login for current user and redirect_to new_user_session_path' do
  #     get :index
  #     expect(response).to redirect_to(new_user_session_path)
  #   end
  # end

  describe "GET #show" do
    it "booking# @booking" do
      get :show, params: { id: booking.id }
      expect(response).to have_http_status(:success)
    end
  end

  # describe "GET #new" do
  #   it "assigns available seats excluding already booked ones" do
  #     get :new, params: { bus_id: bus.id }
  #     expected_seats = (1..bus.total_seats).to_a - [booking1.seat_no]
  #     expect(assigns(:available_seats)).to eq(expected_seats)
  #   end
  # end

  # it "renders the :new template" do
  #   get :new, params: { bus_id: bus.id }
  #   expect(response).to render_template(:new)
  # end

  describe "Booking #create" do 
    it "create new booking" do 
      post :create, params: { booking: { name: 'sunit', age: '21', gender: 'Male', seat_no: '2', date: 'Date.today', bookable_type: "Bus", bookable_id: bus.id, user_id: user.id }}
      expect(response).to have_http_status(:success)
    end
  end

  it "create a new booking for current user @bookings" do
    post :create, params: { booking: { name: 'sunit', age: '21', gender: 'Male', seat_no: '2', date: 'Date.today', bookable_type: "Bus", bookable_id: bus.id, user_id: user.id }}
    expect(response).to have_http_status(:success)
    expect(assigns(:booking).user).to eq(user)
  end

  it "render a new booking @booking" do 
    post :create, params: { booking: { name: 'sunit', age: '21', gender: 'Male', seat_no: '2', date: 'Date.today', bookable_type: "Bus", bookable_id: bus.id, user_id: user.id } }
    expect(response).to have_http_status(:success)
    expect(response).to render_template(:new)
  end

  describe "Booking #delete" do 
    it "delete booking information @bookings" do 
      delete :destroy, params: { id: booking.id }
      expect(response).to redirect_to(bookings_path(assigns(:bookings)))
      expect(Booking.exists?(booking.id)).to be_falsey
    end
  end
end
