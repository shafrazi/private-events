class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Successfully signed up!"
      redirect_to user_path(@user)
      login(@user)
    else
      render "new"
    end
  end

  def show
    @user = User.find(params[:id])
    @created_events = @user.created_events
    @upcoming_attended_events = @user.attended_events.upcoming_events
    @past_attended_events = @user.attended_events.past_events
    @invited_events = @user.invited_events
  end

  private

  def user_params
    params.require(:user).permit(:name, :email)
  end
end
