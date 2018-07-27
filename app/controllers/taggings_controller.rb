class TaggingsController < ApplicationController
	def destroy
		# puts 'mohsin'
		# puts params[:article_id]
		# puts params[:tag_id]
		@taggings = Tagging.where(tag_id: params[:tag_id]).where(article_id: params[:article_id])
		@taggings.first.destroy
		redirect_to article_path(params[:article_id])

	end
end
