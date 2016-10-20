# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#

#have to clear all user data to fill correct data fields
Instructor.delete_all

# These two are only available when the omniauth 'developer' strategy is enabled (ie, not in production)
@user00 = Instructor.create!(username: "saas", uid: "saas", name: "SaaS Instructor", provider: "developer")
Whitelist.create!(username: @user00.username, provider: "developer", privilege: "instructor")
@user01 = Instructor.create!(username: "saas-admin", uid: "saas-admin", name: "Admin", provider: "developer")
Whitelist.create!(username: @user01.username, provider: "developer", privilege: "admin")
@user02 = Instructor.create!(username: "levin", uid: "levin", name: "levin", provider: "developer")
Whitelist.create!(username: @user02.username, provider: "developer", privilege: "admin")

# @user03 = Whitelist.create!(username: "hrzlvn", privilege: "admin")

@user04 = Instructor.create!(username: "student_one", uid: "student_one", name: "student_one", provider: "developer")
# Whitelist.create!(username: @user04.username, provider: "developer", privilege: "student")


