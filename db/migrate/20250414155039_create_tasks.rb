class CreateTasks < ActiveRecord::Migration[8.0]
  def change
    create_table :tasks do |t|
      t.string :title
      t.text :description
      t.integer :status, default: 0
      t.integer :assigned_to
      t.references :priority, null: false, foreign_key: true
      t.date :due_date

      t.timestamps
    end
  end
end
