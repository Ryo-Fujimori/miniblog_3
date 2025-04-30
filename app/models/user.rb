class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :validatable
  has_many :posts, dependent: :destroy
  validates :profile, length: { maximum: 200 }
end
