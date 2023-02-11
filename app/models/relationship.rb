class Relationship < ApplicationRecord #フォロー/フォロワー機能
# class_name: "User"でUserモデルを参照
  belongs_to :follower, class_name: "User" #follower_id : フォローしたユーザー
  belongs_to :followed, class_name: "User" #followed_id : フォローされたユーザー
end
