class UsersController < ApplicationController

  before_action :authenticate_user!, :except => [:index]

  before_action :set_user, :only => [ :show, :edit, :update, :destroy]


  def show


    @comments = Comment.where(user: @user)

    @q = Event.where(user: @user).ransack(params[:q])
    @events = @q.result(distinct: true)
    @events = @events.page(params[:page]).per(10)


  end



private

def user_params
  params.require(:user).permit(:id, :user_id )
end

def set_user
  @user = User.find(params[:id])
end

end
