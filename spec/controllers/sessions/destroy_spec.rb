require 'rails_helper'

RSpec.describe SessionsController do
  describe 'DELETE destroy' do
    before do
      request.env['omniauth.auth'] = OmniAuth.config.mock_auth[:github]
      delete :destroy, provider: :github
    end

    it { is_expected.to respond_with(302) }
    it { expect(response).to redirect_to(root_path) }
    it { expect(session[:user_id]).to be_nil  }
  end
end
