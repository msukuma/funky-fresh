class RecipesController < ApplicationController
	include RecipeHelper
	def index
		@user = User.find(params[:user_id])
		@pantry = Pantry.find(params[:pantry_id])
		@items = @pantry.item_names_and_plural

		# search_for = @items
		# @search_results = Yummly.search("", "allowedIngredient[]" => search_for)#, maxResult: 2)

		# @matches = @search_results.matches 

		@search_results = search_yummly_for(@items)
		# @best_matches = @matches.map{|r| [['id',r['id']], ['ingredients',r['ingredients']], ['pantry', what_pantry_has(r['ingredients'], @pantry.comparators)] , ['sourceDisplayName', r['sourceDisplayName']]]}.sort{|a, b| b[2][1].length <=> a[2][1].length} unless @matches.empty?
		# @best_matches = @matches.map{|r| [r['id'], r['ingredients'], r['sourceDisplayName']]}.sort{|a, b| what_pantry_has(a[1], @pantry.comparators).length <=> what_pantry_has(b[1], @pantry.comparators).length} unless @matches.empty?
		@best_matches = best_matches(@search_results ,@pantry.comparators) unless @search_results.matches.empty?
		# @best_matches = @matches.map{|r| [r['id'], r['ingredients'], what_pantry_has(r['ingredients'], @pantry.comparators) ,  r['sourceDisplayName']]}.sort{|a, b| b[2].length <=> a[2].length} unless @matches.empty?
		# @best_matches.each { |match| match << Yummly.find(match.first) }
			
	end
end
