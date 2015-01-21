class Section < ActiveRecord::Base
	belongs_to :course
	after_save :update_course

	protected
	def update_course
		course.update_attribute(:status, 'section')
	end	
	
end
