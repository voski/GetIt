class UsersController < ApplicationController
  before_action :logged_in_redirect, only: [:new, :create]
  before_action :logged_out_redirect, only: [:show, :index]

  def index
    @users = User.all
  end

  def new
    @user = User.new
    # render :new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      login_user(@user)
      redirect_to users_url
    else
      flash.now[:errors] = @user.errors.full_messages
      render :new
    end
  end

  def show
    @user = User.find(params[:id])
    # render :show
  end
end
