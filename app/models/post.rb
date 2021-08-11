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
  def cheered_by?(user)
    cheers.where(customer_id: customer.id).exists?
  end

  scope :created_today, -> { where(created_at: Time.zone.now.all_day) } # 今日
  scope :created_yesterday, -> { where(created_at: 1.day.ago.all_day) } # 前日
  scope :created_2day_ago, -> { where(created_at: 2.day.ago.all_day) } # 2日前
  scope :created_3day_ago, -> { where(created_at: 3.day.ago.all_day) } # 3日前
  scope :created_4day_ago, -> { where(created_at: 4.day.ago.all_day) } # 4日前
  scope :created_5day_ago, -> { where(created_at: 5.day.ago.all_day) } # 5日前
  scope :created_6day_ago, -> { where(created_at: 6.day.ago.all_day) } # 6日前
  scope :created_this_week, -> { where(created_at: 6.day.ago.beginning_of_day..Time.zone.now.end_of_day) } #今週
  scope :created_last_week, -> { where(created_at: 2.week.ago.beginning_of_day..1.week.ago.end_of_day) } # 先週


  def self.search_for(keyword)
    Post.where('text LIKE ?', '%' + keyword + '%')
  end

  def Post.search(search_word)
    Post.where(['category LIKE ?', "#{search_word}"])
  end

end
