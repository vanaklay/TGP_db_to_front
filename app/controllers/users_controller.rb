class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(first_name: params[:first_name], last_name: params[:last_name],
       email: params[:email], description: params[:description], age: params[:age], 
       password: params[:password], password_confirmation: params[:password_confirmation],
      city: City.all.sample)
    if @user.save
      flash[:notice] = "New User Save in DB"
      redirect_to new_session_path
    else
      flash.now[:alert] = "We cannot create your profile for this reason(s) :"
      puts @user.errors.messages
      render :new
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private
  def user_params
    user_params = params.require(:user).permit(:first_name, :last_name, :email, :description, :age, :password, :password_confirmation)
  end
end
