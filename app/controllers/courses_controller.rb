class CoursesController < ApplicationController
  before_action :set_course, only: [:show, :edit, :update, :destroy, :classroom]
  layout "courseDetails", only: [:show]
  # GET /courses
  # GET /courses.json
  def index
    @courses = Course.all
  end

  def classroom
    @sections = @course.sections
    
  end

  #search
  def search
    if params[:search].present?
      @courses = Course.search(params[:search])
    else
      @courses = Course.all
    end
  end

   def byCategory
      @courses = Course.where("category_id = ?", params[:category_id]).paginate(:page => params[:page], :per_page => 3)
      render :index
   end

  # GET /courses/1
  # GET /courses/1.json
  def show
    @sections = @course.sections
    @reviews = Review.where(course_id: @course.id).order("created_at DESC")
    if @reviews.blank?
      @avg_rating = 0
    else
      @avg_rating = @reviews.average(:rating).round(2)
    end
    #@sections = Section.where("course_id = ?",  params[:id])
    #if user_signed_in? 
      @shortlist = Shortlist.find_by(course_id: @course.id, user_id: current_user)
    #else
     # @shortlist = nil
    #end

  end


  # GET /courses/new
  def new
    @course = Course.new
  end

  # GET /courses/1/edit
  def edit
  end

  # POST /courses
  # POST /courses.json
  def create
   @course = Course.new(course_params)
   
    respond_to do |format|
      if @course.save
        #format.html { redirect_to course_build_path(:id =>"courseinfo", :course_id => @course.id), notice: "Course Created" }
        format.html { redirect_to @course, notice: 'Course was successfully created.' }
        format.json { render :show, status: :created, location: @course }
      else
        format.html { render :new }
        format.json { render json: @course.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /courses/1
  # PATCH/PUT /courses/1.json
  def update
    respond_to do |format|
      if @course.update(course_params)
        format.html { redirect_to @course, notice: 'Course was successfully updated.' }
        format.json { render :show, status: :ok, location: @course }
      else
        format.html { render :edit }
        format.json { render json: @course.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /courses/1
  # DELETE /courses/1.json
  def destroy
    @course.destroy
    respond_to do |format|
      format.html { redirect_to courses_url, notice: 'Course was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_course
      @course = Course.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def course_params
      params.require(:course).permit(:name, :description, :level, :duration, :format, :image, :category_id, :instructor_id, :status, :sections_attributes => [:course_id, :section, :_destroy])
    end

    def allcoursesbyinstructor
      @course = Course.find(params[:id])
      @courses = Course.where("instructor_id = ?", @course.instructor_id)

    end

    helper_method :allcoursesbyinstructor
end
