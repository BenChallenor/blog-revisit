class PostsController < ApplicationController

  before_action :find_post, only: [:show, :edit, :update]
  def index
    @posts = Post.all.order('created_at DESC')
     # go to all posts and show them in descending order
   end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to @post
      # if saved go to show posts
    else
      render 'new'
    end
  end

  def show
    find_post
  end

  def edit
    find_post
  end

  def update
    find_post
    if @post.update(post_params)
      redirect_to @post
    else
      render 'edit'
    end
  end

  private

  def find_post
    @post = Post.find(params[:id])
    # find the post by id(created by default) saved to an instant variable
  end

  def post_params
    params.require(:post).permit(:title, :body)
    # require post table, save title and body attributes
  end
end
