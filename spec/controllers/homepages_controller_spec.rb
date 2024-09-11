require "rails_helper"

RSpec.describe HomepagesController, type: :controller do

  let(:route1) { FactoryBot.create(:route, source: "Indore", destination: "Bhopal") }

  describe "GET #index" do 
    it "check source and destination are present" do 
      get :index, params: { source: 'Indore', destination: 'Bhopal' }
      expect(assigns(:routes)).to eq([route1])
    end
  end

  context "When source are present" do 
    it "check for source" do
      get :index, params: { source: "Indore" }
      expect(assigns(:routes)).to eq([route1])
    end
  end

  context "When destination are present" do 
    it "check for destination" do
      get :index, params: { destination: "Bhopal" }
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
end