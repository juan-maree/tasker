class CreateTaskTags < ActiveRecord::Migration[6.0]
  def change
    create_table :task_tags do |t|
      t.belongs_to :task, index: true
      t.belongs_to :tag, index: true
      t.timestamps
    end
  end
end
