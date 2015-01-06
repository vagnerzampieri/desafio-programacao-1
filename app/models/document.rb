class Document < ActiveRecord::Base
  mount_uploader :file, DocumentUploader

  validates :file, presence: true
end
