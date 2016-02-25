# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
#user = CreateAdminService.new.call
#puts 'CREATED ADMIN USER: ' << user.email
# Environment variables (ENV['...']) can be set in the file config/application.yml.
# See http://railsapps.github.io/rails-environment-variables.html

puts '设定类型---------------'
{'role'=>{:en=>'Role',:'zh-CN'=>'角色'},
 'visitor_option'=>{:en=>'Visitor option',:'zh-CN'=>'访客选择'},
 'data_type'=>{:en=>'Data type',:'zh-CN'=>'资料类型'},
 'data_item'=>{:en=>'Data item',:'zh-CN'=>'资料项目'},
 'picture_type'=>{:en=>'Picture type',:'zh-CN'=>'相片类型'}}.each do |type,i18n|
  type = Type.find_or_create_by!(name: type) do |type|
    i18n.each do |i,title|
      puts i
      puts title
      I18n.locale =i
      type.title=title
      type.description=''
    end
  end
end
puts '完成类型设定---------------'


puts '设定角色---------------'
{'admin'=>{:en=>'Admin',:'zh-CN'=>'管理员'},
 'registered'=>{:en=>'Registered user',:'zh-CN'=>'注册用户'},
 'senior'=>{:en=>'Senior user',:'zh-CN'=>'高级用户'},
 'vip'=>{:en=>'VIP',:'zh-CN'=>'VIP'}}.each do |state,i18n|
  role = State.find_or_create_by!(name: state) do |role|
    role.type=Type.find_by_name('role')
    i18n.each do |i,title|
      puts i
      puts title
      I18n.locale =i
      role.title=title
    end
  end
end
puts '完成角色设定---------------'

user = CreateAdminService.new.call
puts 'CREATED ADMIN USER: ' << user.email

puts '访客选项设定---------------'
{'male_seeking_females'=>{:en=>'Male seeking Females',:'zh-CN'=>'男士寻找女士'},
 'female_seeking_males'=>{:en=>'Female seeking Males',:'zh-CN'=>'女士寻找男士'},
 'male_seeking_males'=>{:en=>'Male seeking Males',:'zh-CN'=>'男士寻找男士'},
 'female_seeking_females'=>{:en=>'Female seeking Females',:'zh-CN'=>'女士寻找女士'}}.each do |state,i18n|
  visitor_option = State.find_or_create_by!(name: state) do |visitor_option|
    visitor_option.type=Type.find_by_name('visitor_option')
    i18n.each do |i,title|
      puts i
      puts title
      I18n.locale =i
      visitor_option.title=title
      visitor_option.description=''
    end
  end
end
puts '完成访客选项设定---------------'

puts '设定资料类型---------------'
{'general'=>{:en=>'General',:'zh-CN'=>'普通'},
 'advanced'=>{:en=>'Advanced',:'zh-CN'=>'高级'},
 'private'=>{:en=>'Private',:'zh-CN'=>'私密'}}.each do |state,i18n|
  data_type = State.find_or_create_by!(name: state) do |data_type|
    data_type.type=Type.find_by_name('data_type')
    i18n.each do |i,title|
      puts i
      puts title
      I18n.locale =i
      data_type.title=title
      data_type.description=''
    end
  end
end
puts '完成资料类型设定---------------'

puts '设定资料项目---------------'
{'greeting'=>{:en=>'Greeting',:'zh-CN'=>'问候语'},
 'age'=>{:en=>'Age',:'zh-CN'=>'年龄'},
 'birthday'=>{:en=>'Birthday',:'zh-CN'=>'生日'},
 'height'=>{:en=>'Height',:'zh-CN'=>'身高'},
 'weight'=>{:en=>'Weight',:'zh-CN'=>'体重'},
 'country'=>{:en=>'Country',:'zh-CN'=>'国家'},
 'province'=>{:en=>'Province',:'zh-CN'=>'省份'},
 'city'=>{:en=>'City',:'zh-CN'=>'城市'},
 'district'=>{:en=>'District',:'zh-CN'=>'地区'}}.each do |state,i18n|
  data_item = State.find_or_create_by!(name: state) do |data_item|
    data_item.type=Type.find_by_name('data_item')
    i18n.each do |i,title|
      puts i
      puts title
      I18n.locale =i
      data_item.title=title
      data_item.description=''
    end
  end
end
puts '完成资料项目设定---------------'

puts '设定相片类型---------------'
{'public_photo'=>{:en=>'Public photo',:'zh-CN'=>'公开相片'},
 'private_photo'=>{:en=>'Private photo',:'zh-CN'=>'私有相片'}}.each do |state,i18n|
  picture_type = State.find_or_create_by!(name: state) do |picture_type|
    picture_type.type=Type.find_by_name('picture_type')
    i18n.each do |i,title|
      puts i
      puts title
      I18n.locale =i
      picture_type.title=title
      picture_type.description=''
    end
  end
end
puts '完成相片类型设定---------------'

puts '测试用户设定开始---------------'
50.times do |n|
  User.find_or_create_by!(email: "user#{n}@mint.com") do |user|
    user.password = '11111111'
    user.password_confirmation = '11111111'
  end
end
puts '完成测试用户设定---------------'
