class UsersController < ApplicationController
    before_action :find_user, only: [:show, :update, :destroy]
    def index 
        @users = User.all
        render :json => @users.as_json(
            only: [:id, :first_name, :last_name, :email],
        include: [
            groups:{
                except: [:updated_at]
            }
        ])
    end
    
    def create 
        @user = User.create(user_params)
        token = JWT.encode({ user_id: @user.id }, ENV['HKEY'])
        render :json => { token: token, user:@user.as_json(
            only: [:id, :first_name, :last_name, :email], 
            include: [:groups])}, :status => :ok
    end
    def show
        if @user
            render :json => @user.as_json(
                only: [:id, :first_name, :last_name, :email],
                include: [:groups, :issues, :updates])
        else
            render :json => {error: 'User not found'}, status: :not_found
        end
    end

    private
    def user_params
        params.require(:user).permit(:first_name, :last_name, :email, :password)
    end

    def find_user
        @user = User.find_by(id: params[:id])
    end
end
