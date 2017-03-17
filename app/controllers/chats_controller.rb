class ChatsController < ApplicationController
    def create
        @user=User.find(params[:user_id])
        chat=@user.chats.find_by(send_to_ID: params[:chat].permit(:send_to_ID)[:send_to_ID] )
        if chat==nil
            @chat=@user.chats.create(send_to_ID: params[:chat].permit(:send_to_ID)[:send_to_ID] )
            redirect_to user_chat_path(@user.id,@chat.id)
        else
            @chat=chat
            redirect_to user_chat_path(@user.id,@chat.id)
        end
    end
    def destroy
        @user=User.find(params[:user_id])
        @chat=@user.chats.find(params[:id])
        @user2=User.find(@chat.send_to_ID)
        @chat2=@user2.chats.find_by(send_to_ID: @user.id)
        @chat.messages.each do |message|
            message.destroy
        end
        @chat2.messages.each do |message|
            message.destroy
        end
        @chat.destroy
        @chat2.destroy
        redirect_to user_path(params[:user_id])
    end

    def new
        @user=User.find(params[:user_id])
    end
    def show
        @user=User.find(params[:user_id])
        @chat=@user.chats.find(params[:id])
        @user2=User.find(@chat.send_to_ID)
        if @user2.chats.find_by(send_to_ID: @user.id)==nil
            @chat2=@user2.chats.create(send_to_ID: @user.id)
            @user2.friends.create(friend_id: @user.id)
        else
        @chat2=@user2.chats.find_by(send_to_ID: @user.id)
        end
    end

end
