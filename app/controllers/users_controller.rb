class UsersController < ApplicationController
    def index
        @users=User.all
    end

    def show
        @user=User.find(params[:id])
    end

    def new
        @user=User.new
    end

    def create
        @user=User.new(set_user)
        if @user.save
            redirect_to users_path
        else
            render 'new'
        end
    end

    def edit
        @user=User.find(params[:id])
    end

    def update
        @user=User.find(params[:id])
        if @user.update(set_user)
            redirect_to user_path(@user.id)
        else
            render "edit"
        end
    end

    def destroy
        @user=User.find(params[:id])
        @user.chats.each do |chat|
            user2=User.find(chat.send_to_ID)
            chat2=user2.chats.find_by(send_to_ID: @user.id)
            chat.messages.each do |message|
                message.destroy
            end
            chat2.messages.each do |message|
                message.destroy
            end
            chat2.destroy
            chat.destroy
        end
        @user.friends.each do |friend|
            user3=User.find(friend.friend_id)
            friend2=user3.friends.find_by(friend_id: @user.id)
            friend2.destroy
            friend.destroy
        end
        @user.destroy
        redirect_to users_path
    end



    private
    def set_user
        x={name: params[:user].permit(:name)[:name] ,lineID: params[:user].permit(:lineID)[:lineID]}
        return x
    end

end
