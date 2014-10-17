class RecipesController < ApplicationController

	def index
		@user = User.find(params[:user_id])
		@pantry = Pantry.find(params[:pantry_id])
		@items = @pantry.items.order(:expiration_date).limit(3)
		@recipes = Yummly.search("#{@items[0].name} #{@items[1].name}").sort {|a, b| b.rating <=> a.rating}

	end
end
