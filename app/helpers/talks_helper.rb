module TalksHelper
  def author_username(talkid)
    @user = User.find_by(id: talkid)
    @user.username
  end
end
