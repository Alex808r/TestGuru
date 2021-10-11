class QuestionsController < ApplicationController

  before_action :set_test!, only: %i[index show create destroy]
  before_action :set_test!, only: %i[show destroy]

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_question_not_found

  def index
    # / tests/:test_id/questions(.:format)
    questions = @test.questions
    render plain: questions.inspect
  end

  def show
    # /tests/:test_id/questions/:id(.:format)
    render plain: @question.inspect
  end

  def new
  end

  def create
    #/tests/:test_id/questions(.:format)
    question = @test.questions.new(question_params)
    if question.save
      render plain: question.inspect
    else
      render plain: "The question was not created"
    end
  end

  def destroy
    #/tests/:test_id/questions/:id
    if @question.destroy
      redirect_to test_questions_path
    else
      render plain: "The question was not deleted"
    end
  end

  private

  def set_test!
    @test = Test.find(params[:test_id])
  end

  def set_question!
    @question = @test.questions.find(params[:id])
  end

  def question_params
    params.require(:question).permit(:body)
  end

  def rescue_with_question_not_found
    render plain: "Question was not found"
  end

end
