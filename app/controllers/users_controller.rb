class UsersController < ApplicationController

  before_action :correct_user, only: [:edit, :update]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
   if @user.save
    redirect_to root_path, notice: 'ユーザー新規登録を完了しました'
   else
    render :new
   end
  end

  def index
    @users = User.all
    @user = current_user
    @book = Book.new
  end

  def show
    @user = User.find(params[:id])
    @books = @user.books.page(params[:page]).reverse_order
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
   if  @user.update(user_params)
    flash[:notice] = "You have updated user successfully."
    redirect_to user_path(@user)
   else
    render :edit
   end
  end

  private

  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end

  def correct_user
    @user = User.find(params[:id])
    redirect_to(user_path) unless @user == current_user
  end

end
