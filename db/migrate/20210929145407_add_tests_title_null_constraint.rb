class AddTestsTitleNullConstraint < ActiveRecord::Migration[6.1]
  def change
    change_column_null(:tests, :title, false)
    change_column_null(:tests, :level, false)
  end

  # def up
  #   change_column_null(:tests, :title, false)
  # end
  #
  # def down
  #   change_column_null(:tests, :title, false)
  # end

end
