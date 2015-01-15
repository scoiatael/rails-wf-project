class Event < ActiveRecord::Base
  belongs_to :movie
  has_many :vote_options
  accepts_nested_attributes_for :vote_options, :reject_if => :all_blank, :allow_destroy => true

  def update(argument)
  end

  def vote_open?
    movie.nil?
  end

  def vote_closed?
    not vote_open?
  end

  def set_winning_movie
    self.movie = vote_options.max_by(&:sum_of_votes).movie
    self.save!
  end
end
