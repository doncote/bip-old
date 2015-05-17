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
  end

  task :shows => :environment do
    csv_text = File.read('lib/tasks/venues.csv')
    csv = CSV.parse(csv_text, :headers => false)

    csv.each do |row|
      show = Show.new
      show.legacy_id = row[1]
      show.date = row[2]
      show.venue = Venue.find_by_legacy_id(row[3])
      show.comment = row[9]

      build_tracks(row[3].split(" "), 1)
      build_tracks(row[4].split(" "), 2) if row[4].present?
      build_tracks(row[5].split(" "), 3) if row[5].present?
      build_tracks(row[6].split(" "), 4) if row[6].present?
    end
  end

  def build_tracks(show_parts, set_number)
    show_parts.each do |show_part|
    end
  end
end

