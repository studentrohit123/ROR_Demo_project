require "rails_helper"

RSpec.describe TrainsController, type: :controller do

  let(:route) { FactoryBot.create(:route) }
  let(:route1) { FactoryBot.create(:route, source: "Indore", destination: "Bhopal") }

  describe "GET #index" do 
    it "check source and destination are present" do 
      get :index, params: { source: 'Indore', destination: 'Bhopal' }
      expect(assigns(:routes)).to eq([route1])
    end
  end

  context "when source and destination are not present" do
    it "Assigns all Route to @route" do
      get :index
      expect(response).to have_http_status(:success)
      expect(assigns(:routes)).to eq(Route.all)
    end
  end

  describe "GET #show" do
    it "route# @route" do
      get :show, params: { id: route.id }
      expect(response).to have_http_status(:success)
      expect(assigns(:route)).to eq(route)
      expect(assigns(:trains)).to eq(route.trains)
    end
  end
end
