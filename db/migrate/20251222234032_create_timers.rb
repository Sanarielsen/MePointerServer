class CreateTimers < ActiveRecord::Migration[8.1]
  def change
    create_table :timers do |t|
      t.string :name
      t.references :timer_type, null: false, foreign_key: true
      t.timestamps
    end
  end
end
