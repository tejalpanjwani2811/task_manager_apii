class Task < ApplicationRecord
  belongs_to :user, foreign_key: 'assigned_to'
  belongs_to :priority
  has_many :comments
  has_many :collaborators
  has_many :users, through: :collaborators
end
