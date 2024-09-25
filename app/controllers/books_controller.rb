class BooksController < ApplicationController
  before_action :set_book, only: [:show]
  
  def show
    respond_to do |format|
      if @book
        format.json { render :show, status: :ok }
        format.html { render :show }
      else
        format.json { render_error('Book not found', :not_found) }
        format.html { redirect_to root_path, alert: 'Book not found' }
      end
    end
  end
  
  private
  
    def set_book
      id = params[:id]&.strip
      field = params[:field]&.strip || :isbn_13

      return render_error('ID parameter is required', :bad_request) if id.blank?

      @book = Book.find_by({
        field.to_sym => id
      })
    end
    
    def render_error(message, status)
      render json: { error: message }, status: status
    end
end