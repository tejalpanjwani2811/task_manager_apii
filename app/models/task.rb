class Task < ApplicationRecord
  belongs_to :assigned_user, class_name: 'User', foreign_key: 'assigned_to'
  belongs_to :priority
  has_many :comments
  has_many :collaborators
  has_many :users, through: :collaborators

  # enum status: { pending: 0, in_progress: 1, completed: 2 }
  enum :status, [:pending, :in_progress, :completed]
end
