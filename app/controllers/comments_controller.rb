class CommentsController < ApplicationController
  def index
    @comments = Comment.all
  end

  def new
    @comment = Comment.new
  end

  def create    
    @comment = Comment.new(comment_params)
    if @comment.save
      respond_to do |format|
        format.json
      end
    else
      render :index
    end
  end

  def destroy
    comment = Comment.find(params[:id])
    comment.destroy
    flash[:notice] = "削除しました"
    redirect_to users_path
  end

  private
  def comment_params
    params.permit(:content, :image).merge(user_id: current_user.id)

    # comment/index.html.hamlで使うなら下
    # params.require(:comment).permit(:content, :image).merge(user_id: current_user.id)
  end
end
