class User < ApplicationRecord
  has_many :posts, dependant: :destroy
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :profile, length: { maximum: 200 }
end
