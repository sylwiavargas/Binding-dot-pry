require 'pry'

class Tweet

    attr_reader :content, :user

    @@all = []

    def initialize(content_par, user_par)
        @content = content_par
        @user = user_par
        @@all << self
    end

    def self.all
        @@all
    end

    def username
        user.username  # method lookup chain -- it's the same as the above but sometimes has gotchas        
    end

    def length
        content.length
    end

    def generate_tweet
        max = $random_chars.length
        num = rand(0...max)
        $random_chars.sample(num).join("")
    end

    def to_s
        generate_tweet
    end
    
end

# this global variable usually would be placed in "tools" file or be a method inside of a module because the assumption here is that it is going to be available to a few different classes/files; for simplicity, it's a global variable;
$random_chars = %w{🁒 ℊ ℀ ☁︎ ☼ ℥ ⚈ 🃘 ⎆ ⍒ ⎲ ⎢ ⏈ ┼ ⏋ ␎ ⑇ ⑉ ␦ ␥ ☠︎}