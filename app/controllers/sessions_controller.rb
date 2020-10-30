class SessionsController < ApplicationController
  def new
    user = User.new
  end

  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      
      if params[:remember]
        remember(user)
      end
      
      flash.now[:notice] = 'You are connected'
      redirect_to root_path

    else
      flash.now[:alert] = 'Invalid email/password combination'
      render :new
    end
  end

  def destroy
    log_out(current_user)
    redirect_to root_path
  end
end
