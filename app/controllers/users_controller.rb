class UsersController < ApplicationController
  before_action :set_user, only: %i[show edit update destroy]
  before_action :logged_in_user, only: %i[edit update show]
  before_action :correct_user, only: %i[edit update]

  def show
    @followers = User.all.includes(:followeds).where(followeds: { follower_id: @user.id })
    @followeds = User.all.includes(:followers).where(followers: { followed_id: @user.id })
    @talks = Talk.all.where(author_id: @user.id)
  end

  def new
    @user = User.new
  end

  def edit; end

  def create
    @user = User.new(user_params)

    if @user.save
      log_in(@user)
      flash[:success] = 'Successfully created!'
      redirect_to @user
    else
      flash.now[:danger] = 'Unable to create this user'
      render 'new'
    end
  end

  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @user.destroy
    flash[:danger] = 'Succesfully deleted!'
    redirect_to root_url
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_user
    @user = User.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def user_params
    params.require(:user).permit(:username, :full_name, :photo, :cover_image)
  end

  def logged_in_user
    return if logged_in?

    flash[:danger] = 'Please log in or sign up!'
    redirect_to login_url
  end

  def correct_user
    @user = User.find(params[:id])
    redirect_to(root_url) unless @user == current_user
  end
end
