# frozen_string_literal: true

class SendBadgeService

  def initialize(test_passage)
    @test_passage = test_passage
    @user = test_passage.user
    @test = test_passage.test
  end

  def call
    Badge.select { |badge| send(badge.rule, badge.parameter, badge) }
  end

  def all_in_category?(category_title, badge)
    # if @test_passage.test_successful?

      all_tests_in_category = Test.show_tests_by_category(category_title).count
    users_tests_by_category = TestPassage.successfull.joins(:test)
                                         .where(user_id: @user.id, tests: { category_id: @test.category.id })
                                         .select(:test_id).distinct.count
      @test_passage.test_successful? && all_tests_in_category == users_tests_by_category && @test.category.title == badge.parameter
    # end
  end

  def all_tests_by_level?(level, badge)

      all_tests_by_level = Test.by_level(level).count
    users_all_tests_by_level = TestPassage.successfull.joins(:test)
                                          .where(user_id: @user.id, tests: { level: level })
                                          .select(:test_id).distinct.count
      @test_passage.test_successful? && all_tests_by_level == users_all_tests_by_level && @test.level == badge.parameter.to_i
  end

  def on_first_try?(_param = nil, badge)

    @test_passage.test_successful? && TestPassage.where(user_id: @user.id, test_id: @test.id).count == 1 && @test.title == badge.parameter
  end

end
