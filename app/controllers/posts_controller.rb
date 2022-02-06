class PostsController < ApplicationController
  before_action :require_login

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
    @user = current_user
  end

  def create
    @user = current_user
    @post = @user.posts.new(post_params)

    if @post.save
      redirect_to :home
    else
      redirect_to :home
      flash.notice = "unable to create post"
    end
  end

  def show
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :content, :user_id)
  end

end
