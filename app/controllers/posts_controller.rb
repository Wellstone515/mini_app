class PostsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @posts = Post.order(id: "desc")
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    post = Post.create(post_params)
    if post.save
      redirect_to controller: :posts, action: :index
    else
      render :new
    end
  end

  def edit
    @post = Post.find(params[:id])
    redirect_to controller: :posts, action: :index if @post.user_id != current_user.id
  end

  def update
    @post = Post.find(params[:id])
    @post.update(post_params) if @post.user_id == current_user.id
    if @post.save
      redirect_to controller: :posts, action: :show
    else
      render :edit
    end
  end

  def destroy
    post = Post.find(params[:id])
    post.destroy if post.user_id == current_user.id
    redirect_to controller: :posts, action: :index, alert: '削除？'
  end

  private
  def post_params
    params.require(:post).permit(:body).merge(user_id: current_user.id)
  end
end
