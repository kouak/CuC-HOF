# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)

Poll.destroy_all

this_year = Time.now.year
this_month = Time.now.month
start_date = DateTime.new(this_year, this_month)

Poll.create(:state => 'ongoing', :start => start_date)
Poll.create(:state => 'pending', :start => start_date + 1.month)
Poll.create(:state => 'closed', :start => start_date - 1.month)