class CommentsController < ApplicationController
    before_action :set_comment, only: [:edit, :destroy]

    #POST /posts/1/comments
    #POST /posts/1/comments/1.json
    def create
        @comment = Comment.new(
            name: params[:name],
            content: params[:content],
            post: Post.find(params[:post_id])
        )
        # @comment = Comment.new(comment_params)
        respond_to do |format|
            if @comment.save
                format.html { redirect_to @comment.post, notice: "comment was created." }
            else
                puts @comment.errors
                format.html { redirect_to post_path(params[:post_id]) }
                format.json { render json: @comment.errors, status: :unprocessable_entity }
            end
        end
    end

    # PATCH/PUT /posts/1/comments
    # PATCH/PUT /posts/1/comments/1.json
    def update
        respond_to do |format|
            if @comment.update(comment_params)
            format.html { redirect_to @comment.post, notice: 'comment was successfully updated.' }
            else
            format.html { render :'posts/:post_id' }
            format.json { render json: @comment.errors, status: :unprocessable_entity }
            end
        end
    end

  # DELETE /posts/1/comments
  # DELETE /posts/1/comments/1.json
    def destroy
        @comment.destroy
            respond_to do |format|
            format.html { redirect_to @comment.post, notice: 'Post was successfully destroyed.' }
            format.json { head :no_content }
        end
    end

    private
    # Use callbacks to share common setup or constraints between actions.
    def set_comment
        @comment = Comment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def comment_params
        @post = Post.find(params[:post_id])
        params.require(:comment).permit(:name, :content, @post)
    end

end
