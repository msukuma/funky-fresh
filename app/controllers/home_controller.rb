class HomeController < ApplicationController
  def index
  @user = current_user
    respond_to do |format|
      format.html
      format.js {render 'index', layout: false}
    end
  end
end
