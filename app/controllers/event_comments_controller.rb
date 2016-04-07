class EventCommentsController < ApplicationController
    before_action :find_event
    before_action :authenticate_user!

  def index
    @comments = @event.comments
  end

  def show
    @comment = @event.comments.find( params[:id] )
  end

  def new
    @comment = Comment.new
    # @comment = @event.comments.build
  end

  def create
    @comment = @event.comments.create( comment_params )
    @event.comments_created_at  = @comment.created_at
    @comment.user = current_user

    if @comment.save
      @event.save

      respond_to do |format|
      format.html { redirect_to event_path(@event) }
      format.js # create.js.erb
      end

    else
      flash[:alert] = "請輸入內容"
      redirect_to event_path( @event )
    end
  end

  def edit
    @comment = @event.comments.find( params[:id] )
  end

  def update
    @comment = @event.comments.find( params[:id] )

    if @comment.update( comment_params )
      redirect_to event_path( @event )
    else
      render :action => :edit
    end

  end

  def destroy

    @comment = current_user.comments.find( params[:id] )
    @comment.destroy

       respond_to do |format|
       format.html { redirect_to :back }
       format.js # destroy.js.erb
     end
  end

  protected

  def find_event
    @event = Event.find( params[:event_id] )
  end

  def comment_params
    params.require(:comment).permit(:comment)
  end
  def event_params
    params.require(:event).permit(:comments_created_at)
  end

end
