class Public::SympathiesController < ApplicationController

  before_action :authenticate_customer!

  def create
    @post = Post.find(params[:post_id])
    sympathy = @post.sympathies.new(customer_id: current_customer.id)
    sympathy.save
  end

  def destroy
    @post = Post.find(params[:post_id])
    sympathy = @post.sympathies.find_by(customer_id: current_customer.id)
    sympathy.destroy
  end

end
