# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

return if User.exists? && Test.exists? && Category.exists?


users = User.create([
                     {first_name: 'Main', last_name: 'Admin', name: 'Main Admin',
                      email: 'admin@admin.com', password: '123456', type: 'Admin'}])

categories = Category.create!([
                                { title: 'Backend' },
                                { title: 'Frontend' }
                              ])

tests = Test.create([
                      { title: 'Ruby 0',  level: 0, category: categories[0], author: users[0] },
                      { title: 'Rails 2', level: 2, category: categories[0], author: users[0] },
                      { title: 'HTML',    level: 1, category: categories[1], author: users[0] },
                    ])

questions = Question.create!([
                               { body: 'Who is the author of the Ruby language?', test: tests[0] },
                               { body: 'Ruby typing', test: tests[0] },
                               { body: 'What a local variable looks like', test: tests[0] },
                               { body: 'Rails uses MVC?', test: tests[1] },
                               { body: 'What is Ruby on Rails', test: tests[1] },
                               { body: 'HTML protocol has state?', test: tests[2] },
                               { body: 'What tag is used for links', test: tests[2] },


                             ])
# rubocop:disable Lint/UselessAssignment
answers = Answer.create!([
                           { body: 'Matz', question: questions[0], correct: true },
                           { body: 'Linus Torvalds', question: questions[0], correct: false },
                           { body: 'Dynamic', question: questions[1], correct: true },
                           { body: 'Static', question: questions[1], correct: false },
                           { body: 'foo', question: questions[2],correct: true },
                           { body: '@bar', question: questions[2],correct: false },
                           { body: '@@bazz', question: questions[2],correct: false },
                           { body: 'Yes', question: questions[3],correct: true },
                           { body: 'No', question: questions[3],correct: false },
                           { body: 'Framework', question: questions[4],correct: true },
                           { body: 'Programing language', question: questions[4],correct: false },
                           { body: 'Operating system', question: questions[4],correct: false },
                           { body: 'Yes', question: questions[5],correct: false },
                           { body: 'No', question: questions[5],correct: true },
                           { body: '<a>', question: questions[6],correct: true },
                           { body: '<b>', question: questions[6],correct: false },
                           { body: '<div>', question: questions[6],correct: false }
                         ])
# rubocop:enable Lint/UselessAssignment
