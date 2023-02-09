class BookCommentsController < ApplicationController　# コメント機能

  def create #createアクションを追加  用途：コメントを作成する
    book = Book.find(params[:book_id])
    comment = current_user.book_comments.new(book_comment_params)
    comment.book_id = book.id
    comment.save
    redirect_to request.referer #行う前の画面に遷移する
  end

  def destroy #destroyアクションを追加  用途：コメントを削除する
    BookComment.find_by(id: params[:id], book_id: params[:book_id]).destroy #自分のコメントしか消去できない
    redirect_to request.referer #行う前の画面に遷移する
  end

  private
  def book_comment_params
    params.require(:book_comment).permit(:comment)
  end

end
