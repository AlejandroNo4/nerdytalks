module ApplicationHelper
  def login_helper(style = '')
    if logged_in?
      (link_to 'Logout', logout_path, method: :delete, class: style) + ' '.html_safe +
        (link_to "#{current_user.username}'s page ", current_user, class: style) + ' '.html_safe +
        (link_to 'New Talk', new_talk_path, class: style)
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
end
