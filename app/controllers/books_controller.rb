class BooksController < ApplicationController

  def index
    @user = current_user
    @books = Book.all
  end

  def show
     @user = current_user
     @book = Book.find(params[:id])
  end

  def new
    @book = Book.new
  end

  def edit
    @book = Book.find(params[:id])
  end

  def create
    @book = Book.new(book_params)
    @book.user = current_user
    if @book.save
      redirect_to book_path(@book.id)
    else
      render :new
    end
  end

  def update
    if @book.update(book_params)
       redirect_to user_path
    else
       render :edit
    end
  end

  def destroy
    @book = Book.find(params[:id])
    if @book.destroy
      redirect_to user_path(current_user.id)
    else
      redirect_to root_path
    end
  end

  private

  def book_params
    params.require(:book).permit(:title, :body)
  end

  #def find_book
    #@book = Book.find(params[:id])
  #end

end


