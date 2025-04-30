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

## Postモデル作成
- rails g model Post
- マイグレーションファイル作成
  - create_table :posts do |t|
      t.text :content
    end
    add_reference :posts, :user, index: { unique: true }
- rails db:migrate
- userモデルに従属させる
  - belongs_to :user
- contentを140文字以内に制限
 - validates :content, presence: :true, length: {maximum: 2}
- user_idは必須にする
  - validates :user_id, presence: :true
## Userモデル修正
- UserはPostを複数所有する
  - has_many :posts, dependant: :destroy
## postのresource作成
- rails g controller posts
- 人が書いた投稿を消せないようにする
- 人の投稿には編集ボタンや消去ボタンひょうじさせないようにする
- 自分自身をフォロー出来ないようにする

- i18nで多言語対応
- Postのコントローラー分割

## フォロー機能作成
- relationshipモデル作成
  - rails g model relationship
- マイグレーションにはUserへの参照を持つ
- relationもusersのnamespaceで管理する
