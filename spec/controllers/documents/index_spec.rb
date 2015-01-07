require 'rails_helper'

RSpec.describe DocumentsController do
  describe 'GET index' do
    before do
      session[:user_id] = FactoryGirl.create(:user).id
      @sales = Sale.create
      get :index
    end

    it { is_expected.to respond_with(200) }
    it { is_expected.to render_template('index') }
    it { expect(assigns(:document)).to be_a_new(Document) }
    it { expect(assigns(:sales)).to eq([@sales]) }
  end
end
