class Document < ActiveRecord::Base
  belongs_to :project

  mount_uploader :attachment, AttachmentUploader
  validates :name, presence: true # Make sure the owner's name is present.
end
