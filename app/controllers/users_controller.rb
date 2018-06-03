class UsersController < ApplicationController
  skip_before_action :authenticate_user, only: [:new, :create]
  before_action :find_user_by_id, only: [:show, :edit, :update, :my_tweets]

  def index
    @users = User.paginate(:page => params[:page])
    @tweets = Tweet.paginate(:page => params[:page])
    @followed = User.where(id: current_user.followings.pluck(:id))
  end

  def new
    @new_user = User.new
  end

  def create
    @new_user = User.new(user_params)
    if @new_user.save
      redirect_to log_in_path
    else
      render :new
    end
  end

  def show
    @users = User.where(id: current_user.followings.pluck(:id) && :id)
    @my_tweets = Tweet.where(user_id: @user.id).paginate(:page => params[:page], :per_page => 5)
    @user1 = Relationship.find_by(follower_id: params[:follower_id])

  end

  def edit
  end

  def update
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

  def my_tweets
    @my_tweets = Tweet.where(user_id: @user.id).paginate(:page => params[:page], :per_page => 5)
    render 'my_tweets'
  end

  private
    def user_params
      params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation, :avatar)
    end

    def find_user_by_id
      @user = User.find(params[:id])
    end
end
