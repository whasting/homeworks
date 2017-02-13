class BooksController < ApplicationController
  def index
    @books = Book.all
  end

  def new

  end

  def create
    Book.create(title: params[:book][:title],
                author: params[:book][:author])
    redirect_to "http://localhost:3000/books"
    # render json: params[:book]
  end

  def destroy
    # render json: params
    book_to_delete = Book.find(params[:id])
    book_to_delete.destroy
    redirect_to "http://localhost:3000/books"
  end

  private
  def book_params
    params.require(:book).permit(:title, :author)
  end
end
