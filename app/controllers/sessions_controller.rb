class SessionsController < ApplicationController
  def new
    # Renders login form
  end

  def create
    # Find user by email:
    @user = User.find_by({ "email" => params["email"] })
    if @user != nil && @user.authenticate(params["password"])
      session["user_id"] = @user["id"]
      flash["notice"]   = "You are now logged in."
      redirect_to "/places"
    else
      flash["notice"] = "Sorry, invalid email or password."
      redirect_to "/login"
    end
  end

  def destroy
    session["user_id"] = nil
    flash["notice"]    = "You have been logged out."
    redirect_to "/login"
  end
end
  