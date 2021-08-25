class Public::CheersController < ApplicationController
  before_action :authenticate_customer!

  def create
    @cheer = current_customer.cheers.build({ post_id: params[:post_id], customer_id: current_customer.id })
    @post = @cheer.post
    @cheer.save
    #  通知
    post = Post.find(params[:post_id])
    post.create_notification_cheer!(current_customer)
  end

  def destroy
    @post = Post.find(params[:post_id])
    cheer = @post.cheers.find_by(customer_id: current_customer.id)
    cheer.destroy
  end
end
