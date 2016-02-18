class PostsController < ApplicationController
  before_action :logged_in_user, only: [:new, :create]

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      flash[:success] = "Post created!"
      redirect_to root_url
    else
      redirect_to new_post_path
    end
  end

  def index
    @posts = current_user.posts.all if logged_in?
  end

  private

    def post_params
      params.require(:post).permit(:content)
    end
end
