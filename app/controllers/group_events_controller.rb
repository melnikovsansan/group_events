class GroupEventsController < ApplicationController
  before_action :set_group_event, only: [:show, :update, :destroy]
  skip_before_filter  :verify_authenticity_token

  def index
    @group_events = GroupEvent.recent
  end

  def show
  end

  def create

    @group_event = GroupEvent.new(group_event_params)

    if @group_event.save
      render :show, status: :created, location: @group_event
    else
      render json: @group_event.errors, status: :unprocessable_entity
    end
  end

  def update
    if @group_event.update(group_event_params)
      render :show, status: :ok, location: @group_event
    else
      render json: @group_event.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @group_event.destroy
    head :no_content
  end

  private
    def set_group_event
      @group_event = GroupEvent.find(params[:id])
    end

    def group_event_params
      params.require(:group_event).permit(:started_on, :finished_on, :duration, :name, :description, :location, :published_at)
    end
end
