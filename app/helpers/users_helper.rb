module UsersHelper
  def have_avatar(user, size)
    if user.avatar?
      link_to image_tag(user.avatar, size: size), user_path(user.id), class: 'gravatar'
    else
      link_to image_tag('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRtNAniTIhO_bj2xsg2lxWHQqK1Zd1bpDPaoGhWjHPaERAANFnw6g', size: size, class: 'gravatar')
    end
  end

  def choise_button(user, current_user)
    if user != current_user
      if current_user.following?(user)
        return link_to 'Unfollow', user_relationship_path(user, current_user.active_relationships.find_by(followed_id: user.id)), method: :delete, class: 'btn btn-primary'
      else
        return link_to 'Follow', user_relationships_path(user), method: :post, class: 'btn btn-primary'
      end
    else
      "It's you #{user.first_name} !!!"
    end
   end

   def user_name(user)
     link_to "#{user.first_name} #{user.last_name}", user_path(user.id)
   end

end
