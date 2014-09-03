class InterestsController < ApplicationController
    skip_before_filter :verify_authenticity_token
  
  def create
      @interest = current_user.interests.build(interest_params)
      if @interest.save
          flash[:success] = "Obii added to your interests"
          respond_to do |format|
              format.html {redirect_to obii_path(@interest.obii_id)}
              format.js
            end
          else
          flash[:error] = "There was an error adding this Obii"
          redirect_to obii_path(:id => @interest.obii_id)
          end
  end

  def destroy
      @interest = Interest.find(params[:id])
      if @interest.destroy
        flash[:success] = "Obii deleted from your interests"
      respond_to do |format|
          format.html {redirect_to obii_path(:id => @interest.obii_id)}
          format.js
        end
      else
      flash[:error] = "There was an error deleting this Obii"
      redirect_to obii_path(:id => @interest.obii_id)
      end
  end
  
  private
  
  def interest_params
      params.require(:interest).permit(:user_id, :obii_id)
    end
  
end
