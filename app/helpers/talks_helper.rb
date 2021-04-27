module TalksHelper
  
  def destroy_talk(talk)
    if logged_in? && current_user.id == talk.author_id
      link_to 'Delete talk', talk, method: :delete, data: { confirm: 'Are you sure?' }
    end
  end
end
