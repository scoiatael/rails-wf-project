class EventForm
  ValidationError = Class.new StandardError

  include Virtus.model
  include ActiveModel::Conversion
  include ActiveModel::Validations

  attribute :date, Date
  attribute :movie_id, Integer
  attribute :vote_options_attributes, Hash[ Integer => Hash[ _destroy: Boolean, movie_id: Integer]]

  validates :date, presence: true

  validate :assert_unique_movies
  validate :must_have_either_movie_or_vote


  def attributes
    @attributes ||= Hash.new
  end

  def initialize(params)
    @attributes = params
    super params
  end

  def persisted?
    false
  end

  def movie
    self.movie_id
  end

  def vote_options
    self.vote_options_attributes or {}
  end

  def options
    vote_options.reject { |k,v| (v["destroy"]) or (v["movie_id"].nil?) }
  end

  def no_options?
    options.length == 0
  end

  def validate
    puts errors: errors, valid: valid?
    if valid? then false else errors end
  end

  private

    def assert_unique_movies
      unless no_options?
        unique_movies = options.collect { |k,v| v["movie_id"] }  .uniq
        errors.add(:vote_options, ": movies must be unique") unless unique_movies.length == options.length
      end
    end

    def must_have_either_movie_or_vote
      if movie.empty? and no_options?
        errors.add(:vote_options_attributes, ": cannot add event with neither movie nor vote")
      end
    end
end
