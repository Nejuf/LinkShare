class LinksController < ApplicationController
  before_filter :ensure_authorized, :only => [:edit, :update, :destroy]

  def index
    @links = Link.all
    render json: @links
  end

  def new
    @link = Link.new
    render :new
  end

  def create
    @link = Link.new(params[:link])
    @link.sub_ids = params[:sub_ids]
    if @link.save
      redirect_to link_url(@link)
    else
      flash[:errors] = @link.errors.full_messages
      render :new
    end
  end

  def show
    @link = Link.find_by_id(params[:id])
    render :show
  end

  def edit
    @link = Link.find_by_id(params[:id])
    render :edit
  end

  def update
    @link = Link.find_by_id(params[:id])
    if @link.update_attributes(params[:link])
      redirect_to link_url(@link)
    else
      flash[:errors] = @link.errors.full_messages
      render :edit
    end
  end



  private
  def ensure_authorized
    unless current_user && current_user.id == @link.user_id
      flash[:errors] = ["You are not authorized to perform that action."]
      redirect_to link_url(@link)
    end
  end


end
