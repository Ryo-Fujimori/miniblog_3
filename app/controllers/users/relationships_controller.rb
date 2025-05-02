class Users::RelationshipsController < ApplicationController
  before_action :set_user, only: %i[create destroy]

  def create
    if current_user.follow(@user)
      redirect_to users_path, notice: t('users.relationships.follow_success')
    else
      redirect_to users_path, alert: t('users.relationships.follow_failure')
    end
  end

  def destroy
    if current_user.unfollow(@user)
      redirect_to users_path, notice: t('users.relationships.unfollow_success')
    else
      redirect_to users_path, alert: t('users.relationships.unfollow_failure')
    end
  end

  private

  def set_user
    @user = User.find(params[:id])
  end
end
