class EventsController < ApplicationController

  before_action :authenticate_user!, :except => [:index]

  before_action :set_event, :only => [ :show, :edit, :update, :destroy]

  def index
    @events = Event.order("id DESC").page(params[:page]).per(10)
  end

  def show
  @page_title = @event.topic
  @comment = Comment.new
  @comments = @event.comments

  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)

    @event.user = current_user

      if @event.save
        flash[:alert] = "建立成功"
        redirect_to events_url

      else
        render :action => :new
        flash[:alert] = "請輸入標題"
      end
  end

    def update
      if @event.update(event_params)
        redirect_to :action => :show, :id => @event
        flash[:notice] = "修改成功"
      else
        render :action => :edit
        flash[:alert] = "請輸入標題"
      end
    end

  def edit
  end

  def destroy
    @event.destroy
    redirect_to events_url
    flash[:alert] = "刪除成功"
  end

private

def event_params
  params.require(:event).permit(:topic, :article, :category_id)
end

def set_event
  @event = Event.find(params[:id])
end


end
