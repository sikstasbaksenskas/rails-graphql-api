module Types
  class QueryType < Types::BaseObject
    field :posts, [Types::PostType], null: false do
      description "Query to select all posts"
    end

    field :postsCount, Integer, null: false do
      description "Query that returns total number of posts"
    end

    def posts
      return Post.all
    end

    def postsCount
      return Post.count
    end
  end
end
