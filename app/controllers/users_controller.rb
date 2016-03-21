class UsersController < ApplicationController
  before_action :authenticate

  def retire
  end

  def destroy
    # current_user.check_all_events_finished
    # ret = current_user.destroy
    # binding.pry
    # raise StandardError if ret
    # render :retire
    if current_user.destroy
      reset_session
      redirect_to root_path, notice: '退会しました'
    else
      render :retire
    end
  end
end
