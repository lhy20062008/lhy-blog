class CommentsController < ApplicationController
	before_filter :ensure_sigin_in!

	def create
		commentable = params[:commentable_type].constantize.find_by_id(params[:commentable_id])
		render json: {code: 'error', msg: '纪录不存在，不能评论 '} and return if commentable.nil?
		comment = Comment.new(comment_params)
		comment.commentable = commentable
		comment.user_id = current_user.id
		if comment.save
			render json: {code: 'success', msg: '评论成功', data: comment.as_json}
		else
			render json: {code: 'error', msg: '评论失败'}
		end
	end

	private
		def comment_params
			params.require(:comment).permit(:body)
		end

end
