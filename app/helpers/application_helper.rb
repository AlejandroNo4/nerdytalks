module ApplicationHelper
  def login_helper(style = '')
    if logged_in?
      (link_to 'Logout', logout_path, method: :delete, class: style) + ' '.html_safe +
        (link_to "#{current_user.username}'s page ", current_user, class: style) + ' '.html_safe +
        (link_to 'Edit profile', edit_user_path(current_user), class: style)
    else
      (link_to 'Sign Up', new_user_path, class: style) + ' '.html_safe +
        (link_to 'Login', login_path, class: style)
    end
  end

  def user_sidebar_info
    if logged_in?
      render partial:"shared/sidebar-top"
    end
  end

  def button_follow_unfollow(user)
    unless current_user == user 
      if current_user.followed?(user) 
        link_to 'Unfollow', unfollow_user_path(follower_id: user.id), class: 'btn btn-primary' 
      else 
        link_to 'Follow', follow_user_path(follower_id: user.id), class: 'btn btn-primary' 
      end 
    end 
  end

  def find_user(u_id)
    @user = User.find_by(id: u_id)
  end

  def who_to_follow_list
    if current_user
      User.all.select {|u| u != current_user && !current_user.followed?(u)}.compact
    else
      User.all
    end
  end
end
