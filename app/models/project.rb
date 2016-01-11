class Project < ActiveRecord::Base

  has_many :documents
  has_many :collaborations

  mount_uploader :attachment, AttachmentUploader
  validates :name, presence: true # Make sure the owner's name is present.
end
