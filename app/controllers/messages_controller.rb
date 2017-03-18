class MessagesController < ApplicationController
    def create
        @user=User.find(params[:user_id])
        @chat=@user.chats.find(params[:chat_id])
        @message=@chat.messages.create(text: params[:message].permit(:text)[:text])
        redirect_to user_chat_path(params[:user_id],params[:chat_id])
    end
end
