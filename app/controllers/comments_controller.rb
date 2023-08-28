class CommentsController < ApplicationController
#debugger
  def show
    @event = Event.find(params[:event_id])
    @comment = @event.comments
    redirect_to @comment
  end

  def create
    @event = Event.find(params[:event_id])
    
    if @event.user != current_user
      @comment = @event.comments.build(comment_params.merge(user: current_user))
      if @comment.save
        redirect_to @event, notice: 'Comment was successfully created.'
      else
        redirect_to @event, alert: 'Failed to create comment.'
      end
    else
      redirect_to @event, alert: 'You cannot comment on your own event.'
    end
  end

  private

  def comment_params
   # params.require(:comment).permit(:content)

    params.require(:comment).permit(:content,:image)
  end
end
