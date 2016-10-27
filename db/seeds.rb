# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#

#have to clear all user data to fill correct data fields
User.delete_all

# These two are only available when the omniauth 'developer' strategy is enabled (ie, not in production)
@user00 = Admin.create!(username: "SaaS-Admin", uid: "saas", name: "CourseQuestionBank Admin",
                        provider: "developer", privilege: "Admin")
Whitelist.create!(username: @user00.username, provider: "developer", privilege: "Admin")

@user01 = Instructor.create!(username: "A-CS169-TA", uid: "MAGICAL169GSI", name: "Tony Lee",
                              provider: "developer", privilege: "Instructor")
Whitelist.create!(username: @user01.username, provider: "developer", privilege: "Instructor")

@user02 = Instructor.create!(username: "Another-UGSI", uid: "IMAGINARYUGSI", name: "Dorthy Luu",
                              provider: "developer", privilege: "Instructor")
Whitelist.create!(username: @user02.username, provider: "developer", privilege: "Instructor")

@user03 = Student.create!(username: "stevenwuyinze", uid: "stevenwu", name: "Steven (Yinze) Wu",
                          privilege: "Student", provider: "developer")



