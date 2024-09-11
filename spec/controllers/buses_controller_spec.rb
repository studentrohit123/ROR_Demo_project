require "rails_helper"

RSpec.describe BusesController, type: :controller do

  let(:route) { FactoryBot.create(:route) }
  let(:bus) { FactoryBot.create(:bus) }

  describe 'before actions' do
    describe 'get_bus' do
      it 'is expected to define before action' do
        is_expected.to use_before_action(:get_bus)
      end
    end
  end

  describe "GET #index" do
    it "assigns all bus to @bus" do
      get :index
        expect(response).to have_http_status(:success)
        expect(assigns(:bus)).to eq(Bus.all)
    end
  end

  describe "GET #show" do
    it "route# @route" do
      get :show, params: { id: route.id }
      expect(response).to have_http_status(:success)
      expect(assigns(:route)).to eq(route)
      expect(assigns(:bus)).to eq(route.buses)
    end
  end

  describe "GET #new" do
    it "get new  @bus" do
      get :new
      expect(response).to have_http_status(:success)
      expect(assigns(:bus)).to be_a_new(Bus)
      expect(assigns(:routes)).to eq(Route.all)
    end
  end

  describe "POST #create" do
    it "create new @bus" do
      post :create, params: { bus: { name: 'Bus 1', number: '1234', total_seats: 40, bus_class: 'Ac', price: 200,  route_id: route.id } }
      expect(response).to redirect_to(buses_path(assigns(:bus)))
    end
  end

  context 'with invalid attributes' do
    it 'does not save the bus and re-renders the new template' do
      post :create, params: { bus: { name: '', number: '', total_seats: nil, bus_class: '', price: nil, route_id: nil } }
      expect(assigns(:routes)).to eq(Route.all)
      expect(response).to render_template(:new)
    end
  end

  describe "GET #edit" do
    it "get @routes" do 
      get :edit, params: { id: bus.id }
      expect(response).to have_http_status(:success)
      expect(assigns(:routes)).to eq(Route.all)
    end
  end

  describe "PUT #update" do
    it "update a buses @bus" do
      put :update, params: { id: bus.id, bus: { name: 'Bus 1', number: '3214', total_seats: '45', bus_class: 'AC', price: 210, route_id: route.id } }
      expect(response).to redirect_to(buses_path(assigns(:bus)))
    end
  end

  context 'with invalid attributes' do
    it 'does not update the bus and re-renders the new template' do
      put :update, params: { id: bus.id, bus: { name: '', number: '', total_seats: nil, bus_class: '', price: nil, route_id: nil } }
      expect(response).to render_template(:edit)
    end
  end

  describe "DELETE #delete" do 
    it "delete bus information @bus" do 
      delete :destroy, params: { id: bus.id }
      expect(response).to redirect_to(buses_path(assigns(:bus)))
      expect(Bus.exists?(bus.id)).to be_falsey
    end
  end
end
