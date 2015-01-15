module EventsHelper

  def votable_events
    Event.all.select(&:vote_open?)
  end
end
