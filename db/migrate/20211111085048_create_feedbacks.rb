# frozen_string_literal: true

class CreateFeedbacks < ActiveRecord::Migration[6.1]
  def change
    create_table :feedbacks do |t|
      t.string :user_name, null: false
      t.string :email, null: false
      t.string :header, null: false
      t.string :content, null: false

      t.timestamps
    end
  end
end
