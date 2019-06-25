class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    redirect_to controller: :posts, action: :index if @user.id != current_user.id
  end

  def edit
    @user = User.find(params[:id])
    redirect_to controller: :posts, action: :index if @user.id != current_user.id
  end

  def update
    user = User.find(params[:id])
    user.update(user_params) if user.id == current_user.id
    if user.save
      redirect_to controller: :users, action: :show
    else
      render :edit
    end
  end



  def user_post
    @user = User.find(params[:id])
    @posts = Post.where(user_id: "#{params[:id]}")
  end

  private
  def user_params
    params.require(:user).permit(:name, :email)
  end
end
