class Instructor < ActiveRecord::Base
	if Rails.env.development?
		has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "defaults.jpeg"
  	else
  		has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "default.jpeg",
						:storage => :dropbox,
	    				:dropbox_credentials => Rails.root.join("config/dropbox.yml"),
	    				:path => ":style/:id_:filename"
	end
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/

  has_many :courses
end
