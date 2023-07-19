class UsersController < ApplicationController
  before_action :find_user, only: [:show, :edit, :update,]

  def index
    @user = current_user
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @books = @user.books
  end

  def new
    @user = User.new
  end

  def edit
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to user_path(current_user.id)
    else
      render :new
    end
  end

  def update
    if @user.update(user_params)
      redirect_to user_path(current_user.id)
    else
      render :edit
    end
  end

  def destroy
  end

  private

  def find_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :image, :introduction)
  end
end
