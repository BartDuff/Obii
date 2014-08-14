class ObiisUsersController < ApplicationController
    before_action :signed_in_user
  def create
      @obii = Obii.find(params[:obii_user][:obii_id])
      current_user.add!(@obii)
      respond_to do |format|
          format.html { redirect_to @obii }
          format.js
      end
  end

  def destroy
      @obii = ObiiUser.find(params[:id]).added
      current_user.delete!(@obii)
      respond_to do |format|
          format.html { redirect_to @obii }
          format.js
      end
  end
end
