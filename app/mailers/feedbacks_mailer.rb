class FeedbacksMailer < ApplicationMailer
  def send_feedback(feedback)
    @feedback = feedback
    mail to: Admin.all.map(&:email)
  end
end
