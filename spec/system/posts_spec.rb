require 'rails_helper'
# require 'rspec/rails'
# support 配下のfileを読み込む
Dir[Rails.root.join('spec/support/*.rb')].each { |f| require f }

describe 'Posts', type: :system do
  
  it '新しい投稿を作成できる' do
    # 投稿作成ページに移動
    visit new_post_path

    # フォームに入力
    fill_in 'Content', with: '投稿の内容'

    # 作成ボタンをクリック
    click_button 'submit'

    # 結果を確認
    expect(page).to have_content('投稿が作成されました')
    expect(page).to have_content('新しい投稿')
  end
end
