class FeedbacksController < ApplicationController
  def new
    @feedback = Feedback.new
  end

  def create
    @feedback = Feedback.new(feedback_params)
    if @feedback.save
      redirect_to :new_feedback
    else
      render :new
    end
  end

  private

    def feedback_params
      params.require(:feedback).permit(:body, :email)
    end
end
