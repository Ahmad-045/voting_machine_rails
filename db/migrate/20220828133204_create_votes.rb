class CreateVotes < ActiveRecord::Migration[5.2]
  def change
    create_table :votes do |t|
      t.belongs_to :candidate
      t.belongs_to :user, index: { unique: true}

      t.timestamps
    end
  end
end
