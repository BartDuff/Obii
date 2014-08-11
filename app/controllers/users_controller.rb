class UsersController < ApplicationController
    before_filter :authenticate, :only => [:index, :edit, :update]
    before_filter :correct_user, :only => [:edit, :update]
    
  def new
      @user = User.new
      @title = "Register"
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
        sign_in @user
    flash[:success] = "Bienvenue dans l'Application Exemple!"
    redirect_to @user
    else
        @title = "Registration"
        render 'new'
    end
    
  end
  
  def index
      @title = "All users"
      @users = User.all
  end
  
  def show
      @user = User.find(params[:id])
      @title = @user.name
  end
  
  def edit
      @user = User.find(params[:id])
      @title = "Edit profile"
      
  end
  
  def update
      @user = User.find(params[:id])
      if @user.update_attributes(user_params)
          flash[:success] = "Updated profile"
          redirect_to @user
          
          else
          @title = "Edit profile"
          render 'edit'
      end
      
  end

  private
  
  def authenticate
      deny_access unless signed_in?
  end
  
  def correct_user
      @user = User.find(params[:id])
      redirect_to(root_path) unless current_user?(@user)
  end
  
  def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
