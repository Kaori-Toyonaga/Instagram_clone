class UsersController < ApplicationController
  skip_before_action :login_required, only: [:new, :create]

  def index
  end

  def show
    @user = User.find(params[:id])
    @posts = Post.where(user_id: current_user.id).all
    if @user != current_user
      redirect_to user_path(icurrent_user), alert: "不正なアクセスです。"
    end
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    @user.image = "prof.png"
    if @user.save
      redirect_to new_session_path(@user.id)
      session[:user_id] = @user.id
    else
      render :new
    end
  end

  def edit
    @user = User.find(params[:id])
    if @user != current_user
      redirect_to user_path(icurrent_user), alert: "不正なアクセスです。"
    end
  end

  def update
    @user = User.find_by(id: params[:id])
    if @user.update(user_params)
      redirect_to user_path
    else
      render :edit, alert: "氏名かメールアドレスが空欄です。"
    end
  end

  private
    def user_params
      params.require(:user).permit(:name, :email, :password,
                                   :password_confirmation, :image, :image_cache)
    end
end
