class CommentsController < ApplicationController
    before_action :check_login
    before_action :find_comment, only: [:edit, :update]

    def new
        @comment = Comment.new
    end

    def create
        @comment = Comment.new(comment_params)
        if @comment.valid?
            @comment.save
            redirect_to ticket_path(@comment.ticket_id)
        else
            render :new
        end
    end

    def edit
    end

    def update
        @comment.update(comment_params)
        if @comment.valid?
            @comment.save
            redirect_to ticket_path(@comment.ticket_id)
        else
            render :edit
        end
    end

    private

    def comment_params
        params.require(:comment).permit(:text, :internal, :ticket_id, :username)
    end

    def find_comment
        @comment = Comment.find(params[:id])
    end
end
