class LikesController < ApplicationController
  before_action :current_user
  def create
    Like.create(user_id: current_user.id, tweet_id: params[:tweet_id])
    redirect_back(fallback_location: root_path)
  end

  def destroy

    destroy_like = Like.find(params[:id])
    destroy_like.destroy
    redirect_back(fallback_location: root_path)

  end

  private
  def like_params
    params.require(:like).permit(:user_id, :tweet_id)

  end
end
