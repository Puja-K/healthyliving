class Section < ActiveRecord::Base
	belongs_to :course
	after_save :update_course
	has_many :videos
	accepts_nested_attributes_for :videos

	protected
	def update_course
		course.update_attribute(:status, 'section')
	end	
	
end
