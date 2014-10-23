module RecipeHelper

	def search_yummly_for(ingredients) 
		Yummly.search(ingredients)
	end

	def best_matches(search_results, pantry)
		matches_array = search_results.matches.map{|r| {'id' => r['id'], 'ingredients' => r['ingredients'], 'pantry_has' => pantry.pantry_has(r['ingredients']) , 'pantry_might_have' => pantry.pantry_might_have(r['ingredients']),'sourceDisplayName' => r['sourceDisplayName']}}
		raise 
		sorted_matches_array = matches_array.sort{|a, b| b[2].length <=> a[2].length}
		final_matches_array = sorted_matches_array.each { |match| match << Yummly.find(match.first) } 
	end


end
