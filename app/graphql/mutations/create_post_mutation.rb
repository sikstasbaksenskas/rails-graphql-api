module Mutations
  class CreatePostMutation < BaseMutation
    field :post, Types::PostType, null: false

    argument :title, String, required: true do
      description "The title field is a string type and is required for new post to be created."
    end

    argument :body, String, required: true do
      description "The body field is a string type and is required for new post to be created."
    end

    argument :author, Integer, required: true do
      description "This is id of post's author."
    end

    def resolve(title:, body:, author:)
      @post = Post.new(title: title, body: body, author: Author.find(author))
      if @post.save
        {
          post: @post,
          errors: []
        }
      else
        {
          post: nil,
          errors: @post.errors.messages
        }
      end
    end
  end
end
