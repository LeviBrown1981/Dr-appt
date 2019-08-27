class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  
  def index
    @users = current_user.appts
  end

  def show
  end

  def new
    @user = User.new
  end

  def create
    @user = current_user.appts.new(user_params)
    if @user.save
      flash[:success] = "User Created"
      redirect_to users_path
    else
      flash[:error] = "Error #{@user.errors.full_messages.join("\n")}"
      render :new
    end
  end

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to users_path
    else
      render :edit
    end
  end

  def destroy
    @user.destroy
    redirect_to users_path
  end

  private

  def user_params
    params.require(:user).permit(:name)
  end

  def set_user@user = current_user.accounts.find(params[:id])
  end

end
