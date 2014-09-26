class User < ActiveRecord::Base
  
	has_secure_password

  has_many :ideas, class_name: Idea, foreign_key: :idealizer
  has_many :collaborations, class_name: Collaborator, foreign_key: :id_user

  has_attached_file :cover, :styles => {:medium => "300x300>"}, :default_url => "/images/people.png"
  do_not_validate_attachment_file_type :cover

  validates_uniqueness_of :email
  validates_presence_of :name, :email

end
