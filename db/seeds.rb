# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

return if User.exists? && Test.exists? && Category.exists?

users = User.create!([
                       { name: 'It is Author', email: 'author@author.com' },
                       { name: 'Mike', email: 'mike@mike.com' },
                       { name: 'Dave', email: 'dave@dave.com' }
                     ])

categories = Category.create!([
                                { title: 'Backend' },
                                { title: 'Frontend' },
                                { title: 'Data Science' },
                                { title: 'Mobile development' }
                              ])

tests = Test.create([
                      { title: 'Ruby 0', level: 0, category: categories[0], author: users[0] },
                      { title: 'Ruby 1',   level: 1, category: categories[0], author: users[0] },
                      { title: 'Rails 2',  level: 2, category: categories[0], author: users[0] },
                      { title: 'Rails 3',  level: 3, category: categories[0], author: users[0] },
                      { title: 'HTML 4',     level: 4, category: categories[1], author: users[0] },
                      { title: 'Python 5',   level: 5, category: categories[2], author: users[0] },
                      { title: 'Swift 6',    level: 6, category: categories[3], author: users[0] },
                      { title: 'Swift 7',    level: 7, category: categories[3], author: users[0] }
                    ])

questions = Question.create!([
                               { body: 'Question 1', test: tests[0] },
                               { body: 'Question 2', test: tests[0] },
                               { body: 'Question 3', test: tests[1] },
                               { body: 'Question 4', test: tests[1] },
                               { body: 'Question 5', test: tests[4] }
                             ])
# rubocop:disable Lint/UselessAssignment
answers = Answer.create!([
                           { body: 'Answer 1', question: questions[0] },
                           { body: 'Answer 2', question: questions[0] },
                           { body: 'Answer 3', question: questions[2] },
                           { body: 'Answer 3', question: questions[2] },
                           { body: 'Answer 4', question: questions[3] },
                           { body: 'Answer 5', question: questions[1] }
                         ])
# rubocop:enable Lint/UselessAssignment
