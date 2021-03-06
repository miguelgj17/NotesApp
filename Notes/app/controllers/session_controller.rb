class SessionController < ApplicationController
  before_filter :authenticate_user!, only: [:notes]
  def new
  end


  def create
  	@user = User.find_by name: params[:username]
  	if !@user
  		flash.now.alert = "username #{params[:username]} was invalid"
  		render :new
  	elsif @user.password == params[:password]
  		session[:user] = @user.id
      session[:username] = @user.name
  		redirect_to notes_url, :notice => "Logged in!"
  	else
  		flash.now.alert = "Password was invalid"
  		render :new
  	end
  end


  def destroy
  	session[:user] = nil
  	redirect_to root_url, :notice => "Logged out!"
  end
end
