require 'rails_helper'

RSpec.describe "Users", type: :system do
  # ユーザー作成
  let(:user) { create(:user) }

  # ユーザーでログイン
  before do
    sign_in user, scope: :user
  end

  it 'ユーザーをフォローできる' do
    # フォローするユーザーを作成
    followed_user = create(:user)

    # ユーザー一覧ページに移動
    visit users_path

    # フォローするユーザーのフォローボタンをクリック
    click_link "フォロー"

    # 結果を確認
    expect(page).to have_content('フォローしました')
  end

  it 'ユーザーのフォローを解除できる' do
    # フォローするユーザーを作成
    followed_user = create(:user)
    # フォローするユーザーをフォロー
    user.follow(followed_user)

    # ユーザー一覧ページに移動
    visit users_path

    # フォロー解除ボタンをクリック
    click_link "フォロー解除"

    # 結果を確認
    expect(page).to have_content('フォロー解除しました')
  end
  
end
