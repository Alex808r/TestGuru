# frozen_string_literal: true

class CreateBadges < ActiveRecord::Migration[6.1]
  def change
    create_table :badges do |t|
      t.string :title, null: false
      t.string :image_url, null: false
      t.string :rule, null: false
      t.string :parameter, null: false

      t.timestamps
    end
  end
end
