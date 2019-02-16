require 'bundler/setup'
Bundler.require

if development?
  ActiveRecord::Base.establish_connection('sqlite3:db/development.db')
end

class Answer < ActiveRecord::Base
  validates :name,
    presence: true,
    format: { with: /\A\w+\z/ }
  validates :age,
    length: {in: 1..2}
  validates :email,
    presence :true,
    format: { with: /[@]/ }
  validates :password
    presence: true
end