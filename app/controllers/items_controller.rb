class ItemsController < ApplicationController
  before_action :shorten, only: [:new, :create, :edit, :update, :destroy]

  def new
    show_door unless session[:user_id] == params[:user_id]
    @item = Item.new
  end

  def create
    @pantry = Pantry.find(params[:pantry_id])
    @item = @pantry.items.create(item_params)
    if @item
      redirect_to user_pantry_path(@user, @pantry)
    else
      render 'new'
    end
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
    @item.destroy
    redirect_to user_pantry_path(@user, @pantry)
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
