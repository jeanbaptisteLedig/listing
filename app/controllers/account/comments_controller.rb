class Account::CommentsController < Account::AccountController
  def create
    @comment = Comment.create(
      user_id: current_user.id,
      content: params[:comment][:content],
      listing_id: params[:comment][:listing_id]
    )
    redirect_to listing_path(@comment.listing_id)
  end
end
