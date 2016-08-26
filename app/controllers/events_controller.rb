class EventsController < ApplicationController
  before_action :require_login, only: [:index, :create, :destroy]
  def index
    @user = User.find(session[:user_id])
    @event = Event.all
  end

  def create
    @user = User.find(session[:user_id])
    @event = Event.create(name: params[:name], description: params[:description], user_id: session[:user_id])

      if @event.valid?
        redirect_to "/groups"
      else
        flash[:errors] = @event.errors.full_messages
        redirect_to "/groups"
      end
  end

  def edit
  end

  def update
  end

  def show
    @user = User.find(session[:user_id])
    @event = Event.find(params[:id])
    @join = Join.where(event: @event)
  end

  def destroy
    event = Event.find(params[:id])
    event.destroy if event.user == current_user
    redirect_to '/groups'
  end
end
