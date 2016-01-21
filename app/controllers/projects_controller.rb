class ProjectsController < ApplicationController
  def index
    @projects = Project.all
    authorize @projects
  end

  def new
    @project = Project.new
    authorize @project
  end

  def show
    @project = Project.find(params[:id])
    @documents = @project.documents
    authorize @project
  end

  def edit
    @project = Project.find(params[:id])
    authorize @project
  end

  def update
    @project = Project.find(params[:id])
    authorize @project

    if @project.update_attributes(params.require(:project).permit(:name, :description))
      redirect_to @project
    else
      flash[:error] = "Error saving topic. Please try again."
      render :edit
  end

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
  

  private
    def project_params
      params.require(:project).permit(:name, :description)
    end
end
