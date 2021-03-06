# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#

#have to clear all user data to fill correct data fields
Instructor.delete_all
Whitelist.delete_all
# These two are only available when the omniauth 'developer' strategy is enabled (ie, not in production)
@user00 = Instructor.create!(username: "SaaS-Admin", uid: "saas", name: "CourseQuestionBank Admin",
                        provider: "developer")
Whitelist.create!(username: @user00.username, provider: "developer", privilege: "Admin")

@user01 = Instructor.create!(username: "A-CS169-TA", uid: "MAGICAL169GSI", name: "Tony Lee",
                               provider: "developer")
Whitelist.create!(username: @user01.username, provider: "developer", privilege: "Instructor")

@user02 = Instructor.create!(username: "Another-UGSI", uid: "IMAGINARYUGSI", name: "Dorthy Luu",
                               provider: "developer")
Whitelist.create!(username: @user02.username, provider: "developer", privilege: "Instructor")

@user03 = Instructor.create!(username: "stevenwuyinze", uid: "stevenwu", name: "Steven (Yinze) Wu",
                           provider: "developer")
Whitelist.create!(username: @user03.username, provider: "developer", privilege: "Student")

@user04 = Instructor.create!(username: "zisudong", uid: "zisudong", name: "Zisu Dong",
                           provider: "developer")
Whitelist.create!(username: @user04.username, provider: "developer", privilege: "Student")

@user05 = Instructor.create!(username: "Joseph", uid: "Joseph", name: "Joseph",
                           provider: "developer")
Whitelist.create!(username: @user05.username, provider: "developer", privilege: "Student")

@user06 = Instructor.create!(username: "Harry", uid: "Harry", name: "Harry",
                           provider: "developer")
Whitelist.create!(username: @user06.username, provider: "developer", privilege: "Student")

@user07 = Instructor.create!(username: "yika", uid: "yika", name: "yika",
                           provider: "developer")
Whitelist.create!(username: @user07.username, provider: "developer", privilege: "Student")

@user08 = Instructor.create!(username: "clark", uid: "clark", name: "clark",
                           provider: "developer")
Whitelist.create!(username: @user08.username, provider: "developer", privilege: "Student")

@user09 = Instructor.create!(username: "Levin", uid: "Levin", name: "Levin",
                           provider: "developer")
Whitelist.create!(username: @user09.username, provider: "developer", privilege: "Admin")
