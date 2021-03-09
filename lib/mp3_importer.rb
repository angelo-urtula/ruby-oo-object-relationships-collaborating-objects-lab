class MP3Importer
    attr_accessor :path

    def initialize(path)
        @path = path
    end

    def files
        mp3files = File.join("**", "*.mp3")
        Dir.glob(mp3files).map{|filename| filename.gsub("spec/fixtures/mp3s/", "")}
    end

    def import
        self.files.each{|filename| Song.new_by_filename(filename)}
    end
end