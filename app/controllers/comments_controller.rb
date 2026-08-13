class CommentsController < ApplicationController
  def create
    @ride = Ride.find(params[:ride_id])
    @comment = @ride.comments.build(comment_params)
    @comment.user = current_user
    @comment.save
    redirect_to request.referrer
  end

  def destroy
    @ride = Ride.find(params[:ride_id])
    @comment = @ride.comments
    @comment.find(params[:id]).destroy
    redirect_to request.referrer
  end

  def swap
    # @ride = Ride.find(params[:ride_id])
    # @comment = @ride.comments.find(params[:id])
    # k = @ride.user
    # @ride.user = @comment.user 
    # @comment.user = k
    redirect_to request.referrer
  end

  private

  def comment_params
    params.fetch(:comment, ActionController::Parameters.new).permit
  end
end
