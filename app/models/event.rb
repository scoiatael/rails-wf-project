class Event < ActiveRecord::Base
  belongs_to :movie
  has_many :vote_options
  accepts_nested_attributes_for :vote_options, :reject_if => :all_blank, :allow_destroy => true

  validate :assert_unique_movies
  validate :must_have_either_movie_or_vote

  def no_options?
    options.length == 0
  end

  private
  def options
    vote_options.reject(&:marked_for_destruction?)
  end

  def assert_unique_movies
    unless no_options?
      unique_movies = options.collect(&:movie_id).uniq
      puts "unique: #{unique_movies} vs #{options.to_a}"
      errors.add(:vote_options, ": movies must be unique") unless unique_movies.length == options.length
    end
  end

  def must_have_either_movie_or_vote
    errors.add(:options, ": cannot add event with neither movie nor vote") if
      self.movie.nil? and (self.vote_options.nil? or (self.vote_options.length == 0))
  end

end
