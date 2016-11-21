class Account::UsersController < Account::AccountController

  def index
    @user = User.find(current_user.try(:id))
  end

  def update
    @user = User.find(current_user.try(:id))
      if user_params.has_key?(:email)
        if @user.update_attributes(user_params)
          redirect_to account_users_path
        else
          redirect_to account_users_path
        end
      else
        if @user.update_attributes(pass_params)
          redirect_to account_users_path
        else
          raise "fail"
        end
      end
  end


  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:email, :first_name, :last_name)
    end

    def pass_params
      params.require(:user).permit(:password, :password_confirmation)
    end

end
