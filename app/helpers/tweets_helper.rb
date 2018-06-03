module TweetsHelper
  def delete_tweet(user, current_user, tweet)
    if  user.id == current_user.id
      link_to 'delete', tweet_path(tweet[:id]), class:'delete_tweet',  method: :delete, data: {confirm: 'Are you sure?'}
      # do
      #   # <i class="fa fa-trash" aria-hidden="true"></i>
      # end
    end
  end
end
