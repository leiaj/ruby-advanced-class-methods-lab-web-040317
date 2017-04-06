require 'pry'

class Song
  attr_accessor :name, :artist_name

  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create
  song = self.new
  song.save
  song
  end

  def self.new_by_name(name)
     song = self.new
     song.name = name
     song
 end

 def self.create_by_name(name)
   song = self.create
   song.name = name
   song
 end

 def self.find_by_name(name)
 #   song = create_by_name(name)
 #   @@all.include?(name)
 #   return song
 # end
    @@all.each do |x|
     x.name
     if x.name == name
       return x
     end
   end
 end
#binding.pry

def self.find_or_create_by_name(name)
  song = self.create_by_name(name)
end

def self.alphabetical
  @@all.sort_by {|song| song.name }

end

def self.new_from_filename(name)
  parts_array = name.split(" - ")
  artist_name = parts_array[0]
  song_name = parts_array[1].gsub(".mp3", "")
  song = self.new
  song.name = song_name
  song.artist_name = artist_name
  song
end

def self.create_from_filename(name)
  parts_array = name.split(" - ")
  artist_name = parts_array[0]
  song_name = parts_array[1].gsub(".mp3", "")
  song = self.create
  song.name = song_name
  song.artist_name = artist_name
  song
end

def self.destroy_all
  @@all.clear
end
end



"hi"
