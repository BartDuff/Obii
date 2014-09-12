class HangoutsController < ApplicationController
    skip_before_filter :verify_authenticity_token
    
    def create
        @hangout = current_user.hangouts.build(hangout_params)
        if @hangout.save
            flash[:success] = "Successfully requested to hang out"
            respond_to do |format|
                format.html {redirect_to mood_path(@hangout.mood_id)}
                format.js
            end
            else
            flash[:error] = "There was an error on this hangout request"
            redirect_to mood_path(:id => @hangout.mood_id)
        end
    end
    
    def destroy
        @hangout = Hangout.find(params[:id])
        if @hangout.destroy
            flash[:success] = "Successfuly withdrew from this hangout"
            respond_to do |format|
                format.html {redirect_to mood_path(:id => @hangout.mood_id)}
                format.js
            end
            else
            flash[:error] = "There was an error withdrawing you from this hangout"
            redirect_to mood_path(:id => @hangout.mood_id)
        end
    end
    
    private
    
    def hangout_params
        params.require(:hangout).permit(:user_id, :mood_id, :accept)
    end
end
