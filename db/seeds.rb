# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
projects = Project.create([ {code: '603002', name: 'iLove Server Design'}, \
                            {code: '603003', name: 'iLove Server Development'}, \
                            {code: '603008', name: 'Mobile Design (Android & iOS)'}, \
                            {code: '603009', name: 'Mobile Development (Android & iOS)'}])

Worklog.create(date:'01/05/2013', description:'Make some work', employee_name:'Andre', project: projects.first, type_code:'4',value:'30')
