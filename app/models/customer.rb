class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  scope :only_active, -> { where(is_active: true) }
  validates :email, presence: true, uniqueness: true

  has_many :posts
  has_many :sympathies, dependent: :destroy
  has_many :cheers, dependent: :destroy

  # 自分がミュートされる側の関係性
  has_many :reverse_of_relationships, class_name: "Relationship", foreign_key: "muted_id", dependent: :destroy
  # 自分がミュートする側の関係性
  has_many :relationships, class_name: "Relationship", foreign_key: "muter_id", dependent: :destroy
  # ミュート関係を通じて参照→自分をミュートしている人
  has_many :muters, through: :reverse_of_relationships, source: :muter
  # 与ミュート関係を通じて参照→自分がミュートしている人
  has_many :mutings, through: :relationships, source: :muted

  def mute(customer_id)
    relationships.create(muted_id: customer_id)
  end

  def unmute(customer_id)
    relationships.where(muted_id: customer_id).destroy_all
  end

  def muting?(customer)
    # relationships.include?(customer)
    # ミュートしているidを
    mutings.include?(customer)
  end

  has_many :active_notifications, class_name: 'Notification', foreign_key: 'visitor_id', dependent: :destroy
  # active_notifications：自分からの通知
  has_many :passive_notifications, class_name: 'Notification', foreign_key: 'visited_id', dependent: :destroy
  # passive_notifications：相手からの通知
end
