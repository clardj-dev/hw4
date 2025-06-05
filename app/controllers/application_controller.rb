class ApplicationController < ActionController::Base
  helper_method :current_user, :logged_in?

  private

  def current_user
    if session["user_id"]
      @current_user ||= User.find_by({ "id" => session["user_id"] })
    end
  end

  def logged_in?
    current_user != nil
  end

  def require_login
    unless logged_in?
      flash["notice"] = "You must be logged in to access that page"
      redirect_to "/login"
    end
  end
end
