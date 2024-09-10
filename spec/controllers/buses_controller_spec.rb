require "rails_helper"

RSpec.describe BusesController, type: :controller do
  describe 'before actions' do
    describe 'get_bus' do
      it 'is expected to define before action' do
        is_expected.to use_before_action(:get_bus)
      end
    end
  end
end