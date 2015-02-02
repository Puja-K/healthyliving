class EnrollmentsController < InheritedResources::Base
	before_action :authenticate_user!


	def home
    	@enrollments = Enrollment.where(user: current_user).order("created_at DESC")
  	end


	def new
		@enrollment = Enrollment.new
		@course = Course.find(params[:course_id])

	end

	def create
		@enrollment = Enrollment.new
		@course = Course.find(params[:course_id])
		@enrollment.course_id = @course.id
		@enrollment.user_id = current_user.id	
		respond_to do |format|
	      	if @enrollment.save
	      		format.html {redirect_to action: :home, notice: "Thank you for enrolling in this course."}
	      		format.json {render action: 'show', status: :created, location: @enrollment}
	      	else
	      		format.html {render action: 'new'}
	      		format.json {render json: @enrollment.errors, status: :unprocessable_entity}
	      	end
      	end
	end
  private

    def enrollment_params
      params.require(:enrollment).permit(:user_id, :course_id)

    end
end

