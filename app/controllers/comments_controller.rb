class CommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    @ride = Ride.find(params[:ride_id])
    @comment = @ride.comments.build(comment_params)
    @comment.user = current_user
    if @comment.save
      redirect_back fallback_location: @ride
    else
      redirect_back fallback_location: @ride, alert: @comment.errors.full_messages.to_sentence
    end
  end

  def destroy
    @ride = Ride.find(params[:ride_id])
    @comment = @ride.comments.find(params[:id])
    raise ActiveRecord::RecordNotFound unless comment_destroyable_by_current_user?

    @comment.destroy
    redirect_back fallback_location: @ride
  end

  def swap
    # @ride = Ride.find(params[:ride_id])
    # @comment = @ride.comments.find(params[:id])
    # k = @ride.user
    # @ride.user = @comment.user 
    # @comment.user = k
    redirect_back fallback_location: rides_path
  end

  private

  def comment_params
    params.fetch(:comment, ActionController::Parameters.new).permit
  end

  def comment_destroyable_by_current_user?
    @comment.user_id == current_user.id || @ride.user_id == current_user.id
  end
end
