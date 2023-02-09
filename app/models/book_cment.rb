class BookCment < ApplicationRecord

  # UserモデルとBookCommentモデルを関連付ける
  belongs_to :user
  belongs_to :book

  # コメントモデルのバリデーション設定
  validates :comment, presence: true

end
