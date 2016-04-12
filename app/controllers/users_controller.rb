class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    @user.name = @user.email.split('@')[0] if @user.email.present?
    if @user.save
      session[:user_id] = @user.id
      redirect_to posts_path
    else
      render :new
    end
  end

  def login
    if request.post?
      if (user = User.authenticate(params[:email], params[:password])).present?
        session[:user_id] = user.id
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
