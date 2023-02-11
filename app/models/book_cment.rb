class BookCment < ApplicationRecord

  # UserモデルとBookCommentモデルを関連付ける
  belongs_to :user
  validates :title,presence:true
	validates :body,presence:true,length:{maximum:200}

  # 検索方法分岐
  def self.search_for(content, method)
    if method == 'perfect'
      Book.where(title: content)
    elsif method == 'forward'
      Book.where('title LIKE ?', content+'%')
    elsif method == 'backward'
      Book.where('title LIKE ?', '%'+content)
    else
      Book.where('title LIKE ?', '%'+content+'%')
    end
  end

  belongs_to :book

  # コメントモデルのバリデーション設定
  validates :comment, presence: true

end
