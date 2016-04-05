class AboutsController < ApplicationController


 def index
 end

 def about
    @event = Event.all
    @comment = Comment.all
    @user = User.all
 end


private

def event_params
  params.require(:event).permit(:topic, :article, :category_id, :logo)
end

end
