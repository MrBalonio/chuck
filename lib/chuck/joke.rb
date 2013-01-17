module Chuck
  class Joke
    attr_accessor :id, :body, :categories

    def initialize(options = {})
      options.each{|k, v| self.send("#{k}=", v) if respond_to?(k) }
    end

    def self.jokes_from_result(result)
      result.map do |j| 
        Joke.new body: j['joke'], categories: j['categories'], id: j['id']
      end
    end

    def to_s
      @body
    end
  end
end
