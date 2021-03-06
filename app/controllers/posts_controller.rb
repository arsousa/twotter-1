class PostsController < ApplicationController
  include HandlesAuthorization
  
  before_action :load_user
  before_action :require_user, except: [:index, :show]

  def index
    @posts = @user ? @user.posts : Post.latest
    @posts = @posts.page(params[:page])
  end

  def show
    @post = Post.find(params[:id])
  end

  def timeline
    @posts = current_user
      .timeline_posts
      .order(created_at: :desc)
      .page(params[:page])
  end

  def create
    @post = @user.posts.new(post_params)
    if @post.save
      redirect_back fallback_location: @user
    else
      render :new
    end
  end


  private

  def load_user
    if params[:user_id]
      @user = User.find(params[:user_id])
    end
  end

  def post_params
    params.require(:post).permit(:body)
  end
end
