module TalksHelper
  def author_username(talkid)
    @user = User.find_by(id: talkid)
    @user.username
  end

  def destroy_talk(talk)
    if logged_in? && current_user.username == author_username(talk.author_id)
      link_to 'Destroy', talk, method: :delete, data: { confirm: 'Are you sure?' }
    end
  end
end
