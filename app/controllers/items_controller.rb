class ItemsController < ApplicationController
  before_action :shorten, only: [:new, :create, :edit, :update, :destroy]

  def new
    show_door unless session[:user_id] == params[:user_id]
    @item = Item.new
    @user = current_user
    @pantry = params[:pantry_id]
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
    @pantry = Pantry.find(params[:pantry_id])
    item_params['prototype_name'].downcase!

    if item_params['expiration_date'].blank?
      @item = @pantry.items.create(item_params)
    else
      @item = @pantry.items.create(prototype_name: item_params['prototype_name'], expiration_date: Date.strptime(item_params['expiration_date'], '%m/%d/%Y').to_s )
    end
    # UserMailer.expiration_alert_email(@user).deliver
    # if @item
    respond_to do |format|
      format.html {redirect_to user_pantry_path(@user, @pantry)}
      format.json {render json: {pantry: @pantry}}
      format.js
    end
  end

  # def edit
  #   show_door unless session[:user_id] == params[:user_id]
  #   @item = Item.find(params[:id])
  # end

  # def update
  #   @item = Item.find(params[:id])
  #   @item.update_attributes(item_params)
  #   respond_to do |format|
  #     format.html {redirect_to user_pantry_path(@user, @pantry)}
  #     format.json {render json: {pantry: @pantry}}
  #     format.js
  #   end
  #   # if @item.update_attributes(item_params)
  #   #   redirect_to user_pantry_path(@user, @pantry)
  #   # else
  #   #   render 'edit'
  #   # end
  # end
  def search
    @grants = Grant.search params[:search]
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
