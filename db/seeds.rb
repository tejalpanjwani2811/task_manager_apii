# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

# # Priorities
# Priority.create([{ name: 'Low' }, { name: 'Medium' }, { name: 'High' }])

# # Users
# users = User.create([
#   { name: 'Alice', email: 'alice@example.com' },
#   { name: 'Bob', email: 'bob@example.com' }
# ])

# # Teams
# team = Team.create(name: 'Dev Team')
# team.users << users.first


# Create priorities
low = Priority.create(name: 'Low', color_code: 'green')
medium = Priority.create(name: 'Medium', color_code: 'yellow')
high = Priority.create(name: 'High', color_code: 'red')

# Create users
user1 = User.create(name: 'Alice', email: 'alice@example.com')
user2 = User.create(name: 'Bob', email: 'bob@example.com')

# Create teams
team1 = Team.create(name: 'Team A')
team2 = Team.create(name: 'Team B')

# Assign users to teams
team1.users << user1
team2.users << user2

# Create tasks
task1 = Task.create(title: 'Task 1', description: 'Description for task 1', status: :completed, assigned_to: user1, priority_id: high.id, due_date: '2025-04-20')
task2 = Task.create(title: 'Task 2', description: 'Description for task 2', status: :pending, assigned_to: user2, priority_id: medium.id, due_date: '2025-04-25')

# Create comments
Comment.create(content: 'This is a comment for Task 1', user_id: user1.id, task_id: task1.id)
