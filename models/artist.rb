require_relative('album.rb')

class Artist

  attr_reader(:id)
  attr_accessor(:name)

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @name = options['name']
  end

  def save()
    db = PG.connect({dbname:'music_collector', host:'localhost'})
    sql = "INSERT INTO artists (name) VALUES ($1) RETURNING *"
    values = [@name]
    db.prepare("save",sql)
    @id = db.exec_prepared("save",values)[0]['id'].to_i
    db.close()
  end

  def albums()
    db = PG.connect({dbname:'music_collector', host:'localhost'})
    sql = "SELECT * FROM albums WHERE artist_id = $1"
    values = [@id]
    db.prepare("albums",sql)
    result = db.exec_prepared("albums",values)
    db.close()
    return result.map {|album|Album.new(album)}
  end

  def Artist.all()
    db = PG.connect({dbname:'music_collector', host:'localhost'})
    sql = "SELECT * FROM artists"
    db.prepare("all",sql)
    artists = db.exec_prepared("all")
    db.close()
    return artists.map{|artist|Artist.new(artist)}
  end

end
