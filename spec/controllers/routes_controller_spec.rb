require "rails_helper"

RSpec.describe RoutesController, type: :controller do

  let(:route) { FactoryBot.create(:route) }

  describe 'before actions' do
    describe 'get_route' do
      it 'is expected to define before action' do
        is_expected.to use_before_action(:get_route)
      end
    end
  end 

  describe "GET #index" do
    it "assigns all bus to @routes" do
      get :index
        expect(response).to have_http_status(:success)
        expect(assigns(:routes)).to eq(Route.all)
    end
  end

  describe "GET #new" do
    it "get new  @route" do
      get :new
      expect(response).to have_http_status(:success)
      expect(assigns(:route)).to be_a_new(Route)
    end
  end

  describe "POST #create" do
    it "create new @route" do
      post :create, params: { route: { source: 'Indore', destination: 'Bhopal', distance: '150km' } }
      expect(response).to redirect_to(routes_path(assigns(:route)))
    end
  end

  context 'with invalid attributes' do
    it 'does not save the route and re-renders the new template' do
      post :create, params: { route: { source: '', destination: '', distance: nil } }
      expect(response).to render_template(:new)
    end
  end

  describe "GET #edit" do
    it "get @routes" do 
      get :edit, params: { id: route.id }
      expect(response).to have_http_status(:success)
    end
  end

  describe "PUT #update" do
    it "update a buses @route" do
      put :update, params: { id: route.id, route: { source: 'Indore', destination: 'Bhopal', distance: '150km' } }
      expect(response).to redirect_to(routes_path(assigns(:route)))
    end
  end

  context 'with invalid attributes' do
    it 'does not update the route and re-renders the new template' do
      put :update, params: { id: route.id, route: { source: '', destination: '', distance: '' } }
      expect(response).to render_template(:edit)
    end
  end

  describe "DELETE #delete" do 
    it "delete route information @route" do 
      delete :destroy, params: { id: route.id }
      expect(response).to redirect_to(routes_path(assigns(:route)))
      expect(Route.exists?(route.id)).to be_falsey
    end
  end
end
