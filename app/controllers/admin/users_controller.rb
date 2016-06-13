module Admin
  class UsersController < ApplicationController
    before_action :authenticate_user!
#    after_action :verify_authorized

    def index
      @search = User.ransack(params[:q])
      @users = @search.result.paginate(page: params[:page], per_page: 50)
      @search.build_condition if @search.conditions.empty?
    end

    def show
      @user = User.find(params[:id])
    end

    def edit
      @user = User.find(params[:id])
    end

    def update
      @user = User.find(params[:id])
      if @user.update_attributes(secure_params)
        redirect_to admin_users_path, notice: "User updated."
      else
        redirect_to admin_users_path, alert: "Unable to update user."
      end
    end

    def create
      user = User.from_omniauth(request.env['omniauth.auth'])
      session[:user_id] = user.id
      flash[:success] = "Welcome, #{user.name}"
      redirect_to admin_pages
    end

    def destroy
      if @user.present?
        @user.destroy
      else
        skip_authorization
      end
      redirect_to admin_users_path, notice: "User deleted."
    end

    private

    def secure_params
      params.require(:user).permit(:email,:phone_number,:first_name,:last_name,:dawgtag)
    end
  end
end
