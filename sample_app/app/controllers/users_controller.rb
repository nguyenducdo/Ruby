class UsersController < ApplicationController
  before_action :logged_in_user, only: [:index, :edit, :update, :destroy,
    :following, :followers]
  before_action :find_user, only: [:show, :edit, :update, :destroy, :following,
    :followers]
  before_action :correct_user, only: [:edit, :update]
  before_action :admin_user, only: :destroy

  def index
    @users = User.select(:name, :email, :id, :admin).order(:name)
                 .page(params[:page]).per(Settings.per_page)
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new user_params
    if @user.save
      @user.send_activation_email
      flash[:info] = t("please_check_email")
      redirect_to root_url
    else
      render :new
    end
  end

  def show
    @microposts = @user.microposts.page(params[:page])
                       .per(Settings.feed_per_page)
  end

  def edit; end

  def update
    if @user.update_attributes user_params
      flash[:success] = t("profile_updated")
      redirect_to @user
    else
      render :edit
    end
  end

  def destroy
    if @user.destroy
      flash[:success] = t("user_deleted")
    else
      flash[:danger] = t("cannot_delete")
    end
    redirect_to users_url
  end

  def following
    @title = "Following"
    @users = @user.following.page(params[:page]).per(Settings.per_page)
    render "show_follow"
  end

  def followers
    @title = "Followers"
    @users = @user.followers.page(params[:page]).per(Settings.per_page)
    render "show_follow"
  end

  private
  def user_params
    params.require(:user).permit :name, :email, :password,
      :password_confirmation
  end

  def logged_in_user
    return if logged_in?

    store_location
    flash[:danger] = t("login_warning")
    redirect_to login_url
  end

  def correct_user
    redirect_to root_url unless @user&.current_user? current_user
  end

  def admin_user
    redirect_to root_url unless current_user.admin?
  end

  def find_user
    @user = User.find_by id: params[:id]

    return @user if @user
    flash[:warning] = t("no_user_warning")
    redirect_to root_path
  end
end
