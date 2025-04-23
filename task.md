## Gemfile編集
- gem "devise"
- gem "haml-rails"
- gem "simple_form"
- gem 'pagy'
- gem 'sgcop', github: 'SonicGarden/sgcop'

- group :development :test
  gem "haml-lint"
  gem "bullet"
  gem 'factory_bot_rails'
  gem 'rspec-rails'
  
- group :development
  gem "faker"
## gemのインストール
- bundle install

- simple formのインストール
  - rails generate simple_form:install --bootstrap
- erb -> haml変換
  - rails haml:erb2haml

## Userの新規作成、ログイン実装
- Deviceの初期設定
  - rails g devise:install
- Userモデル作成
  - rails g devise User
  - Userモデルのマイグレーションファイルに追加
    - create_table :users do |t|
      t.string :name
      t.text :profile
      t.string :blog_url
  - rails db:migrate
  - プロフィールを200文字以内にする

## Userのresource作成
- rails g controller users

## Userのテスト作成
- factoryでユーザーのひな形を作る
- UserのResourceが動くことの確認
- edit画面でプロフィール200文字以上でエラーになる
