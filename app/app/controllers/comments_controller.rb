class CommentsController < ApplicationController
    def create
        @post = Post.find(params[:post_id])
        @comment = @post.comments.create(comment_params)
        redirect_to post_path(@post)

        if @comment.save
            redirect_to User.find(@post.user_id)
        else
            render :new, status: :unprocessable_entity
        end
    end

    private
    def comment_params
        params.require(:comment).permit(:email, :body)
    end
end
