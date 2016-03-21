class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]  

  def index
    @users = User.all
  end
  
  def new
    @user = User.new
    @clubs = Club.all
  end

  # GET /clubs/1/edit
  def edit
  end

  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to @user, notice: 'User was successfully created.'
    else
      render :new
    end
  end

  def update
    if @user.update(user_params)
      redirect_to @user, notice: 'User was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @user.destroy
    redirect_to users_url, notice: 'User was successfully destroyed.'
  end

  def show
    if current_user != @user
      redirect_to root_path
    end
    @clubs = @user.clubs
    @current_user = current_user
    @all_clubs = Club.all
  end

  private
    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
    end
end
