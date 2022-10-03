class EventsController < ApplicationController
  before_action :authenticate_user!, except: %i[show index]
  before_action :set_event, only: %i[edit update destroy show delete_bg_image]

  after_action :verify_authorized

  def index
    authorize Event

    @events = policy_scope(Event)
  end

  def show
    if @event.pincode.present? && @event.pincode_valid?(params[:pincode])
      cookies.permanent["events_#{@event.id}_pincode"] = params[:pincode]
    end

    begin
      authorize @event
    rescue Pundit::NotAuthorizedError
      flash.now[:alert] = I18n.t('controllers.events.wrong_pincode') if params[:pincode].present?
      render 'password_form'
    end
  end

  def new
    authorize Event

    @event = current_user.events.build
  end

  def edit
    authorize @event
  end

  def create
    authorize Event

    @event = current_user.events.build(event_params)

    if @event.save
      redirect_to @event, notice: I18n.t('controllers.events.created')
    else
      render :new
    end
  end

  def update
    authorize @event

    if @event.update(event_params)
      redirect_to @event, notice: I18n.t('controllers.events.updated')
    else
      render :edit
    end
  end

  def destroy
    authorize @event

    @event.destroy
    redirect_to events_url, notice: I18n.t('controllers.events.destroyed')
  end

  def delete_bg_image
    authorize @event

    @event.bg_photo.purge
    redirect_to @event, notice: I18n.t('controllers.events.bg_destroyed')
  end

  private

  def set_event
    @event = Event.find(params[:id])
  end

  def event_params
    params.require(:event).permit(:title, :address, :datetime, :description, :pincode, :bg_photo, photos: [])
  end
end
