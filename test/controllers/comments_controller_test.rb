require 'test_helper'

class CommentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @comment = comments(:one)
  end

  test "should create comment" do
    assert_difference('Comment.count', 1) do
      post :create, :comment => @comment_attributes
    end
  end

  test "sould update comment" do
    patch post_url(@comment.post), params: { comment: { content: @comment.content, name: @comment.name} }
    assert_redirected_to post_url(@comment.post)
  end

  test "should destroy comment" do
    assert_difference('Comment.count', -1) do
      delete post_url(@comment.post)
    end

    assert_redirected_to posts_url
  end
end
