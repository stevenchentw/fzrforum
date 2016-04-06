class UsersController < ApplicationController

  before_action :authenticate_user!, :except => [:index]

  before_action :set_user, :only => [ :show, :edit, :update, :destroy]


  def show

    @likes = @user.likes

    @comments = Comment.where(user: @user)
    @comments = @comments.page(params[:page]).per(5)
    @q = Event.where(user: @user).ransack(params[:q])
    @events = @q.result(distinct: true)
    @events = @events.page(params[:page]).per(5)

    @a = Event.where(id: Like.where(user_id: @user).pluck(:event_id))
    @a = @a.page(params[:page]).per(5)

    respond_to do |format|
      format.js
      format.html
    end

  end



private

def user_params
  params.require(:user).permit(:id, :user_id )
end

def set_user
  @user = User.find(params[:id])
end

end
