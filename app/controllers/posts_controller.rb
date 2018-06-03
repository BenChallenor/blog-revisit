class PostsController < ApplicationController
  def index; end

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

  private

  def post_params
    params.require(:post).permit(:title, :body)
    # require post table, save title and body attributes
  end
end
