module RecipeHelper

	def what_pantry_has(ingredients, pantry_items)
		ingredients.select{|ingredient| pantry_items[ingredient]}
	end

	def search_yummly_for(ingredients) 
		Yummly.search(ingredients)
	end

	def best_matches(search_results, comparators)
		search_results.matches.map{|r| [r['id'], r['ingredients'], what_pantry_has(r['ingredients'], comparators) ,  r['sourceDisplayName']]}.sort{|a, b| b[2].length <=> a[2].length}.each { |match| match << Yummly.find(match.first) } 
	end

end
