module RecipeHelper

	def what_pantry_has(ingredients, pantry_items)
		ingredients.select{|ingredient| pantry_items[ingredient]}
	end
end
