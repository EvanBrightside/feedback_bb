class Admin::RepliesController < Admin::BaseController
  before_action :set_current_user

  def new
    @reply = feedback.replies.build
  end

  def create
    @reply = ReplyService.new(reply_params, feedback: feedback).call
    return render action: :new if @reply.errors.present?

    redirect_to admin_feedbacks_path
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
