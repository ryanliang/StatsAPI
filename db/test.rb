require 'sequel'

DB = Sequel.connect("sqlite://#{Dir.pwd}/dev.db")

areas = DB[:areas]

# areas.each { |r| r.update(:display_name => 'abc' ) }
areas.update(display_name: :name)
areas.each { |r| p r}