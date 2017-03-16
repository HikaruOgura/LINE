class FriendsController < ApplicationController
    def new
        @user=User.find(params[:user_id])
    end
    def create
        @user=User.find(params[:user_id])
        @friend=@user.friends.create(friend_id: params[:friend].permit(:friend_id)[:friend_id])
        redirect_to user_path(params[:user_id])
    end
    def destroy
        @friend=Friend.find(params[:id])
        @friend.destroy
        redirect_to user_path(params[:user_id])
    end
end
