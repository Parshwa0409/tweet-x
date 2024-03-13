class RegistrationController < ApplicationController

  def new()
    @user = User.new() # still don't know why???
  end

  def create()
    @user = User.new(get_user_params())

    if @user.save
      session[:user_id] = @user[:id]
      redirect_to root_path, success: "Sign-Up was a blast, Keep it up bro!!!"
    else
      render :new
    end
  end

  private

  def get_user_params()
    return params.require(:user).permit(:first_name,:last_name,:email,:phone,:password,:password_confirmation)
  end
end
