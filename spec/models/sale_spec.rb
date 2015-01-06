require 'rails_helper'

RSpec.describe Sale, :type => :model do
  describe '.importing' do
    it 'document data to the database' do
      filepath = Rack::Test::UploadedFile.new([Rails.root, 'example_input.tab'].join('/'))
      Sale.importing(filepath)

      expect(Sale.count).to eql(4)
    end
  end
end
