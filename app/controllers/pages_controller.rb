class PagesController < ApplicationController
  def home
      @title = "Home"
      @user = current_user
      @moods = Mood.where(user: @user).all
      @hangouts = @user.hangouts
  end

  def contact
      @title = "Contact"
  end
  
  def about
      @title = "About"
  end
  
  def help
      @title = "Help"
  end
  
end
