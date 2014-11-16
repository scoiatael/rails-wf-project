class Event < ActiveRecord::Base
  belongs_to :movie
  has_many :vote_options
  accepts_nested_attributes_for :vote_options, :reject_if => :all_blank, :allow_destroy => true

  private
end
