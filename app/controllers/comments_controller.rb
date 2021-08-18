class CommentsController < ApplicationController
  def create
    @ride   = current_user.rides.find(params[:comment][:ride_id])
    @comment = @ride.comments.build(params[:comment].permit(:comment))
    @comment.save!
    redirect_to request.referrer
  end

  def destroy
    @ride = Ride.find(params[:ride_id])
    @comment = @ride.comments
    @comment.find(params[:id]).destroy
    redirect_to request.referrer
  end
end
