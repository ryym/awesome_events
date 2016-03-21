class EventsController < ApplicationController
  before_action :authenticate, except: :show

  def new
    # Instanciate a new event.
    @event = current_user.created_events.build
  end

  def create
    @event = current_user.created_events.build(event_params)
    if @event.save
      redirect_to @event, notice: '作成しました'
    else
      render :new
    end
  end

  def show
    @event = Event.find(params[:id])
    @new_ticket = @event.tickets.build
    @my_ticket = current_user && @event.ticket_of(current_user)

    # The `includes` method loads all relavent users.
    @tickets = @event.tickets.includes(:user).order(:created_at)
  end

  def edit
    @event = current_users_event(params[:id])
  end

  def update
    @event = current_users_event(params[:id])
    if @event.update(event_params)
      redirect_to @event, notice: '更新しました'
    else
      render :edit
    end
  end

  def destroy
    @event = current_users_event(params[:id])
    @event.destroy!
    redirect_to root_path, notice: '削除しました'
  end

  private

  def current_users_event(id)
    current_user.created_events.find(id)
  end

  def event_params
    params.require(:event).permit(
      :name, :place, :content, :start_time, :end_time
    )
  end
end
