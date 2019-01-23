class FeedbacksController < ApplicationController
  def new
    @feedback = Feedback.new
  end

  def create
    @feedback = FeedbackService.new(feedback_params).call
    return render action: :new if @feedback.errors.present?

    redirect_to new_feedback_path
  end

  private

    def feedback_params
      params.require(:feedback).permit(:body, :email)
    end
end
