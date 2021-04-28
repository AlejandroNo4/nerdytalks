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
    render partial: 'shared/sidebar-top' if logged_in?
  end

  def button_follow_unfollow(user)
    return if current_user == user

    if current_user.followed?(user)
      link_to 'Unfollow', unfollow_user_path(follower_id: user.id), class: 'btn btn-primary'
    else
      link_to 'Follow', follow_user_path(follower_id: user.id), class: 'btn btn-primary'
    end
  end

  def find_user(u_id)
    @usr = User.find_by(id: u_id)
  end

  def who_to_follow_list
    if current_user
      User.all.select { |u| u != current_user && !current_user.followed?(u) }.compact
    else
      User.all
    end
  end

  def show_username_if_logged(user)
    if logged_in?
      "@" + user.username
    end
  end
end
