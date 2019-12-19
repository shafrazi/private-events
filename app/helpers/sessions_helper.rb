module SessionsHelper
  def login(user)
    session[:user_id] = user.id
  end

  def current_user
    user = User.find_by(id: session[:user_id])
  end

  def logged_in?
    if current_user
      return true
    else
      return false
    end
  end

  def logout
    if logged_in?
      session.delete(:user_id)
      current_user = nil
    end
  end
end
