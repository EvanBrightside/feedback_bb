class Admin::RepliesController < Admin::BaseController
  before_action :set_current_user

  def new
    @reply = feedback.replies.build
  end

  def create
    @reply = feedback.replies.build(reply_params)
    if @reply.save
      @reply.feedback.update(replied: true)
      redirect_to admin_feedbacks_path
    else
      render 'new'
    end
  end

  private

    def set_current_user
      Reply.current_user = current_user
    end

    def reply_params
      params.require(:reply).permit(:message)
    end

    def feedback
      @feedback ||= Feedback.find(params[:feedback_id])
    end
    helper_method :feedback
end
