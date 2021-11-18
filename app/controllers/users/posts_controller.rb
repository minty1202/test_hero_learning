class Users::PostsController < UserController
  before_action :find_post, only: %i(show update destroy)
  def index
    @posts = current_user.posts.all
  end

  def create
    current_user.posts.create(post_params)
    redirect_to users_posts_path
  end

  def destroy
    @post.destroy
    redirect_to users_posts_path
  end

  def update
    @post.update(post_params)
    redirect_to users_posts_path
  end

  def show; end

  private

  def post_params
    params.require(:post).permit(:title, :message)
  end

  def find_post
    @post = Post.find params[:id]
  end
end
