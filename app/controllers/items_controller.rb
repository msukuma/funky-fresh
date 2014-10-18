class ItemsController < ApplicationController
  before_action :shorten, only: [:new, :create, :edit, :update, :destroy]

  def new
    show_door unless session[:user_id] == params[:user_id]
    @item = Item.new
    @user = current_user
    @pantry = params[:pantry_id]
    puts params
    p @pantry
    respond_to do |format|
      format.js do
        render new_user_pantry_item_path(@user, @pantry)
      end
      format.any do
        redirect_to user_pantry_path(@user, @pantry)
      end
    end

  end

  def create
    puts "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
    p params
    @pantry = Pantry.find(params[:pantry_id])
    @item = @pantry.items.create(item_params)
    puts "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
    puts @item
    # if @item
      respond_to do |format|
        # format.html {redirect_to user_pantry_path(@user, @pantry)}
        format.json {render json: {pantry: @pantry}}        
        format.js
      end
    # end
    #   redirect_to user_pantry_path(@user, @pantry)
    # else
    #   render 'new'
  end

  def edit
    show_door unless session[:user_id] == params[:user_id]
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    if @item.update_attributes(item_params)
      redirect_to user_pantry_path(@user, @pantry)
    else
      render 'edit'
    end
  end

  def destroy
    @item = Item.find(params[:id])
    @user = current_user
    @pantry = @item.pantry
    @item.destroy
    respond_to do |format|
      format.js do
        render nothing: true
      end
      format.any do
        redirect_to user_pantry_path(@user, @pantry)
      end
    end
    
  end

    private

  def item_params
    params.require(:item).permit(:prototype_name, :expiration_date)
  end

  def shorten
    @user = User.find(params[:user_id])
    @pantry = Pantry.find(params[:pantry_id])
  end
end
