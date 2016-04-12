class EventsController < ApplicationController

  before_action :authenticate_user!, :except => [:index]

  before_action :set_event, :only => [ :show, :edit, :update, :destroy]

  def about
  end

  def index

   @events = Event.page(params[:page]).per(8)

   @events = @events.where(category_id: params[:category_id]) if params[:category_id]
   @events = @events.where(type_id: params[:type_id]) if params[:type_id]

   @categories = Category.all
   @types = Type.all

       if params[:sort] == "type_id"
        @events = @events.order("type_id")
       elsif params[:sort] == "type_id DESC"
        @events = @events.order("type_id DESC")

       elsif params[:sort] == "category_id"
        @events = @events.order("category_id")
       elsif params[:sort] == "category_id DESC"
        @events = @events.order("category_id DESC")

       elsif params[:sort] == "topic"
        @events = @events.order("topic")
       elsif params[:sort] == "topic DESC"
        @events = @events.order("topic DESC")

       elsif params[:sort] == "user_id"
        @events = @events.order("user_id")
       elsif params[:sort] == "user_id DESC"
        @events = @events.order("user_id DESC")

       elsif params[:sort] == "comments_count"
        @events = @events.order("comments_count")
       elsif params[:sort] == "comments_count DESC"
        @events = @events.order("comments_count DESC")

       elsif params[:sort] == "likes_count"
        @events = @events.order("likes_count")
       elsif params[:sort] == "likes_count DESC"
        @events = @events.order("likes_count DESC")

       elsif params[:sort] == "created_at"
        @events = @events.order("created_at")
       elsif params[:sort] == "created_at DESC"
        @events = @events.order("created_at DESC")

       elsif params[:sort] == "comments_created_at"
        @events = @events.order("comments_created_at")
       else params[:sort] == "comments_created_at DESC"
        @events = @events.order("comments_created_at DESC")

        end

  end

  def show
  @page_title = @event.topic
  @comment = Comment.new
  @comments = @event.comments
  @likes = @event.likes
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


      if params[:_remove_logo] == "1"
        @event.logo = nil
      end

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
    @event = current_user.events.find( params[:id] )
    @event.destroy
    redirect_to :back

    flash[:alert] = "刪除成功"
  end

private

def event_params
  params.require(:event).permit(:topic, :article, :category_id, :logo, :type_id)
end

def set_event
  @event = Event.find(params[:id])
end

end
