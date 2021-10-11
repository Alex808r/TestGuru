class QuestionsController < ApplicationController

  before_action :set_test!, only: %i[index show create]

  def index
    # / tests/:test_id/questions(.:format)
    @questions = @test.questions
    render plain: @questions.inspect
      # render inline: "<%= @questions.each(&:class)%>"
  end

  def show
    # /tests/:test_id/questions/:id(.:format)
    @question = @test.questions.find(params[:id])
    render plain: @question.inspect
  end

  def new
  end

  def create
    #/tests/:test_id/questions(.:format)
    @question = @test.questions.new(question_params)
    if @question.save
      render plain: @question.inspect
    else
      render plain: "The question was not created"
    end
  end

  private

  def set_test!
    @test = Test.find(params[:test_id])
  end

  def question_params
    params.require(:question).permit(:body)
  end

end
