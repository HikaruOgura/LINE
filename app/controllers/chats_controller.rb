class ChatsController < ApplicationController
    def create
        @user=User.find(params[:user_id])
        @chat=@user.chats.create(send_to_ID: params[:chat].permit(:send_to_ID)[:send_to_ID] )
        redirect_to user_path(params[:user_id])
    end
    def destroy
        @chat=Chat.find(params[:id])
        @chat.destroy
        redirect_to user_path(params[:user_id])
    end

    def new
        @user=User.find(params[:user_id])
    end
    def show
        @user=User.find(params[:user_id])
        @chat=@user.chats.find(params[:id])
    end

end
