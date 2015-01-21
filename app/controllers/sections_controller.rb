class SectionsController < ApplicationController
  before_action :set_section, only: [:show, :edit, :update, :destroy]

  # GET /sections
  # GET /sections.json
  def index
    #@sections = Section.find(params[:course_id])
    #@sections = Section.all
  end

  def coursesections
    @sections = Section.where("course_id = ?",  params[:course_id])
  end

  # GET all the sections for a course
  def show
    @sections = Section.where("course_id = ?",  params[:course_id])
  end

  # GET /sections/new
  def new
    @section = Section.new
    @section.course_id = params[:course_id]
    @sections = Section.where("course_id = ?",  params[:course_id])
    #@course = Course.find(params[:course_id])
  end

  # GET /sections/1/edit
  def edit
  end

  # POST /sections
  # POST /sections.json
  def create
    @section = Section.new(section_params)
    @course = Course.find(params[:course_id])
    @section.course_id = @course.id
    respond_to do |format|
      if @section.save
        format.html { redirect_to course_section_url(@section.course_id, @section), notice: 'Section was successfully created.' }
        format.json { render :show, status: :created, location: @section }
        format.js {}
      else
        format.html { render :new }
        format.json { render json: @section.errors, status: :unprocessable_entity }
        format.js {}
      end
    end
  end


def update
  #@section = Section.find(params[:id])

  respond_to do |format|
    if @section.update(section_params)
      format.html { redirect_to @section, notice: 'Section was successfully updated.' }
      format.json { head :no_content } # 204 No Content
    else
      format.html { render action: "edit" }
      format.json { render json: @section.errors, status: :unprocessable_entity }
    end
  end
end

  # PATCH/PUT /sections/1
  # PATCH/PUT /sections/1.json
  #def update
   # respond_to do |format|
    #  if @section.update(section_params)
     #   format.html { redirect_to @section, notice: 'Section was successfully updated.' }
      #  format.json { render :show, status: :ok, location: @section }
      #else
       # format.html { render :edit }
        #format.json { render json: @section.errors, status: :unprocessable_entity }
      #end
    #end
  #end

  # DELETE /sections/1
  # DELETE /sections/1.json
  def destroy
    @section.destroy
    respond_to do |format|
      format.html { redirect_to sections_url, notice: 'Section was successfully destroyed.' }
      format.json { head :no_content }
      format.js {}
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_section
      @section = Section.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def section_params
      params.require(:section).permit(:section, :course_id)
    end
end
