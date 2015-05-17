require "csv"

namespace :import do

  task :songs => :environment do
    Song.destroy_all
    csv_text = File.read('lib/tasks/songs.csv')
    csv = CSV.parse(csv_text, :headers => false)
    csv.each do |row|
      song = Song.new
      song.title = row[2]
      song.author = Author.find_by_name(row[3]) || Author.create(name: row[3])
      song.legacy_id = row[0]
      song.legacy_abbr = row[1]
      song.lyrics = row[4]
      song.tabs = row[5]
      song.notes = row[6]
      song.cover = (row[7].to_i) > 0
      song.save!
    end
  end

  task :venues => :environment do

    # "9","9:30 Club","815 V Street NW","Washington","DC","0","202-265-0930","http://www.930.com/"
    #Venue.destroy_all

    csv_text = File.read('lib/tasks/venues.csv')
    csv = CSV.parse(csv_text, :headers => false)

    csv.each do |row|
      venue = Venue.new
      venue.legacy_id = row[0]
      venue.name = row[1]
      venue.street = row[2]
      venue.city = row[3]
      venue.state = row[4]
      venue.phone = row[6]
      venue.website = row[7]
      unless venue.save
        puts row.join(",")
      end
    end

    Venue.create(legacy_id: 577, name: "Langerado")
  end

  task :shows => :environment do
    Show.destroy_all
    Track.destroy_all
    Band.destroy_all

    band = Band.create(name: "The Disco Biscuits")

    csv_text = File.read('lib/tasks/shows.csv')
    rows = CSV.parse(csv_text, :headers => false)

    bar = RakeProgressbar.new(rows.count)

    rows.each do |row|

      bar.inc

      # skip non tdb for now
      next if row[1] != "1"

      show = Show.new
      show.band = band
      show.legacy_id = row[0]
      show.date = row[2]
      show.venue = Venue.find_by_legacy_id(row[3])

      if show.venue.nil?
        binding.pry
      end

      show.notes = row[9]
      show.save!

      # sets 1-4
      build_tracks(show, row, 1) unless row[4].blank?
      build_tracks(show, row, 2) unless row[5].blank?
      build_tracks(show, row, 3) unless row[6].blank?
      build_tracks(show, row, 4) unless row[7].blank?

      # encore 1-2
      build_tracks(show, row, 5) unless row[8].blank?
      build_tracks(show, row, 6) unless row[9].blank?
    end

    bar.finished
  end

  def build_tracks(show, row, set_number)
    show_parts = row[set_number + 3].split(" ")
    tracks = []

    show_parts.each_with_index do |show_part, i|
      next if show_part == ","
      if show_part == ">" || show_part == '->'
        tracks.last.segue = true unless tracks.last.nil?
      elsif show_part.to_i.to_s == show_part
        desc = row[show_part.to_i + 10]
        next if desc.blank?
        tracks.last.annotations << Annotation.new(desc: row[show_part.to_i + 10].gsub("<br>", ""))
      else
        track = Track.new
        track.song = Song.find_by_legacy_abbr(show_part)

        if track.song.nil?
          binding.pry
        end

        if set_number < 5
          track.set = set_number
        else
          track.encore = set_number - 4
        end
        track.show = show
        tracks << track
      end
    end

    tracks.each_with_index do |track, i|
      begin
        track.position = i + 1
        track.save!
      rescue StandardError => e
        binding.pry
      end
    end
  end
end

