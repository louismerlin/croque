DB = Sequel.connect('postgres://hello:coffee@db/')

class User < Sequel::Model
	many_to_many :lunches
end
User.unrestrict_primary_key

Sequel.inflections do |inflect|
  inflect.irregular 'lunch', 'lunches'
end

class Lunch < Sequel::Model
	many_to_many :users
end

class Question < Sequel::Model
	many_to_many :menus
	one_to_many :answers
end

class Menu < Sequel::Model
	many_to_many :questions
end

class Answer < Sequel::Model
	many_to_one :question
end

class Lunchrequest < Sequel::Model
end
