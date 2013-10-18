class CommentsController < ApplicationController

  def new
    @comment = Comment.new(params[:comment])
  end

  def create
    @comment = Comment.new(params[:comment])

    if @comment.save
      redirect_to link_url(@comment.link_id)
    else
      flash[:errors] = @comment.errors
      render :new
    end
  end

  def edit
    @comment = Comment.find_by_id(params[:id])
  end

  def update
    @comment = Comment.find_by_id(params[:id])
    if @comment.update_attributes(params[:comment])
      redirect_to link_url(@comment.link_id)
    else
      flash[:errors] = @comment.errors
      render :edit
    end
  end

  def show
    @comment = Comment.find_by_id(params[:id])
  end
end
