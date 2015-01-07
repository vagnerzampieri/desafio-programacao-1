require 'rails_helper'

RSpec.describe UsersController do
  describe 'GET new' do
    before do
      get :new
    end

    it { is_expected.to respond_with(200) }
    it { is_expected.to render_template('new') }
  end
end
