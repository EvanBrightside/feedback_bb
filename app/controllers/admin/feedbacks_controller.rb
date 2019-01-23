class Admin::FeedbacksController < Admin::BaseController
  def index
    @feedbacks = Feedback.decorate
  end

  def create
    @feedback = Feedback.new(feedback_params)

    if @feedback.save
      redirect_to admin_feedback_path(@feedback)
    else
      render :new
    end
  end

  private

    def feedback_params
      params.require(:feedback).permit(:body, :email)
    end
end
