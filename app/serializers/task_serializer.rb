# app/serializers/task_serializer.rb
class TaskSerializer < ActiveModel::Serializer
  attributes :id, :title, :description, :status, :assigned_user, :priority_id, :due_date

  belongs_to :priority
  belongs_to :assigned_user, class_name: 'User', foreign_key: 'assigned_to'

  # You can also include any other relationships you need, for example:
  # has_many :comments
  # has_many :collaborators
  # has_many :users, through: :collaborators
end
