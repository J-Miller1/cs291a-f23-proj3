class CommentsController < ApplicationController
    def create
        @post = Post.find(params[:post_id])
        @comment = @post.comments.create(comment_params)
        @user = User.find(@post.user_id)

        if @comment.save
            redirect_to @user
        else
            render :new, status: :unprocessable_entity
        end
    end

    private
    def comment_params
        params.require(:comment).permit(:email, :body)
    end
end
