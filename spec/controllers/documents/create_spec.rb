require 'rails_helper'

RSpec.describe DocumentsController do
  describe 'POST create' do
    context 'with valid attributes' do
      before do
        session[:user_id] = FactoryGirl.create(:user).id
        filepath = Rack::Test::UploadedFile.new([Rails.root, 'example_input.tab'].join('/'))
        post :create, { document: { file: filepath } }
      end

      it { is_expected.to respond_with(302) }
      it { expect(response).to redirect_to(root_path) }
      it { expect(Document.count).to eql(1) }
      it { expect(Sale.count).to eql(4) }
    end

    context 'with invalid attributes' do
      before do
        session[:user_id] = FactoryGirl.create(:user).id
        post :create, { document: { file: '' } }
      end

      it 'redirect back' do
        expect(response).to redirect_to(root_path)
      end

      it 'Document count 0' do
        expect(Document.count).to eql(0)
      end

      it 'Sale count 0' do
        expect(Sale.count).to eql(0)
      end
    end
  end
end
