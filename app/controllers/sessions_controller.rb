class SessionsController < ApplicationController
  
  # callback to require login
  skip_before_action :require_login

  def new
    # render login page
  end

  def create
    # Log User in
    user = User.where(email: params[:user][:email]).first
      if user.authenticate(params[:user][:password])
        session[:user_id] = user.id
        redirect_to "/users/#{user.id}"
      else
        flash[:errors] = ['Invalid login attempt']
        redirect_to login_url
      end

  end

  def destroy
    # log out user
    session[:user_id] = nil
    redirect_to login_url
    # set session [:user_id] to nil
    # redirect to login page
  end

end
