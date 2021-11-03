# frozen_string_literal: true

module QuestionsHelper
  def question_header(question)
    if question.new_record?
      t('shared.message.new_question')
    else
      t('shared.message.edit_question')
    end
  end
end
