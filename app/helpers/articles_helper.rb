module ArticlesHelper
	def article_params
		params.require(:article).permit(:title, :body, :new_tag_list, :tag_list, :author_id)
	end
end
