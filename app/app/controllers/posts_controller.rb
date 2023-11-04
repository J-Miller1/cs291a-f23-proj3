class PostsController < ApplicationController
    def create
        @user = User.find(params[:user_id])
        @post = @user.posts.create(post_params)
        @comments = @post.comments
        if @post.save
            redirect_to user_path(@user)
        else
            render "users/show", status: :unprocessable_entity
        end
    end

    def show
      begin
        @post = Post.find(params[:id])
      rescue ActiveRecord::RecordNotFound => ex
        redirect_to "/404"
      end
    end

    def edit
        @post = Post.find(params[:id])
      end
    
      def update
        @post = Post.find(params[:id])
    
        if @post.update(post_params)
          redirect_to @post
        else
          render :edit, status: :unprocessable_entity
        end
      end
    
      def destroy
        @post = Post.find(params[:id])
        @post.destroy
    
        redirect_to root_path, status: :see_other
      end

    private
    def post_params
        params.require(:post).permit(:body)
    end
end
