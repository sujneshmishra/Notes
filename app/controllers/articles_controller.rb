class ArticlesController < ApplicationController
	before_filter :require_login
	respond_to :html, :js
	include ArticlesHelper
	include ActionView::Helpers::AssetUrlHelper
	include ActionView::Helpers::TagHelper

	
	def index 
		@articles = Article.where(author_id: current_user.id)
	end

	def show
		@article = Article.find(params[:id])
	end

	def new
		@article = Article.new
	end

	def create
		@article = Article.new(article_params)
		@article.author_id = current_user.id if current_user
		@article.save
		redirect_to article_path(@article)
	end

	def destroy
		@article = Article.find(params[:id])
		@article.destroy
		redirect_to articles_path
	end

	def edit
		@article = Article.find(params[:id])
	end


	def update
		@article = Article.find(params[:id])
		if params[:article][:new_tag_list].nil?
			@article.update(article_params)
		else 
			@article.tag_list=(params[:article][:new_tag_list])	
			update_hash = article_params.clone
			update_hash.delete("new_tag_list")
			@article.update(update_hash)
		end


		

		#flash.notice = "Article #{@article.title} was updated"


		redirect_to article_path(@article)
	end

end
