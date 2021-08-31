class Post < ApplicationRecord
  
  attachment :image

  belongs_to :customer
  belongs_to :category

  validates :text, presence: true
  validates :category, presence: true

  has_many :sympathies, dependent: :destroy
  def sympathied_by?(customer)
    sympathies.where(customer_id: customer.id).exists?
  end

  has_many :cheers, dependent: :destroy
  def cheered_by?(customer)
    cheers.where(customer_id: customer.id).exists?
  end

  scope :created_today, -> { where(created_at: Time.zone.now.all_day) } # 今日
  scope :created_yesterday, -> { where(created_at: 1.day.ago.all_day) } # 前日
  scope :created_2day_ago, -> { where(created_at: 2.day.ago.all_day) } # 2日前
  scope :created_3day_ago, -> { where(created_at: 3.day.ago.all_day) } # 3日前
  scope :created_4day_ago, -> { where(created_at: 4.day.ago.all_day) } # 4日前
  scope :created_5day_ago, -> { where(created_at: 5.day.ago.all_day) } # 5日前
  scope :created_6day_ago, -> { where(created_at: 6.day.ago.all_day) } # 6日前
  scope :created_this_week, -> { where(created_at: 6.day.ago.beginning_of_day..Time.zone.now.end_of_day) } # 今週
  scope :created_last_week, -> { where(created_at: 2.week.ago.beginning_of_day..1.week.ago.end_of_day) } # 先週

  def self.search_for(keyword)
    Post.where('text LIKE ?', '%' + keyword + '%')
  end

  def Post.search(search_word)
    Post.where(['category LIKE ?', "#{search_word}"])
  end

  # 通知機能
  has_many :notifications, dependent: :destroy
  # 共感
  def create_notification_sympathy!(current_customer)
    # すでに「共感」されているか検索
    temp = Notification.where(["visitor_id = ? and visited_id = ? and post_id = ? and action = ? ", current_customer.id, customer_id, id, 'Sympathy'])
    # 共感されていない場合のみ、通知レコードを作成
    # ?:「プレースホルダ」と言って、「?」を指定した値で置き換えることができるもの。SQLインジェクションを防ぐためにも、必須のセキュリティ対策になります。
    if temp.blank?
      # blank?:オブジェクトが空白の場合はtrueを返し、オブジェクトが空白ではない場合はfalseを返すメソッド
      notification = current_customer.active_notifications.new(
        post_id: id,
        visited_id: customer_id,
        action: 'Sympathy'
      )
      # 自分の投稿に対するいいねの場合は、通知済みとする
      if notification.visitor_id == notification.visited_id
        notification.checked = true
      end
      notification.save if notification.valid?
    end
  end

  # 応援
  def create_notification_cheer!(current_customer)
    temp = Notification.where(["visitor_id = ? and visited_id = ? and post_id = ? and action = ? ", current_customer.id, customer_id, id, 'Cheer'])
    if temp.blank?
      notification = current_customer.active_notifications.new(
        post_id: id,
        visited_id: customer_id,
        action: 'Cheer'
      )
      if notification.visitor_id == notification.visited_id
        notification.checked = true
      end
      notification.save if notification.valid?
    end
  end
end
