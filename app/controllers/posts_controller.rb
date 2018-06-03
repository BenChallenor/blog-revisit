class PostsController < ApplicationController
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
    @post = Post.find(params[:id])
    # find the post by id(created by default) saved to an instant variable
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to @post
    else
      render 'edit'
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :body)
    # require post table, save title and body attributes
  end
end
