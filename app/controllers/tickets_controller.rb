class TicketsController < ApplicationController
  before_action :authenticate

  def new
    raise ActionController::RoutingError,
      'ログイン状態で TicketsController#show にアクセス'
  end

  def create
    ticket = current_user.tickets.build do |t|
      t.event_id = params[:event_id]
      t.comment = params[:ticket][:comment]
    end

    if ticket.save
      flash[:notice] = 'このイベントに参加表明しました'
      head :created
    else
      render json: {
        messages: ticket.errors.full_messages
      }, status: 422
    end
  end

  def destroy
    ticket = current_user.tickets.find(params[:id])
    ticket.destroy!

    event_id = params[:event_id]
    redirect_to event_path(event_id), notice: '参加をキャンセルしました'
  end

  private

  def ticket_params
    params.permit(:event_id, :comment)
  end
end
