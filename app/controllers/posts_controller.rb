class PostsController < ApplicationController
  before_filter :post, only: [:show, :edit, :update, :destroy]

  def index
    @posts = Post.paginate(:page => params[:page]).order('created_at DESC')
    @post = Post.new
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.create(params[:post])

    respond_to do |format|
      format.html { render(:new) }
      format.js
    end

    # if @post.save
    #   redirect_to action: :index
    # else
    #   render 'new'
    # end
  end

  def update
    @post.update(params[:post])
    redirect_to action: :index
  end

  def destroy
    @post.destroy
    # redirect_to action: :index
    respond_to do |format|
      format.html { redirect_to posts_url }
      format.json { head :no_content }
      format.js
    end
  end

  private

  def post
    @post ||= Post.find(params[:id])
  end
end
