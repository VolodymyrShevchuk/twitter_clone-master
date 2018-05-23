class TweetsController < ApplicationController
  def index
    followings_with_self = current_user.followings.pluck(:id) << current_user.id
    @users = User.where(id: followings_with_self)
    tweets_with_self = current_user.followings.pluck(:id) << current_user.id
    @tweets = Tweet.where(user_id: tweets_with_self).paginate(:page => params[:page], :per_page => 5).order('created_at DESC')
  end

  def new
  	@tweet = Tweet.new
  end

  def create
    @tweet = Tweet.new(tweet_params)
    @tweet.user_id = current_user.id
    if @tweet.save
      redirect_to root_path
    else
      redirect_to root_path
    end
  end

  def show

    @followed = User.where(id: current_user.followings.pluck(:id))
  end

  def update
  end


  def destroy
  	@tweet = Tweet.find(params[:id])
    @tweet.destroy
    redirect_to root_path
  end


 private

 def tweet_params
 	params.require(:tweet).permit(:text)
 end



end
