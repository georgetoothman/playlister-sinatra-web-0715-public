class Song < ActiveRecord::Base
  belongs_to :artist
  has_many :song_genres
  has_many :genres, through: :song_genres
  accepts_nested_attributes_for :artist
  
  extend Slugable
  add_slug_for :name

  # def name=(new_name)
  #   super
  #   update_slug
  # end

  # private
  # def update_slug
  #   self.slug = self.name.downcase.scan(/\w+/).join('-')
  # end 
end