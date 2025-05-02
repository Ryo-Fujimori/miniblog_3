class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :validatable

  has_many :posts, dependent: :destroy
  has_many :active_relationships, class_name: "Relationship",
  foreign_key: "follower_id", dependent: :destroy
  has_many :passive_relationships, class_name: "Relationship",
  foreign_key: "followed_id", dependent: :destroy

  validates :profile, length: { maximum: 200 }

  def follow(other_user)
    active_relationships << Relationship.new(followed_id: other_user.id)
  end

  def unfollow(other_user)
    active_relationships.find_by(followed_id: other_user.id).destroy!
  end
  
  def following?(other_user)
    active_relationships.find_by(followed_id: other_user.id).present?
  end
end
