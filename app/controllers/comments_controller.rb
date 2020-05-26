class CommentsController < ApplicationController

  before_action :find_comment, only: [:show, :edit, :update, :destroy]
  def index
    @comments = Comment.all
  end

  def show
  end

  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.new(comment_params)
    @comment.ticket = Ticket.first #change this you idiots
    if @comment.valid?
        @comment = Comment.find_or_create_by(text: @comment.text)
        redirect_to comment_path(@comment)
    else
      render :new
    end
  end

  def edit

  end

  def update
    @comment.update
    if @comment.valid?
      @comment.save
      redirect_to comment_path(@comment)
    else
      render :edit
    end
  end

  def destroy
    @comment.destroy
    redirect_to comments_path(@comment)
  end

  private

  def comment_params
    params.require(:comment).permit(:text, :internal)
  end

  def find_comment
    @comment = Comment.find(params[:id])
  end
end
