class UsersController < ApplicationController
  before_filter :authenticate_user!, :only => [:show]
  before_filter :authenticate_admin, :only => [:index, :edit, :update, :destroy]
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def index
    @users = User.all
  end

  def show
  end

  def edit
  end

  def update
      if @user.update(user_params)
        redirect_to @user
      else
        render action: 'edit'
      end
  end

  def destroy
    @user.destroy
    redirect_to users_url
  end

  def set_user
    @user = User.find(params[:id])
  end

end
