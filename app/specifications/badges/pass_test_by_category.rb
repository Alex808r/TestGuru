module Badges
  class PassTestByCategory < BadgeRuleSpecification
    def is_satiesfies?
      @category = Category.where(title: @value).first
      return false unless @test_passage.test.category == @category
      all_tests_in_category = Test.show_tests_by_category(@category).count
      users_tests_by_category = TestPassage.successfull.joins(:test)
                                 .where(user_id: @test_passage.user.id, tests: { category_id: @test_passage.test.category.id } )
                                 .select(:test_id).distinct.count
      all_tests_in_category == users_tests_by_category
    end
  end
end
