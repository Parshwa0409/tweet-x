class SessionController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email:get_params[:email])

    if user.present? && user.authenticate(get_params[:password])
      session[:user_id ]= user.id
      redirect_to root_path
    else
      flash.now[:alert] = "INVALID PASSWORD OR EMAIL-ID" 
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end

  private

  def get_params
    return params.require(:user).permit(:email,:password)
  end
end
