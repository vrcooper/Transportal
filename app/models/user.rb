class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  


  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  has_many :projects
  has_many :documents, dependent: :destroy

  mount_uploader :avatar, AvatarUploader
  

  def translator?
    role == 'translator'
  end

  def editor?
    role == 'editor'
  end

  def proofreader?
    role == 'proofreader'
  end

  def project_manager?
    role == 'project manager'
  end
  
end
