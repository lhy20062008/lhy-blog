class UsersController < ApplicationController
  before_filter :ensure_sigin_in!, only: [:profile]
  def register
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to root_path
    else
      render :register
    end
  end

  def login
    if request.post?
      if (user = User.authenticate(params[:email], params[:password])).present?
        session[:user_id] = member.id
        redirect_to root_path
      else
        flash[:notice] = I18n.t(:email_or_password_invalid)
        render :login
      end
      return
    end
    redirect_to root_path if current_user.present?
  end

  def logout
    session[:user_id] = nil
    redirect_to root_path
  end

  private

    def user_params
      params.require(:user).permit(:email, :password, :password_confirmation)
    end
end
