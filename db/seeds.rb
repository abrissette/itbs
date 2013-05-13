# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
projects = Project.create([ {code: '000000', name: 'General'}, \
                            {code: '603002', name: 'iLove Server Design'}, \
                            {code: '603003', name: 'iLove Server Development'}, \
                            {code: '603008', name: 'Mobile Design (Android & iOS)'}, \
                            {code: '603009', name: 'Mobile Development (Android & iOS)'}])

types = Type.create([ {code: '7000', name: 'Project Mng'}, \
                            {code: '7130', name: 'Tech Spec - Requirements'}, \
                            {code: '7210', name: 'Design Code'}, \
                            {code: '7100', name: 'User Interface Design'}, \
                            {code: '8310', name: 'Issue/Bug Analysis'}, \
                            {code: '7230', name: 'Programming'}, \
                            {code: '7240', name: 'Code Review/Pull Request'}, \
                            {code: '7414', name: 'Deployment'}, \
                            {code: '9925', name: 'Recruiting'}, \
                            {code: '9990', name: 'Vacation'}, \
                            {code: '9960', name: 'Travel Non-Billable'}, \
                            {code: '9910', name: 'Internal training'}, \
                            {code: '9940', name: 'Staff Meeting'}, \
                            {code: '7050', name: 'Ressource/Sprint Planning'}, \
                            {code: '7140', name: 'Design Test Case'}, \
                            {code: '7250', name: 'Unit Testing'}, \
                            {code: '7520', name: 'Integrated Testing'}, \
                            {code: '7530', name: 'Performance Testing'}, \
                            {code: '9993', name: 'Absence (Unpaid)'}, \
                            {code: '9991', name: 'Illness'}, \
                            {code: '9964', name: 'Travel Arrangements'}, \
                            {code: '9935', name: 'Staff Management'}])

Worklog.create(date:'01/05/2013', description:'Make some work', employee_name:'Andre', project: projects.first, type: types.first,value:'30')
