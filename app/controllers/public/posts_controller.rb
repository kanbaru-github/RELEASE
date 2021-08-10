class Public::PostsController < ApplicationController

  before_action :authenticate_customer!
  before_action :ensure_correct_customer, only: [:edit, :update, :destroy]

  def index
    @posts = Post.page(params[:page]).reverse_order
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    # 誰が投稿を行ったかを知るため
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
    # ここで定義しているのでedit,update,destroyには定義は不要
    @post = Post.find(params[:id])
    unless @post.customer == current_customer
      redirect_to posts_path
    end
  end

end
