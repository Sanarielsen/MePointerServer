class CreateTimerTypes < ActiveRecord::Migration[8.1]
  def change
    create_table :timer_types do |t|
      t.string :name
      t.integer :seconds

      t.timestamps
    end
  end
end
