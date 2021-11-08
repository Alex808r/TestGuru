# frozen_string_literal: true

class GistsController < ApplicationController
  before_action :authenticate_user!

  def create
    @test_passage = TestPassage.find(params[:id])
    result = GistQuestionService.new(@test_passage.current_question).call

    if result.success?
      flash[:notice] =
        "#{view_context.link_to('Gist', result.html_url, target: '_blank', rel: 'noopener')} #{t('.success')}"
    else
      flash[:alert] = t('.failure')
    end

    redirect_to @test_passage
  end
end
