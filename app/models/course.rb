class Course < ActiveRecord::Base
	#if Rails.env.development?
		has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "default.jpeg"
	#else
		#has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "default.jpeg",
		#				:storage => :dropbox,
	    #				:dropbox_credentials => Rails.root.join("config/dropbox.yml"),
	    	#			:path => ":style/:id_:filename"
	#end 

	  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
	  validates_attachment_presence :image 
	  validates_presence_of :name, :description, :category, :instructor, :level
	  # validates_presence_of :name, :description, :category, :if => :active_or_new?
	  #validates_numericality_of :duration, :greater_than => 0 
	  belongs_to :category
	  has_many :sections
	  belongs_to :instructor
	  accepts_nested_attributes_for :sections, allow_destroy: true
	  #ratyrate_rateable 'visual_effects'
	  has_many :enrollments
	  has_many :shortlists
	  has_many :reviews
	def active?
	   status == 'active'
	end

	def active_or_new?
	   status.include?('new') || active?
	end

end
