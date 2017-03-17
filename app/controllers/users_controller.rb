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
        @user.destroy
        redirect_to users_path
    end



    private
    def set_user
        x={name: params[:user].permit(:name)[:name] ,lineID: params[:user].permit(:lineID)[:lineID]}
        return x
    end

end
