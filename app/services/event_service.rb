class EventService
  def call(form_object)
    event = Event.new(form_object.attributes)
    errors = form_object.validate
    unless errors
      event.save
    else
      errors.each { |k,v| event.errors.add k, v }
    end
    event
  end
end
