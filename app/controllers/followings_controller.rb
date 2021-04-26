class FollowingsController < ApplicationController
  def create
    @follow = current_user.followeds.build(follower_id: params[:follower_id])
    flash[:success] = if @follow.save
                       'you are following to this user'
                     else
                       'Unable to follow.'
                     end
    redirect_to request.referrer
  end

  def destroy
    @follow = current_user.followeds.find_by(follower_id: params[:follower_id])
    @follow.destroy
    flash[:success] = 'successful unfollow'
    redirect_to request.referrer
  end
end

