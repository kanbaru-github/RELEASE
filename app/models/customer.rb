class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  scope :only_active, -> { where(is_active: true) }
  validates :email, presence: true, uniqueness: true

  has_many :posts

end
