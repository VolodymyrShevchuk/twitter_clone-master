class LikesController < ApplicationController
  before_action :current_user
  def create
    Like.create(user_id: current_user.id, tweet_id: params[:tweet_id])
    render :create
  end

  def destroy
  end

  private
  def like_params
    params.require(:like).permit(:user_id, :tweet_id)

  end
end
