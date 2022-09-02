# frozen_string_literal: true

class CreateHalka < ActiveRecord::Migration[5.2]
  def change
    create_table :halkas do |t|
      t.string :name

      t.timestamps
    end
  end
end
