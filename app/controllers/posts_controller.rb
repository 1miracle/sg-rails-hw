class PostsController < ApplicationController
  before_filter :post, only: [:show, :edit, :update, :destroy]

  def index
    @post = Post.new
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.create(params[:post])
    @post.user_id = current_user.id

    # respond_to do |format|
    #   format.js
    #   format.html { redirect_to action: :index }
    # end
    if @post.save
      redirect_to action: :index
    else
      render 'new'
    end
  end

  def update
    @post.update(params[:post])
    redirect_to action: :index
  end

  def destroy
    @post.destroy
    redirect_to action: :index
    # respond_to do |format|
    #   format.js { render nothing: true }
    #   format.html { redirect_to action: :index }
    # end
  end

  private

  def post
    @post ||= Post.find(params[:id])
  end
end
