# frozen_string_literal: true

class GistsController < ApplicationController
  before_action :authenticate_user!

  def create
    @test_passage = TestPassage.find(params[:test_passage_id])
    result = GistQuestionService.new(@test_passage.current_question).call

    if result.success?
      flash[:notice] =
        "#{view_context.link_to('Gist', result.html_url, target: '_blank', rel: 'noopener')} #{t('.success')}"
        Gist.create(gist_hash: result.id, gist_url: result.html_url, user: current_user, question: @test_passage.current_question)
    else
      flash[:alert] = t('.failure')
    end

    redirect_to @test_passage
  end
end
