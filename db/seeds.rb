# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
 
PEOPLE = [["Carly Fiorina", 1954, "female"],["Donald Trump", 1946, "male"],["Ben Carson", 1951, "male"],["Hillary Clinton", 1947, "female"]]
 
User.destroy_all

PEOPLE.each do |obj|
	user = User.create!(username: obj[0].split(" ")[1], password_digest: (0...8).map { (65 + rand(26)).chr }.join)
	Profile.create!(gender: obj[2], birth_year: obj[1], first_name: obj[0].split(" ")[0], last_name: obj[0].split(" ")[1], user_id: user.id)
	todoList = TodoList.create!(list_name: "TodoList", list_due_date: Date.today>>12, user_id: user.id)

	5.times do |i|
  		TodoItem.create!(due_date: todoList.list_due_date, title: "title #{i}", description: "description #{i}", todo_list_id: todoList.id)
	end
end

