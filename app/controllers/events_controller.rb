require 'date'

class EventsController < ApplicationController
  before_action :set_event, only: [:show, :edit, :update, :destroy]
  before_action :check_user

  respond_to :html

  def index
    @events = Event.all
    respond_with(@events)
  end

  def show
    respond_with(@event)
  end

  def new
    @event = Event.new
    respond_with @event
  end

  def edit
  end

  def create
    @event = event_service.call EventForm.new(event_params)
    if @event.persisted?
      flash[:notice] = "Event created."
      respond_with(@event)
    else
      flash[:error] = "Event creation failed!"
      render new_event_path
    end
  end

  def update
    @event.update(event_params)
    respond_with(@event)
  end

  def destroy
    @event.destroy
    respond_with(@event)
  end

  private
    def set_event
      @event = Event.find(params[:id])
    end

    def param_date(date_params)
      year  = date_params["date(1i)"].to_i
      month = date_params["date(2i)"].to_i
      day   = date_params["date(3i)"].to_i
      begin
        Date.new year,month,day
      rescue
        false
      end
    end

    def event_params
      params[:event][:date] = param_date params[:event]
      params.require(:event).permit(:date, :movie_id, vote_options_attributes: [ :id, :_destroy, :movie_id])
    end

    def event_service
      @event_service ||= EventService.new
    end
end
