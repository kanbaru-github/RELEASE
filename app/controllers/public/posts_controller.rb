class Public::PostsController < ApplicationController

  before_action :authenticate_customer!
  before_action :ensure_correct_customer, only: [:edit, :update, :destroy]

  def index
    if params[:category_id]
      @category = Category.find(params[:category_id])
      all_posts = @category.posts
    else
      all_posts = Post.includes(:category)
    end
    @posts = all_posts.page(params[:page]).reverse_order.where.not(customer_id: params[:id])
    @all_posts_count = all_posts.count
    @categories = Category.all
  end

  def new
    @post = Post.new
    @category = Category.new
  end

  def create
    @post = Post.new(post_params)
    @post.customer_id = current_customer.id
    if @post.save
      redirect_to posts_path, notice: '投稿しました！'
    else
      @posts = Post.page(params[:page]).reverse_order
      render :index
    end
  end

  def edit
  end

  def update
    if @post.update(post_params)
      redirect_to posts_path, notice: '更新しました！'
    else
      render :edit
    end
  end

  def destroy
    @post.destroy
    redirect_to posts_path
  end

  private

  def post_params
    params.require(:post).permit(:text, :category)
  end

  def ensure_correct_customer
    @post = Post.find(params[:id])
    unless @post.customer == current_customer
      redirect_to posts_path
    end
  end

end
