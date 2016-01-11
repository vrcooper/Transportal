class ProjectsController < ApplicationController
  def index
    @projects = Project.all
  end

  def new
    @project = Project.new
  end

  def create
    @project = Project.new(project_params)

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
  

  private
    def project_params
      params.require(:project).permit(:name, :attachment)
    end
end
