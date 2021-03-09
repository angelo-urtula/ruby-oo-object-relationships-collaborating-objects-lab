class Song
    attr_accessor :name, :artist

    @@all = []

    def initialize(name)
        @name = name
        @@all << self
    end

    def self.all
        @@all
    end

    def self.new_by_filename(filename)
        song = self.new(filename.split(" - ")[1])
        song.artist_name=(filename.split(" - ")[0])
        song
    end

    def artist_name=(name)
        if Artist.all.select{|artist| artist.name == name}.empty?
            self.artist = Artist.new(name)
        else Artist.all.select{|artist| artist.name == name}.empty? == false
            self.artist = Artist.all.find{|artist| artist.name == name}
        end
    end
end