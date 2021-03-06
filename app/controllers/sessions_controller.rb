class SessionsController < ApplicationController
  def new
      if signed_in?
          flash[:success] = "You are connected. Get out of your Bubble!"
          redirect_to '/home'
      else
      @title = "Login"
      end
  end
  
  def create
      user = User.authenticate(params[:session][:email],
                               params[:session][:password])
    if user.nil?
        flash.now[:error] = "Wrong Email/Passwaord combination"
        @title = "Login"
    render 'new'
    else
    sign_in user
    redirect_back_or user
    end
  end
  
  def destroy
     sign_out
     redirect_to root_path
  end
end
