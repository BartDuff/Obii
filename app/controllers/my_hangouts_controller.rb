class MyHangoutsController < ApplicationController
  def index
      @user = current_user
      @moods = Moods.where(user: @user).all
      @hangouts = @user.hangouts
      @requests = Hangout.where(mood_id: @moods.ids, accept: false)
  end
end
