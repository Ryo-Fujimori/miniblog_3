FactoryBot.define do
  factory :post do
    content { '投稿の内容' }
    association :user
  end
end
