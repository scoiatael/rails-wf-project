module EventsHelper

  def newest_event
    Event.order(:date)[0]
  end

  def votable_events
    Event.all.select(&:vote_closed?)
  end
end
