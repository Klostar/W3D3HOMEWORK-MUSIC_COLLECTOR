require('pry-byebug')
require_relative('./models/artist.rb')
require_relative('./models/album.rb')


artist1 = Artist.new({'name' => 'Rolling Stones'})
artist2 = Artist.new({'name' => 'The Beatles'})

artist1.save()
artist2.save()

# binding.pry

album1 = Album.new({
'artist_id' => artist1.id,
'title' => 'Got Live If You Want It!',
'genre' => 'Blues Rock'
  })

album2 = Album.new({
  'artist_id' => artist2.id,
  'title' => 'Rubber Soul',
  'genre' => 'Folk Rock'
  })

  album1.save()
  album2.save()

# artists = Artist.all()
# albums = Album.all()

binding.pry
nil
