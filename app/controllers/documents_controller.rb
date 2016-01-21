class DocumentsController < ApplicationController
  def index
   @documents = Document.all
   authorize @documents
  end

  def new
    @document = Document.new
    authorize @document
  end

  def create
    @document = Document.new(document_params)
    @project = Project.find(params[:project_id])
    @document.project = @project
    if @document.save
      redirect_to @project, notice: "The document #{@document.name} has been uploaded."
    else
      render "new"
    end
  end

  def show
    #/projects/:project_id/documents/:id
    @project = Project.find(params[:project_id])
    @document = Document.find(params[:id])
    authorize @project
  end


 

  def edit
    @document = Document.find(params[:id])
    authorize @document
  end

  def update
    @document = Document.find(params[:id])
    authorize @document

    if @document.update_attributes(params.require(:document).permit(:name, :attachment, :description))
      redirect_to @document
    else
      flash[:error] = "Error saving document. Please try again."
      render :edit
  end

end

def destroy
    @project = Project.find(params[:project_id])
    @document = Document.find(params[:id])
    

    if @document.destroy 
      flash[:notice] =  "\"#{@document.name}\" was deleted successfully."
      redirect_to @project

    else flash[:error] = "There was an error deleting the document."
      render :show
    
    end
  end


private
  def document_params
    params.require(:document).permit(:name, :attachment, :description)
  end
end