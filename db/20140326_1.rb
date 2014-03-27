require 'sequel'
require 'pp'


DB = Sequel.connect('sqlite://dev.db')

# DB.run("create table t (a text, b text)")
DB.run("drop table t")

# t = DB.from(:t)

# t.each do |row|
#   pp row[:a]
# end