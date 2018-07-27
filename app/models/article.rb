class Article < ActiveRecord::Base
	belongs_to :author
	has_many :taggings
	has_many :tags, through: :taggings

	def tag_list
		self.tags.collect do |tag|
			tag.name
		end.join(", ")
	end

	def new_tag_list
		''
	end

	def tag_list=(tags_string)
		tag_names = tags_string.split(",").collect{|s| s.strip.downcase}.uniq
		new_or_found_tags = tag_names.collect{ |name| Tag.find_or_create_by(name: name)}.uniq
		otags = self.tags
		var = 1
		otags.collect{ |old|
			if old.name == new_or_found_tags.first.name
				var = 0
			end
		}
		if var == 1 
			self.tags << new_or_found_tags
		end
		self.tags
	end
end