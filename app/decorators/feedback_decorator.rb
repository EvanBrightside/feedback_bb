class FeedbackDecorator < Draper::Decorator
  delegate_all

  def question?
    !replied? && email.present?
  end

  def review?
    email.nil? || email.blank?
  end
end
