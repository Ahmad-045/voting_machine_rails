# frozen_string_literal: true

class CreateCandidates < ActiveRecord::Migration[5.2]
  def change
    create_table :candidates do |t|
      t.string :party_name,       null: false, default: ''
      t.boolean :approved,        default: false
      t.belongs_to :user
      t.belongs_to :halka

      t.timestamps
    end
  end
end
