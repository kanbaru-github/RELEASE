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
    muted_customer = Relationship.where(muter_id: current_customer.id)
    if params[:sort] == "sympathy"
       @posts= all_posts.page(params[:page]).left_outer_joins(:sympathies).where.not(customer_id: muted_customer.pluck(:muted_id))
              .group('posts.id').select('posts.*, COUNT("sympathies.*") AS sympathy').order('count(post_id) desc')
      # @posts= all_posts.page(params[:page]).left_outer_joins(:sympathies).where.not(customer_id: muted_customer.pluck(:muted_id))
      #         .group('posts.id').select('posts.*, COUNT("sympathies.*") AS sympathy').order(sympathy: :desc)
    # left_outer_joins(:sympathies)でsympathiesテーブルを外部結合する。
    # 結合したテーブルをpost.idでグループ化する。共感されている対象のPostが同じ同士でグループ化する
    # select文で返すデータを指定（postテーブルの全てとsympathies_count)
    # pluck:activeモデルを継承していないと使えない。配列[]から指定したカラムを持ってくる。無いとnullになる。
    elsif params[:sort] == "cheer"
      @posts= all_posts.page(params[:page]).left_outer_joins(:cheers).where.not(customer_id: muted_customer.pluck(:muted_id))
              .group('posts.id').select('posts.*, COUNT("cheers.*") AS cheer').order('count(post_id) desc')

    else
     @posts = all_posts.page(params[:page]).reverse_order.where.not(customer_id: muted_customer.pluck(:muted_id))
    end

    # if params[:post].present?
    #   if params[:post].empty?
    #     @posts = all_posts.page(params[:page]).reverse_order.where.not(customer_id: params[:id])
    #   else
    #     @posts = Post.where('text LIKE(?)', "%#{params[:post][:keyword]}%")
    #   end
    # else
    #   @posts = all_posts.page(params[:page]).reverse_order.where.not(customer_id: params[:id])
    # end

    @all_posts_count = all_posts.count
    @categories = Category.all
  end

  def new
    @post = Post.new
    @categories = Category.all
  end

  def create
    @post = Post.new(post_params)
    @post.customer_id = current_customer.id

    if @post.save
      redirect_to posts_path, notice: '投稿しました！'
    else
      @categories = Category.all
      render :new
    end
  end

  def edit
  end

  def update
    if @post.update(post_params)
      redirect_to mypage_path, notice: '更新しました！'
    else
      render :edit
    end
  end

  def destroy
    @post.destroy
    redirect_to posts_path
  end

  def search
    @posts = Post.where('text LIKE(?)', "%#{params[:keyword]}%")
    render :index
  end

  private

  def post_params
    params.require(:post).permit(:text, :category_id, :sympathies, :cheers)
  end

  def ensure_correct_customer
    @post = Post.find(params[:id])
    unless @post.customer == current_customer
      redirect_to posts_path
    end
  end

end
