class CommentsController < ApplicationController
  def create
    @ride = Ride.find(params[:ride_id])
    @comment = @ride.comments.create(params[:comment])#.permit(:ride_id)
    @comment.user_id = current_user.id #이 comments의 user_id를 저장하여, 댓글을 단 사용자의 이메일을 노출할 수 있음!
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
end
