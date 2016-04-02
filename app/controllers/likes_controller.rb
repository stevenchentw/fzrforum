class LikesController < ApplicationController

  before_action :authenticate_user!
  before_action :set_event

  def create
    like = @event.finy_like_by(current_user)
    if like
      # do nothing
    else
      @like = @event.likes.create!( :user => current_user )
    end

    respond_to do |format|
      format.html { redirect_to :back }
      format.js { render "events/like" }
    end
  end

  def destroy
    @like = current_user.likes.find( params[:id] )
    @like.destroy

    @like = nil # 這樣讓 events/_like.html.erb 會顯示 Like 按鈕

    respond_to do |format|
      format.html { redirect_to :back }
      format.js { render "events/like" }
    end
  end

  protected

  def set_event
    @event = Event.find( params[:event_id] )
  end

end
