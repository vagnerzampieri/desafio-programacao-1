class DocumentsController < ApplicationController
  def index
    @document = Document.new
    @sales    = Sale.all
  end
end
