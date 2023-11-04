class PostsController < ApplicationController
    def create
        @user = User.find(params[:user_id])
        @post = @user.posts.create(post_params)
        @comments = @post.comments
        redirect_to user_path(@user)
    end

    def show
        @post = Post.find(params[:id])
    end

    private
    def post_params
        params.require(:post).permit(:body)
    end
end
