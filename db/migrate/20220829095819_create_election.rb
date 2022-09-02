# frozen_string_literal: true

class CreateElection < ActiveRecord::Migration[5.2]
  def change
    create_table :elections do |t|
      t.string :start_time
      t.string :end_time

      t.timestamps
    end
  end
end
