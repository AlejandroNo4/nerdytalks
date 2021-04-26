module TalksHelper
  
  def destroy_talk(talk)
    if logged_in? && current_user.username == author(talk.author_id).username
      link_to 'Destroy', talk, method: :delete, data: { confirm: 'Are you sure?' }
    end
  end
end
