class Public::SympathiesController < ApplicationController

  before_action :authenticate_customer!

  def create
    # # 共感を押したタイミングで通知レコードを作成する
    @sympathy = current_customer.sympathies.build({post_id: params[:post_id], customer_id: current_customer.id})
    # build:外部キーに値が入った状態でインスタンスが生成できる。
    @post = @sympathy.post
    @sympathy.save
    post = Post.find(params[:post_id])
    post.create_notification_sympathy!(current_customer)
    # 共感を押したタイミングで通知レコードを作成する
  end

  def destroy
    @post = Post.find(params[:post_id])
    sympathy = @post.sympathies.find_by(customer_id: current_customer.id)
    sympathy.destroy
  end

end
