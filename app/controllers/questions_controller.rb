class QuestionsController < ApplicationController

  before_action :set_test!, only: %i[index show]

  def index
    # /tests/:test_id/questions(.:format)
    @questions = @test.questions
    render plain: @questions.inspect
      # render inline: "<%= @questions.each(&:class)%>"
  end

  def show
    # /tests/:test_id/questions/:id(.:format)
    @question = @test.questions.find(params[:id])
    render plain: @question.inspect
  end

  def create

  end

  private

  def set_test!
    @test = Test.find(params[:test_id])
  end

end
