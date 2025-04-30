Faker::Internet.unique.clear
# Admin用のデータを作成する
User.create!(
  email: 'Admin@sample.com',
  password: 'initAdmin',
  password_confirmation: 'initAdmin'
)

# 一般ユーザー用のデータを作成する
100.times do |n| 
  user = User.create!(
    email: "user#{n}@example.com",
    password: 'initUser123',
    password_confirmation: 'initUser123'
  )
  # 作成したユーザーで投稿を作成する
  user.posts.create!(
    content: Faker::Lorem.paragraph
  )
end
