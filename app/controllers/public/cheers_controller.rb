class Public::CheersController < ApplicationController

  before_action :authenticate_customer!

  def create
    @post = Post.find(params[:post_id])
    cheer = @post.cheers.new(customer_id: current_customer.id)
    cheer.save
  end

  def destroy
    @post = Post.find(params[:post_id])
    cheer = @post.cheers.find_by(customer_id: current_customer.id)
    cheer.destroy
  end

end
