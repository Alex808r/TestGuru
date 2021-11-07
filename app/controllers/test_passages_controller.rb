# frozen_string_literal: true

class TestPassagesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_test_passage, only: %i[show result update gist]

  def show; end

  def result; end

  def update
    @test_passage.accept!(params[:answer_ids])
    if @test_passage.completed?
      TestsMailer.completed_test(@test_passage).deliver_now
      redirect_to result_test_passage_path(@test_passage)
    else
      render :show
    end
  end

  def gist
    result = GistQuestionService.new(@test_passage.current_question)
    gist = result.call
    if result.success?
      current_user.gists.create(
        question: @test_passage.current_question, gist_hash: gist.id, gist_url: gist.html_url)
      flash[:notice] = "#{view_context.link_to('Gist', gist.html_url, target: '_blank')} #{t('.success')}"
    else
      flash[:alert] = t('.failure')
    end

   redirect_to @test_passage
  end

  private

  def set_test_passage
    @test_passage = TestPassage.find(params[:id])
  end
end
