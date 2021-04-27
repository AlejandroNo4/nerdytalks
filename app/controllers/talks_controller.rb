class TalksController < ApplicationController
  before_action :set_talk, only: %i[ show edit update destroy ]
  before_action :logged_in_user, only: [:create]

  def index
    @talks = Talk.all
    @talk = Talk.new
    @users = User.all
  end

  def create
    @talk = current_user.talks.build(talk_params)

    if @talk.save
      flash[:success] = 'talk created!'
      redirect_to request.referrer
    else
      flash[:danger] = 'A talk must to be between 0 and 140 characters.'
      redirect_to request.referrer
    end
  end

  def destroy
    @talk.destroy
    flash[:success] = 'succesfully destroyed!'
    redirect_to request.referrer
  end

  private

    def set_talk
      @talk = Talk.find(params[:id])
    end

    def talk_params
      params.require(:talk).permit(:text)
    end

    def logged_in_user
      unless logged_in?
        flash[:danger] = "Please log in or sign up!"
        redirect_to login_url
      end
    end
end
