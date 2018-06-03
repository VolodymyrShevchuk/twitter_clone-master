class RelationshipsController < ApplicationController
  before_action :current_user

  def create
    @followed = User.find(params[:user_id])

    current_user.follow(:id, @followed)
    redirect_back(fallback_location: root_path, success: "You follow #{@followed.first_name} #{@followed.last_name} ")

  end

  def destroy
  @user2 = Relationship.find(params[:id]).followed

  current_user.unfollow(@user2)
  redirect_back(fallback_location: root_path)

  end




    private
    def relationship_params
      params.require(:relationship).permit(:follower_id, :followed_id)

    end
end
