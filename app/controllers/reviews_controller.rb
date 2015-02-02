class ReviewsController < InheritedResources::Base
	before_action :authenticate_user!
	before_action :set_review, only: [:show, :edit, :update, :destroy]
	before_action :set_course

	def index
		@reviews = Review.all
	end

	def new
    	@review = Review.new
  	end

	def create
   	@review = Review.new(review_params)
   	@review.user_id = current_user.id
   	@review.course_id = @course.id
    respond_to do |format|
      if @review.save
        format.html { redirect_to @course, notice: 'Thanks for your review.' }
        format.json { render :show, status: :created, location: @review }
      else
        format.html { render :new }
        format.json { render json: @review.errors, status: :unprocessable_entity }
      end
    end
  end



  private

    def review_params
      params.require(:review).permit(:rating, :comment)
    end

	def set_review
      @course = Review.find(params[:id])
    end
    def set_course
      @course = Course.find(params[:course_id])
    end
end

