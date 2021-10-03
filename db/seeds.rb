# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
#

users = User.create!([
  {name: "It is Author", email: "author@author.com"},
  {name: "Mike", email: "mike@mike.com"},
  {name: "Dave", email: "dave@dave.com"},
                    ])

categories = Category.create!([
  {title: "Frontend"},
  {title: "Backend"},
  {title: "Data Science"},
  {title: "Mobile development"}
])

tests =  Test.create!([
  {title: "Ruby", category_id: categories[1].id, author_id: users[0].id},
  {title: "Ruby", level: 1, category_id: categories[1].id, author_id: users[0].id},
  {title: "Rails", category_id: categories[1].id, author_id: users[0].id},
  {title: "Rails", level: 2, category_id: categories[1].id, author_id: users[0].id},
  {title: "Swift", level: 1, category_id: categories[3].id, author_id: users[0].id},

  {title: "Swift", level: 2, category_id: Crategory.where(title: "Mobile development"), author_id: users[0].id}
])

questions = Question.create!([
  {body: "Question 1", test_id: tests[0].id},
  {body: "Question 2", test_id: tests[0].id},
  {body: "Question 3", test_id: tests[1].id},
  {body: "Question 4", test_id: tests[1].id},
  {body: "Question 5", test_id: tests[4].id}
])

answers = Answer.create!([
  {body: "Answer 1", question_id: questions[0].id},
  {body: "Answer 2", question_id: questions[0].id},
  {body: "Answer 1", question_id: questions[1].id},
  {body: "Answer 1", question_id: questions[1].id},
  {body: "Answer 1", question_id: questions[4].id},
])

