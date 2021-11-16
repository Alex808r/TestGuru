# frozen_string_literal: true

class SendBadgeService

  attr_accessor :test_passage, :add_awards

  RULE = { first_test_passed: Badges::FirstTestPassed,
            pass_test_by_level: Badges::PassTestByLevel,
           pass_test_by_category: Badges::PassTestByCategory
  }.freeze

  # def initialize(test_passage)
  #   @test_passage = test_passage
  #   @user = test_passage.user
  #   @test = test_passage.test
  # end

  def initialize(test_passage)
    @test_passage = test_passage
  end

  def call
    #Badge.select { |badge| send(badge.rule, badge.parameter) }
    Badge.select do |badge|
      rule = RULE[badge.rule.to_sym].new(test_passage: @test_passage, value: badge.parameter)

      add_awards(badge) if rule.is_satiesfies?
    end


  end

  def add_awards(badge)
    @test_passage.user.badges << badge unless @test_passage.user.badges.ids.include?(badge.id)
  end


  private

  # def all_in_category?(badge_param)
  #   return false unless @test.category.title == badge_param
  #
  #   all_tests_in_category = Test.show_tests_by_category(badge_param).count
  #   users_tests_by_category = TestPassage.successfull.joins(:test)
  #                            .where(user_id: @user.id, tests: { category_id: @test.category.id })
  #                            .select(:test_id).distinct.count
  #
  #   all_tests_in_category == users_tests_by_category
  # end
  #
  # def all_tests_by_level?(badge_param)
  #   return false unless @test.level == badge_param.to_i
  #
  #   test_ids = Test.where(level: badge_param).ids
  #   test_ids.size == count_tests_success(test_ids)
  # end
  #
  # def on_first_try?(badge_param)
  #   @user.tests.where(title: badge_param).count == 1 if @test_passage.success?
  # end
  #
  # def count_tests_success(test_ids)
  #   @user.test_passages.where(test_id: test_ids).successfull.uniq.count
  # end
end
