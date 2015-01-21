class Courses::BuildController < ApplicationController
	include Wicked::Wizard

	steps :courseinfo, :sections, :topics

	def show
    @course = Course.find(params[:course_id])
    if steps == 'sections'
    	#@sections = Section.where(course_id: @course.id)
    	@section = Section.new
    	@section.course = @section
    end
    render_wizard
  	end


	def update
	   @course = Course.find(params[:course_id])
	   params[:course][:status] = step.to_s
	   params[:course][:status] = 'active' if step == steps.last
	   respond_to do |format|
	   		if @course.update_attributes(course_params)
	   			format.html {render_wizard @course, notice: 'Course updated'}
	   			format.js 
	   			#format.json {render json: @course}
	   		else
	   			format.html{render_wizard}
	   			format.js {}
	   		end
	   	end
	end

 



	def create
	  @course = Course.create
	  redirect_to wizard_path(steps.first, :course_id => @course.id)
	end

 	private
	def course_params
      params.require(:course).permit(:name, :description, :level, :duration, :format, :image, :category_id, :status, :sections_attributes => [:course_id, :section])
    end

end
