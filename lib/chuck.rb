require 'httparty'

class Chuck

  BASE_URL = "http://api.icndb.com"

  attr_reader :first_name, :last_name, :jokes, :id, :raw_response

  # Instance methods ==========================================================

  def initialize(options = {})
    options.each{|k, v| self.instance_variable_set(:"@#{k}", v) if self.respond_to?(k)}
  end

  def joke
    # @jokes.first
    @jokes
  end

  def success
    @raw_response['type'] == 'success'
  end

  # Class methods =============================================================

  def self.categories
    HTTParty.get("#{BASE_URL}/categories").parsed_response['value']
  end

  def self.retrieve(options = {})
    url = "#{BASE_URL}/jokes/random"
    url << "/#{options[:quantity]}" if options[:quantity]

    query = Hash.new
    query[:firstName] = options[:first_name] if options[:first_name]
    query[:lastName]  = options[:last_name] if options[:last_name]
    query[:limitTo]   = "[#{options[:only].join(',')}]" if options[:only]
    query[:exclude]   = "[#{options[:exclude].join(',')}]" if options[:except]

    result = HTTParty.get(url, query).parsed_response

    Chuck.new id:           result['value']['id'],
              jokes:        result['value']['joke'],
              first_name:   query[:firstName],
              last_name:    query[:lastName],
              raw_response: result
  end
end
