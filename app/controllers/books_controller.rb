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

  def isbn
    isbn_code = params[:id]
    format = params[:format] || 'ISBN-13'
    formalize = params[:formalize].to_i == 1

    if !['ISBN-13', 'ISBN-10'].include?(format)
      render json: { error: "ISBN format not supported. Available formats are ISBN-13 & ISBN-10" }, status: :bad_request
      return
    end

    begin
      converted_isbn = ISBNHandler.call(isbn_code, format, formalize)
      render json: { value: converted_isbn }
    rescue ArgumentError => e
      render json: { error: e.message }, status: :bad_request
    rescue StandardError => e
      render json: { error: 'An unexpected error occurred', backtrace: e.backtrace }, status: :internal_server_error
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