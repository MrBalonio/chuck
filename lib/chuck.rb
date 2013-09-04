require 'httparty'
require 'json'

require 'pp'

Dir[File.join(File.dirname(__FILE__), 'chuck', '**', '*.rb')].each{|f| require f}

module Chuck
  class Request

    include HTTParty
    base_uri 'http://api.icndb.com'

    attr_reader :first_name, :last_name, :jokes, :id, :raw_response

    # Instance methods ==========================================================

    def initialize(options = {})
      options.each{|k, v| self.instance_variable_set(:"@#{k}", v) if self.respond_to?(k)}
    end

    def success
      @raw_response['type'] == 'success'
    end

    # Class methods =============================================================

    def self.categories
      get("/categories").parsed_response
    end

    def self.retrieve(options = {})
      url = "/jokes/random/#{options[:quantity] or 1}"

      query = Hash.new
      query[:firstName] = options[:first_name] if options[:first_name]
      query[:lastName]  = options[:last_name] if options[:last_name]
      query[:limitTo]   = "[#{options[:only].join(',')}]" if options[:only]
      query[:exclude]   = "[#{options[:exclude].join(',')}]" if options[:except]

      #result = JSON.parse(get(url, query).parsed_response)
      result = get(url, query).parsed_response

      #Chuck::Request.new jokes:        Chuck::Joke.jokes_from_result(result['value']),
       #                  first_name:   query[:firstName],
        #                 last_name:    query[:lastName],
         #                raw_response: result

    end

  end
end
