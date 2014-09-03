class ObiisController < ApplicationController
        skip_before_action :verify_authenticity_token
    
  def new
      @title = "New Obii"
      @obii = Obii.new
  end

  def create
      @obii = Obii.new(obii_params)
      if @obii.save
          redirect_to @obii
      else
        @title = "New Obii"
        render 'new'
      end
  end

  def show
      @obii = Obii.find(params[:id])
      @user = current_user
      @interest = @user.obiis.include?(@obii)? @user.interests.find_by_obii_id(@obii.id) : @user.interests.build
      @users = @obii.users
      @title = @obii.name
  end

  def index
      @title = "All Obiiz"
      @obiis = Obii.all
  end

  def edit
      @obii = Obii.find(params[:id])
      @title = "Edit Obii"
  end

  def update
      @obii = Obii.find(params[:id])
      if @obii.update_attributes(obii_params)
          redirect_to @obii
      else
      @title = "Edit Obii"
          render 'new'
      end
  end

  def destroy
      Obii.find(params[:id]).destroy
      redirect_to obiis_path
  end
  
  private
  
  def obii_params
      params.require(:obii).permit(:name, :image)
  end
end
