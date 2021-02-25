class Genre
    extend Concerns::ModuleName

    attr_accessor :name
    attr_reader :song

    @@all = []

    def initialize(name)
        @name = name
        @songs = []
    end

    def self.all
        @@all
    end

    def save
        self.class.all << self
    end

    def self.destroy_all
        all.clear
    end

    def self.create(name)
        artist = new(name)
        artist.save
        artist
    end

    def artists
        song.collect{ |song| song.artist}.uniq
    end
end