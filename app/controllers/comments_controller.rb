class CommentsController < ApplicationController
  def create
    @ride = Ride.find(params[:ride_id])
    @comment = @ride.comments.create(params[:comment])#.permit(:departure, :arrival)
    @comment.user = current_user #이 comments의 user_id를 저장하여, 댓글을 단 사용자의 이메일을 노출할 수 있음!
    @comment.save
    redirect_to request.referrer
  end

  def destroy
    @ride = Ride.find(params[:ride_id])
    @comment = @ride.comments
    @comment.find(params[:id]).destroy
    redirect_to request.referrer
  end
end
