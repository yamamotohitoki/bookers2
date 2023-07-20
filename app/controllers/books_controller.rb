class BooksController < ApplicationController

  def index
    @user = current_user
    @books = Book.all
    @book = Book.new
  end

  def show
    @book = Book.find(params[:id])
    @user = @book.user
    @new = Book.new
  end

  def edit
      book = Book.find(params[:id])
  unless book.user.id == current_user.id
    redirect_to books_path
  end
    @book = Book.find(params[:id])
  end

  def create
    @book = current_user.books.new(book_params)
    if @book.save
      flash[:notice] = "You have created book successfully."
      redirect_to book_path(@book)
    else
      @user = current_user
      @books = Book.all
      render :index
    end
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      flash[:notice] ="You have updated book successfully."
       redirect_to book_path(@book.id)
    else
       render :edit
    end
  end

  def destroy
    @book = Book.find(params[:id])
    if @book.destroy
      redirect_to books_path
    else
      redirect_to root_path
    end
  end

  private

  def book_params
    params.require(:book).permit(:title, :body)
  end
end


