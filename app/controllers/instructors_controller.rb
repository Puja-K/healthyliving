class InstructorsController < InheritedResources::Base

  private

    def instructor_params
      params.require(:instructor).permit(:name, :details, :avatar)
    end
end

