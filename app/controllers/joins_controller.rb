class JoinsController < ApplicationController
  def create
  	Join.create(user_id: session[:user_id], event_id: params[:event_id])

  	redirect_to :back
  end

  def destroy
  	join = Join.find_by(user_id: session[:user_id], event_id: params[:event_id])

  	if session[:user_id] == current_user.id
  		join.delete
  	end
  	redirect_to :back
  end
end
