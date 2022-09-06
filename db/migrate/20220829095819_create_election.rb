# frozen_string_literal: true

class CreateElection < ActiveRecord::Migration[5.2]
  def change
    create_table :elections do |t|
      t.string :start_time, null: false, default: ''
      t.string :end_time, null: false, default: ''

      t.timestamps
    end
  end
end
