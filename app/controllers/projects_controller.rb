class ProjectsController < ApplicationController
  def index
    @projects = Project.all
    authorize @projects
  end

  def new
    @project = Project.new
    authorize @project
  end

  def create
    @project = Project.new(project_params)
    #@project.user = current_user
    #authorize @project

    if @project.save
      redirect_to projects_path, notice: "The project #{@project.name} has been uploaded."
    else
      render "new"
    end
  end

  def destroy
    @project = Project.find(params[:id])
    @project.destroy
    redirect_to projects_path, notice: "The project #{@project.name} has been deleted."
  end
  
    # def translate
    # end

    # def edit
    # end

    # def proofread
    # end

    # def project_manage
    # end



  private
    def project_params
      params.require(:project).permit(:name, :attachment)
    end
end
