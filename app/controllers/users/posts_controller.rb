class Users::PostsController < ApplicationController
  before_action :set_post, only: %i[edit update destroy]
  # before_action :authenticate_user!, except: %i[index show]
  # before_action :correct_user, only: %i[edit update destroy]
  
  # def index
  #   @posts = Post.all
  # end

  # def show
  # end

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.create(post_params)
    if @post.save
      redirect_to posts_path, notice: 'Post was successfully created.'
    else
      render :new, status: :unprocessable_entity, alert: '作成に失敗しました'
    end
  end

  def edit
  end

  def update
    if @post.update(post_params)
      redirect_to @post, notice: 'Post was successfully updated.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @post.destroy
    redirect_to posts_url, notice: 'Post was successfully destroyed.'
  end

  private

  def set_post
    @post = current_user.posts.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:content)
  end
  # def correct_user
  #     redirect_to posts_path, alert: '他のユーザーの投稿は編集できません' unless current_user.id == @post.user_id
  # end
end
