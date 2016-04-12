class PostsController < ApplicationController
	before_filter :ensure_sigin_in!
	def index
		@posts = Post.includes(:comments).page(params[:page]).per(20)
	end
	def create
		@post = Post.new(post_params)
		@post.user_id = current_user.id
		if @post.save
			redirect_to posts_path
		else
			render :new
		end
	end

	def new
		@post = Post.new
	end

	def show
		@post = Post.find_by_id params[:id]
		@comments = @post.comments.includes(:user).page(params[:page]).per(5).order('id desc')
	end

	private

		def post_params
			params.require(:post).permit(:title, :body)
		end
end
