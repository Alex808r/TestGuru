# frozen_string_literal: true

# == Schema Information
#
# Table name: test_passages
#
#  id                  :bigint           not null, primary key
#  correct_questions   :integer          default(0)
#  success             :boolean          default(FALSE)
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#  current_question_id :integer
#  test_id             :integer          not null
#  user_id             :integer          not null
#
# Indexes
#
#  index_test_passages_on_current_question_id  (current_question_id)
#  index_test_passages_on_test_id              (test_id)
#  index_test_passages_on_user_id              (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (current_question_id => questions.id)
#  fk_rails_...  (test_id => tests.id)
#  fk_rails_...  (user_id => users.id)
#
class TestPassage < ApplicationRecord
  SUCCESSFUL_SCORE = 85

  belongs_to :user
  belongs_to :test
  belongs_to :current_question, class_name: 'Question', optional: true

  before_validation :before_validation_set_first_question, on: :create

  scope :successfull, -> { where(success: true) }

  def success_true
    update(success: true)
  end

  def total_questions
    test.questions.count
  end

  def current_question_number
    test.questions.index(current_question) + 1
  end

  def test_successful?
    passage_percentes >= SUCCESSFUL_SCORE
  end

  def passage_percentes
    correct_questions.to_f * 100 / test.questions.count
  end

  def completed?
    current_question.nil? || time_is_out?
  end

  def time_is_out?
    return if self.test.passing_time.nil?
    ((self.created_at + self.test.passing_time * 60) - Time.now) <= 0
  end

  def accept!(answer_ids)
    self.correct_questions += 1 if correct_answer?(answer_ids)

    self.current_question = next_question
    save!
  end


  private

  def before_validation_set_first_question
    self.current_question = test.questions.first if test.present?
  end

  def correct_answer?(answer_ids)
    correct_answers.ids.sort == answer_ids.to_a.map(&:to_i).sort
  end

  def correct_answers
    current_question.answers.correct_answer
  end

  def next_question
    test.questions.order(:id).where('id > ?', current_question.id).first
  end
end
