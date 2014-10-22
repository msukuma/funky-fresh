module RecipeHelper

	def what_pantry_has(ingredients, pantry_items)
		#pantry_items is a hash with pantry ingredients as keys and true as the values 
		ingredients.select{|ingredient| pantry_items[ingredient]}
	end

	def search_yummly_for(ingredients) 
		Yummly.search(ingredients)
	end

	def best_matches(search_results, comparators)
		matches_array = search_results.matches.map{|r| [r['id'], r['ingredients'], what_pantry_has(r['ingredients'], comparators) ,  r['sourceDisplayName']]}
		sorted_matches_array = matches_array.sort{|a, b| b[2].length <=> a[2].length}
		final_matches_array = sorted_matches_array.each { |match| match << Yummly.find(match.first) } 
	end

end
