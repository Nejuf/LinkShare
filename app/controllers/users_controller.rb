class UsersController < ApplicationController

  def index
    @users = User.all
    render json: @users
  end

  def new
    @user = User.new()
  end

  def create
    @user = User.new(params[:user])

    if @user.save
      login!
      redirect_to links_url
    else
      flash[:errors] = @user.errors.full_messages
      render :new
    end
  end

  def show
    @user = User.find(params[:id])
  end

end
