class VideosController < ApplicationController
	  before_action :authenticate_user!
	  before_action :set_section
	 
	  def index
	  	#@videos = Video.where("section_id = ?",  params[:section_id])
	  	@videos = Video.order('created_at DESC')
	  end

	  	def new
			@video = Video.new
			respond_to do |format|
      		
		        format.js {}
		    end
		end
		

		def create
			@video = Video.new(video_params)
			@video.section_id = @section.id
		   	respond_to do |format|
		   		if @video.save
		   			format.js{}
		   		else
					format.html { render :new }
        			format.json { render json: @video.errors, status: :unprocessable_entity }
        			format.js {}
				end
			end
	    end

		private
		def video_params
			params.require(:video).permit(:link, :title, :section_id)
		end

		def set_section
			@section = Section.find(params[:section_id])
		end
end
