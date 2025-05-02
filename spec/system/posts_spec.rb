require 'rails_helper'
# require 'rspec/rails'
# support 配下のfileを読み込む
Dir[Rails.root.join('spec/support/*.rb')].each { |f| require f }

describe 'Posts', type: :system do
  # ユーザー作成
  let(:user) { create(:user) }
  # 投稿作成
  let(:post) { create(:post, user: user) }
  
  # ユーザーでログイン
  before do
    sign_in user, scope: :user
  end

  it '新しい投稿を作成できる' do
    # 投稿作成ページに移動
    visit new_users_post_path

    # フォームに入力
    fill_in 'Content', with: '投稿の内容'

    # 作成ボタンをクリック
    click_button 'submit'

    # 結果を確認
    expect(page).to have_content('Post was successfully created.')
    expect(page).to have_content('投稿の内容')
  end

  it '投稿を編集できる' do
    # 投稿編集ページに移動
    visit edit_users_post_path(post)

    # フォームに入力
    fill_in 'Content', with: '新しい投稿の内容'

    # 更新ボタンをクリック
    click_button 'submit'

    # 結果を確認
    expect(page).to have_content('Post was successfully updated.')
    expect(page).to have_content('新しい投稿の内容')
  end

  it '投稿を削除できる' do
    # 投稿詳細ページに移動
    visit post_path(post)
    # 投稿の内容を確認
    expect(page).to have_content('投稿の内容')
    # 削除ボタンをクリック
    click_link 'Delete'

    # 結果を確認
    expect(page).to have_content('Post was successfully destroyed.')
    expect(page).not_to have_content('投稿の内容')
  end
end
