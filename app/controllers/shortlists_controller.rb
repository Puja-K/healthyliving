class ShortlistsController < InheritedResources::Base
	before_filter :authenticate_user!
	before_action :set_course

	def new
    	@shortlist = Shortlist.new
  	end

  	def destroy
  		@shortlist = Shortlist.find(params[:id])
  		@shortlist.destroy
  		respond_to do |format|
      		format.js {}
      	end
  	end

	def create
		@shortlist = Shortlist.new
	    @shortlist.course_id = @course.id
	    @shortlist.user_id = current_user.id 
	    respond_to do |format|
	          if @shortlist.save
	            format.js{}
	          else
	            format.js{}
	            format.html {render action: 'show'}
	            format.json {render json: @shortlist.errors, status: :unprocessable_entity}
	          end
	        end
	  
    end

  private

    def shortlist_params
      params.require(:shortlist).permit(:user_id, :course_id)
    end

    def set_course
    	@course = Course.find(params[:course_id])	
    end
end

