class Project < ActiveRecord::Base

  has_many :documents
  has_many :collaborations

end
