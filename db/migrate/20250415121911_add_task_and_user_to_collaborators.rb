class AddTaskAndUserToCollaborators < ActiveRecord::Migration[8.0]
  def change
    # add_reference :collaborators, :task, null: false, foreign_key: true
    # add_reference :collaborators, :user, null: false, foreign_key: true
  end
end
