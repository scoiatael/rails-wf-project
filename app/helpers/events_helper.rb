module EventsHelper

  def newest_event
    Event.order(:date)[0]
  end

  def votable_events
    n = newest_event
    Event.all.select { |e| e.vote_open? and e.id != n.id }
  end
end
