class Public::NotificationsController < ApplicationController
  
  def index
    @notifications = current_customer.passive_notifications.page(params[:page]).per(20)
    @notifications.where(checked: false).each do |notification|
      # 未確認の通知レコードだけ取り出したあと、「未確認→確認済」になるように更新
      notification.update_attributes(checked: true)
    end
  end
  
end
