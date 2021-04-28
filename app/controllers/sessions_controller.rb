class SessionsController < ApplicationController
  def new; end

  def create
    user = User.find_by(username: params[:session][:username])
    if user
      log_in(user)
      flash[:success] = 'Signed in successfully!'
      redirect_to user
    else
      flash.now[:danger] = 'Invalid name'
      render 'new'
    end
  end

  def destroy
    log_out
    redirect_to root_url
  end
end
