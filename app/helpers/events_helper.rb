module EventsHelper
  def display_comments_created_at_time(event)
    if event.comments_created_at
      event_time = event.comments_created_at.strftime('%F') + " " + event.comments_created_at.strftime('%R')
    else
      ""
    end
  end
end
