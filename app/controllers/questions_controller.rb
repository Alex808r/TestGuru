# frozen_string_literal: true

class QuestionsController < ApplicationController
  before_action :authenticate_user!

  before_action :set_test, only: %i[new create]
  before_action :set_question, only: %i[show destroy edit update]

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_question_not_found

  def show; end

  def new
    @question = Question.new
  end

  def create
    @question = @test.questions.build(question_params)
    if @question.save
      redirect_to test_path(@question.test)
    else
      render :new
    end
  end

  def edit; end

  def update
    if @question.update(question_params)
      redirect_to @question.test
    else
      render :edit
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
      render plain: 'Question was not found'
    end
end
