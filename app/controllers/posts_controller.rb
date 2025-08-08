class PostsController < ApplicationController
  # before_action :set_post, only: [:show, :update, :destroy]

  rescue_from Exception do |e|
    render json: { error: e.message }, status: :internal_error
  end

  rescue_from ActiveRecord::RecordInvalid do |e|
    render json: { error: e.message }, status: :unprocessable_entity
  end

  # GET /posts
  def index
    @posts = Post.where(published: true)

    render json: @posts, status: :ok
  end

  # GET /posts/1
  def show
    @post = Post.find(params[:id])
    render json: @post
  end

  # POST /posts
  def create
    @post = Post.create!(create_params)
    render json: @post, status: :created
  end

  # PATCH/PUT /posts/1
  def update
    @post = Post.find(params[:id])
    @post.update!(update_params)
    render json: @post, status: :created
  end

  # DELETE /posts/1
  def destroy
    @post.destroy
  end

  private
    def create_params
      params.require(:post).permit(:title, :content, :published, :user_id)
    end

    def update_params
      params.require(:post).permit(:title, :content, :published)
    end
end
