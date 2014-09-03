class MoodsController < ApplicationController
  def index
      @title = "All moods"
      @moods = Mood.all
  end

  def new
      @title = "New mood"
      @mood = Mood.new
  end

  def create
      @mood = Mood.new(mood_params)
      if @mood.save
          flash[:success] = "Successfully set up a new mood"
          redirect_to @mood
      else
      flash[:error] = "Failed to create a new mood"
      render 'new'
      end
  end

  def edit
      @title = "Edit mood"
      @mood = Mood.find(params[:id])
  end

  def update
      @mood = Mood.find(params[:id])
      if @mood.update_attributes(mood_params)
          redirect_to @mood
          else
          @title = "Edit Mood"
          render 'new'
      end
  end

  def show
      @user = current_user
      @mood = Mood.find(params[:id])
      @title = "#{@user.name} in the mood for #{@mood.obii.name}"
  end

  def destroy
      Mood.find(params[:id]).destroy
      redirect_to moods_path
  end
  
  private
  
  def mood_params
      params.require(:mood).permit(:user_id, :obii_id, :starts, :ends, :maxgroup, :mingroup )
  end
end
