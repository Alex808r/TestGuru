class AddColumnPassingTimeToTest < ActiveRecord::Migration[6.1]
  def change
    add_column :tests, :passing_time, :integer, default: nil
  end
end
