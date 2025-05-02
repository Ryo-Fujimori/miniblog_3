class Relationship < ApplicationRecord
  belongs_to :follower, class_name: 'User'
  belongs_to :followed, class_name: 'User'

  # 2回フォローできないようにする
  validates :follower_id, uniqueness: { scope: :followed_id }
  # 自分自身をフォローできないようにする
  validate :cant_follow_self


  private

  def cant_follow_self
    errors.add(:base, "You cannot follow yourself") if follower_id == followed_id
  end
end
