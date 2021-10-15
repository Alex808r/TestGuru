class QuestionsController < ApplicationController

  before_action :set_test, only: %i[new index create]
  before_action :set_question, only: %i[show destroy]

  #rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_question_not_found

  def index
    @questions = @test.questions
    render plain: @questions.inspect
  end

  def show
    render plain: @question.inspect
  end

  def new
    @question = Question.new
  end

  def create
    @question = @test.questions.new(question_params)
    if @question.save
      render plain: @question.inspect
    else
      #render plain: "The question was not created"
      render :new
    end
  end

  def destroy
    @question.destroy
    redirect_to test_path(@question.test)
  end

  private

  def question_params
    params.require(:question).permit(:body)
  end

  def set_test
    @test = Test.find(params[:test_id])
    # @test = Test.find_by(id: params[:test_id])
  end

  def set_question
    @question = Question.find(params[:id])
  end

  def rescue_with_question_not_found
    render plain: "Question was not found"
  end

end
