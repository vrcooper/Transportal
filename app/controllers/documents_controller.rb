class DocumentsController < ApplicationController
  def index
   @documents= Document.all
   authorize @documents
  end

  def new
    @document = Document.new
    authorize @document
  end

  def create
    @document = Document.new(document_params)
  
    if @document.save
      redirect_to documents_path, notice: "The document #{@document.name} has been uploaded."
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
  end

 

  def edit
  end

private
  def document_params
    params.require(:document).permit (:name, :attachment)
  end
end