# Admin用のデータを作成する
User.create!(
  email: 'Admin@sample.com',
  password: 'initAdmin',
  password_confirmation: 'initAdmin'
)

# 一般ユーザー用のデータを作成する
100.times do |n| 
  User.create!(
    email: Faker::Internet.unique.email,
    password: 'initUser123',
    password_confirmation: 'initUser123'
  )
end
