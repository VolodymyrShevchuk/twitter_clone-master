class UsersController < ApplicationController
  skip_before_action :authenticate_user, only: [:new, :create]

  def index
    @users = User.all
    @tweets = Tweet.all
    @user1 = Relationship.find_by(follower_id: params[:follower_id])
    @followed = User.where(id: current_user.followings.pluck(:id))


  end

  def new
    @user = User.new

  end
  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to log_in_path
    else
      render :new
    end
  end


  def show
    @users = User.where(id: current_user.followings.pluck(:id) && :id)
    @user = User.find(params[:id])
    @tweets  = Tweet.paginate(:page => params[:page], :per_page => 5)
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)

      redirect_to user_path
    else
      render :edit
    end
  end

  def followings
    render 'followings'
  end

  def followers
    render 'followers'
  end



  private
  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation, :avatar)

  end


end
