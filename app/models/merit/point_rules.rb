# Be sure to restart your server when you modify this file.
#
# Points are a simple integer value which are given to "meritable" resources
# according to rules in +app/models/merit/point_rules.rb+. They are given on
# actions-triggered, either to the action user or to the method (or array of
# methods) defined in the +:to+ option.
#
# 'score' method may accept a block which evaluates to boolean
# (recieves the object as parameter)

module Merit
  class PointRules
    include Merit::PointRulesMethods

    def initialize
      #用户注册
      score 10, :on => 'users/registrations#create', category: 'sign_up'
      # 每日签到
      # score 10, :on => 'users/sessions#create', category: 'daily_sign_in',model_name: 'User', to: :itself do |user|
      #
      # end
      # 更新头像
      score 10, :on => 'users#update', category: 'avatar' do |user|
        user.score_points(category: 'avatar').blank?
      end

      # score 10, :on => 'users#create' do |user|
      #   user.bio.present?
      # end
      #
      # score 15, :on => 'reviews#create', :to => [:reviewer, :reviewed]
      #
      # score 20, :on => [
      #   'comments#create',
      #   'photos#create'
      # ]
      #
      # score -10, :on => 'comments#destroy'
    end
  end
end
