class BooksController < ApplicationController
  def index
    @books = Book.all.order("ID ASC")
  end

  def new
    @book = Book.new
  end

  def edit
    @book = Book.find(params[:id])
  end

  def show
    @book = Book.find(params[:id])
  end
  
  def create
    @book = Book.new
    if @book.after_save
      redirect_to books_path
    else
      render 'new'
    end
  end

  def update
    @book = Book.find(params[:id])
    @book.update(book_param)
    redirect_to books_path
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_path
  end
  private
  def book_param
    params.require(:book).permit(:title, :isbn, :views)
  end
end
