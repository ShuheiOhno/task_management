class CommentsController < ApplicationController
  def index
    @comments = Comment.all
  end

  def new
    @comment = Comment.new
  end

  def create
    # Comment.create(comment_params)
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
    # binding.pry
    comment.destroy
    # redirect_back(fallback_location: )
  end

  private
  def comment_params
    params.permit(:content, :image).merge(user_id: current_user.id)

    # comment/index.html.hamlで使うなら下
    # params.require(:comment).permit(:content, :image).merge(user_id: current_user.id)
  end
end
