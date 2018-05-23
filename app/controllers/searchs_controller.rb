class SearchsController < ApplicationController
  def index

    @users = User.where(["first_name LIKE :name OR last_name LIKE :name",name: "%#{params[:search]}%"])


    render 'users/index'
  end

  def create
    @user_find = User.where(["first_name LIKE ?","%#{params[:search]}%"])

  end

end
