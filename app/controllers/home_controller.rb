class HomeController < ApplicationController
  def index
    @users = User.where(id: current_user.followings.pluck(:id))
    @tweet = Tweet.new
    @tweets = Tweet.where(user_id: current_user.followings.pluck(:id)).order('created_at DESC').paginate(:page => params[:page], :per_page => 5)
  end
end
