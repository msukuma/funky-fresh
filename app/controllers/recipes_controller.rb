class RecipesController < ApplicationController

	def index
		@user = User.find(params[:user_id])
		@pantry = Pantry.find(params[:pantry_id])
		@items = @pantry.item_names

		search_for = @items.length > 3 ? @items[0..2].join(' ') : @items.join(' ')
		@search_results = Yummly.search(search_for)#, maxResult: 2)

		@matches = @search_results.matches 

		# you_have = []
		# ingredients.each do |ingredient|
		# 	@items.each do |item|
		# 		you_have << ingredient if ingredient.include?(item)
		# 	end
		# end
		@best_matches = @matches.map{|r| [r['id'], r['ingredients'], r['sourceDisplayName']]}.sort{|a, b| (a[1] - @items).length <=> (b[1] - @items).length} unless @matches.empty?
	end
end
