module CourseAddedDateHelper
	def format_date(cur_date)
		cur_date.strftime('%x')
	end
end