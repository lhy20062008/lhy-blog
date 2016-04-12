class ArticlesController < ApplicationController
	before_filter :ensure_sigin_in!
	def index
		@articles = Article.where(user_id: current_user.id).page(params[:page]).per(20).order('id desc')
	end

	def new
		@article = Article.new
	end

	def create
		@article = Article.new(article_params)
		if @article.save
			redirect_to articles_path
		else
			render :new
		end
	end

	def show
		@article = Article.find_by_id params[:id]
		@comments = @article.comments.includes(:user).page(params[:page]).per(5).order('id DESC')
	end

	private
		def article_params
			params.require(:article).permit(:title, :body)
		end
end
