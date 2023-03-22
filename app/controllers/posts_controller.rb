class PostsController < ApplicationController

  before_action :authenticate_user!, only: [:new, :create]

    def index
      if params[:search] == nil
        @posts= Post.all
      elsif params[:search] == ''
        @posts= Post.all
      else
        @posts = Post.where("about LIKE ? ",'%' + params[:search] + '%')
      end
    end

    def new
        @post = Post.new
      end
    
      def create
        post = Post.new(posts_params)
        post.user_id = current_user.id
        if post.save
          redirect_to :action => "index"
        else
          redirect_to :action => "new"
        end
      end

      def show
        @post = Post.find(params[:id])
        @comments = @post.comments
        @comment = Comment.new
      end

      def edit
        @post = Post.find(params[:id])
      end

      def update
        post = Post.find(params[:id])
        if post.update(posts_params)
          redirect_to :action => "show", :id => post.id
        else
          redirect_to :action => "new"
        end
      end

      def destroy
        post = Post.find(params[:id])
        post.destroy
        redirect_to action: :index
      end
    
      private
      def posts_params
        params.require(:post).permit(:name, :about, :image)
      end
end
