class UsersController < ApplicationController

  def show
  	@user = User.find(params[:id])
  end

  def new
  	@user = User.new 
  end

  def create
  	@user = User.new(params[:user])
  	if @user.save
      sign_in @user
  		flash[:success] = "Welcome to Parkzy"
  		redirect_to @user
  	else
  		render 'new'
  	end
  end
  
  def edit 
    @user = User.find(params[:id])
  end

  def update 
    @user = User.find(params[:id])
    if @user.update_attributes(params[:user])
      sign_in @user 
      flash[:success] = "Account Successfully Updated"
      redirect_to @user
    else
      render 'edit'
    end
  end

end
