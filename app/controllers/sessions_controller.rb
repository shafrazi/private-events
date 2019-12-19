class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:email])
    if user
      flash[:success] = "Logged in successfully."
      login(user)
      redirect_to user
    else
      render "new"
    end
  end

  def destroy
    logout
    redirect_to root_path
  end
end
