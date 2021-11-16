# frozen_string_literal: true

class TestPassagesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_test_passage, only: %i[show result update]

  def show; end

  def result; end

  def update
    @test_passage.accept!(params[:answer_ids])
    if @test_passage.completed?

      @test_passage.success_true if @test_passage.test_successful?

      badge = SendBadgeService.new(@test_passage).call
      if badge.present?
          flash[:notice] =
            "#{t('.recieved')} #{view_context.link_to(t('.all_badges'), badges_path, target: '_blank',
                                                                                     rel: 'noopener').html_safe} "
      end

      TestsMailer.completed_test(@test_passage).deliver_now
      redirect_to result_test_passage_path(@test_passage)
    else
      render :show
    end
  end

  private

  def set_test_passage
    @test_passage = TestPassage.find(params[:id])
  end
end
