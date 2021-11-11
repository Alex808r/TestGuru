# Preview all emails at http://localhost:3000/rails/mailers/feedbacks_mailer
class FeedbacksMailerPreview < ActionMailer::Preview
  def send_feedback
    feedback = Feedback.new(user_name: "User", email: "user@user.com", header: "Header", content: "Content")
    FeedbacksMailer.send_feedback(feedback)
  end
end


