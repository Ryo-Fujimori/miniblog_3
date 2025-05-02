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

  it '他のユーザーの投稿を削除できない' do  
    # 他のユーザーを作成
    other_user = create(:user)
    # 他のユーザーの投稿を作成
    other_post = create(:post, user: other_user)

    # 投稿詳細ページに移動
    visit post_path(other_post)

    # 削除ボタンが表示されていないことを確認
    expect(page).not_to have_link('Delete')
  end

  it '他のユーザーの投稿を編集できない' do  
    # 他のユーザーを作成
    other_user = create(:user)
    # 他のユーザーの投稿を作成
    other_post = create(:post, user: other_user)

    # 投稿詳細ページに移動
    visit post_path(other_post)

    # 編集ボタンが表示されていないことを確認
    expect(page).not_to have_link('Edit')
  end
end
