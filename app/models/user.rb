class User < ApplicationRecord
  has_many :tasks, foreign_key: 'assigned_to'
  has_many :comments
  has_and_belongs_to_many :teams
  has_many :collaborators
  has_many :tasks, through: :collaborators
  has_many :collab_tasks, through: :collaborators, source: :task
end