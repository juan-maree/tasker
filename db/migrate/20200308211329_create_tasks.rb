class CreateTasks < ActiveRecord::Migration[5.2]
  def change
    create_table :tasks do |t|
      t.string :title
      t.datetime :due_date
      t.string :status
      t.text :description

      t.timestamps
    end
  end
end
