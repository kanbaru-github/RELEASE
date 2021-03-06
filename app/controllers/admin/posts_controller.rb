class Admin::PostsController < ApplicationController

  before_action :authenticate_admin!

  def index
    if params[:emotions]
      all_posts = Post.where(emotions: params[:emotions])
    else
      all_posts = Post.includes(:category)
    end
    if params[:sort] == "sympathy"
      @posts = all_posts.page(params[:page]).left_outer_joins(:sympathies).group('posts.id').
        select('posts.*, COUNT("sympathies.*") AS sympathy').order('count(post_id) desc')
    elsif params[:sort] == "cheer"
      @posts = all_posts.page(params[:page]).left_outer_joins(:cheers).group('posts.id').
        select('posts.*, COUNT("cheers.*") AS cheer').order('count(post_id) desc')
    else
      @posts = all_posts.page(params[:page]).reverse_order
    end
    @all_posts_count = all_posts.count
    @categories = Category.all
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to admin_posts_path
  end

  def search
    @posts = Post.where('text LIKE(?)', "%#{params[:keyword]}%")
    render :index
  end

  private

  def post_params
    params.require(:post).permit(:text, :category_id, :sympathies, :cheers)
  end
end
