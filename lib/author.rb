class Author
    attr_accessor :name
    @@post_count = 0

    def initialize(name)
        @name = name 
        @posts = []
    end

    def posts 
        Post.all.select do |post|
            post.author == self
        end
    end

    def add_post(post_object)
        post_object.author = self
        @@post_count += 1
    end

    def add_post_by_title(post_title)
        new_post = Post.new(post_title)
        add_post(new_post)
        @@post_count += 1
    end

    def self.post_count
        @@post_count
    end
end