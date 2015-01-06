class DocumentsController < ApplicationController
  def index
    @document = Document.new
    @sales    = Sale.all
  end

  def create
    @document = Document.new(parameters)
    if @document.save
      Sale.importing(@document.file.path)
      redirect_to root_path, notice: 'Salvo!'
    else
      redirect_to root_path, alert: 'Documento inválido'
    end
  end

  private

  def parameters
    params[:document] = {file: ''} unless params[:document].present?
    params.require(:document).permit(:file)
  end
end
