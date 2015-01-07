require 'rails_helper'

RSpec.describe SessionsController do
  describe 'POST create' do
    before do
      request.env['omniauth.auth'] = OmniAuth.config.mock_auth[:github]
      post :create, provider: :github
    end

    it { is_expected.to respond_with(302) }
    it { expect(response).to redirect_to(root_path) }
    it { expect(User.count).to eql(1) }
    it { expect(session[:user_id]).not_to be_nil  }
  end
end
