class SubsController < ApplicationController
  before_filter :ensure_authorized, only: [:edit, :update, :destroy]

  def index
    @subs = Sub.all
    render json: @subs
  end

  def new
    @sub = Sub.new
    render :new
  end

  def create
    @sub = Sub.new(params[:sub])
    @sub.links.build(params[:links].select{|link| !link["url"].empty? && !link["title"].empty?})

    if @sub.save
      redirect_to sub_url(@sub)
    else
      flash[:errors] = @sub.errors.full_messages
      render :new
    end
  end

  def show
    @sub = Sub.find_by_id(params[:id])
    render json: @sub
  end

  def ensure_authorized
    sub = Sub.find_by_id(params[:id])
    unless current_user && current_user.id == sub.mod_id
      flash[:errors] = ["Only the moderator can perform that action."]
      redirect_to subs_url
    end
  end
end
