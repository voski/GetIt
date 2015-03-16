class SessionsController < ApplicationController
  before_action :logged_in_redirect, only: [:new, :create]

  def new
    @user = User.new
  end

  def create
    @user = User.find_by_credentials(user_params)

    if @user
      login_user(@user)
      redirect_to users_url
    else
      flash.now[:error] = ["Invalid credentials try again or sign up"]
      @user = User.new
      render :new
    end
  end

  def destroy
    logout!
    redirect_to new_session_url
  end
end
