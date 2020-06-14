class UsersController < ApplicationController
  # callback to require user login
  skip_before_filter :require_login, :only => [:create, :new]
  # callback to validate user 
  before_action :check_user, only: [:edit, :show, :update, :delete]

  def new
    # renders new user page
  end

  def create
    @user = User.new(name: params['name'],email: params['email'], password: params['password'])
      if @user.valid?
        @user.save
        redirect_to login_url
      else
        flash[:errors] = ['cant be blank']
        redirect_to '/users/new'
      end
  end

  def show
    @user = User.find(params[:id])
    @secrets = Secret.all
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.email = params['email']
    @user.name = params['name']
    if @user.valid?
      @user.save
      redirect_to "/users/#{@user.id}"
    else
      flash[:errors] = ['Invalid entry(s)']
      redirect_to "/users/#{@user.id}"
    end
  end

  private
  def check_user
    if current_user != User.find(params[:id])
      redirect_to "/users/#{session[:user_id]}"
    end
  end

end
