class Public::CustomersController < ApplicationController

  before_action :authenticate_customer!
  before_action :set_current_customer

  def show
    @customer = current_customer
    @posts = @customer.posts

    @customer_posts = @customer.posts
    @sympathies_count = 0
    @customer_posts.each do |post|
      @sympathies_count += post.sympathies.count
    end
    @cheers_count = 0
    @customer_posts.each do |post|
      @cheers_count += post.cheers.count
    end

    @today_post =  @posts.created_today
    @yesterday_post = @posts.created_yesterday
    @this_week_post = @posts.created_this_week
    @last_week_post = @posts.created_last_week
  end

  def search
    @customer = Customer.find(params[:customer_id])
    @posts = @customer.post
    @post = Post.new
    if params[:created_at] == ""
      @search_post = "日付を選択してください"
    else
      create_at = params[:created_at]
      @search_post = @posts.where(['created_at LIKE ? ', "#{create_at}%"]).count
    end
  end

  def edit
    @customer = current_customer
  end

  def update
    if @customer.update(customer_params)
      redirect_to mypage_path, notice: '会員情報の更新が完了しました。'
    else
      render :edit
    end
  end

  def unsubscribe
  end

  def withdraw
    @customer.update(is_active: false)
    reset_session
    redirect_to root_path
  end

  def mute
  end

  def muted
  end

  private

  def set_current_customer
    @customer = current_customer
  end

  def customer_params
    params.require(:customer).permit(:email)
  end

end
