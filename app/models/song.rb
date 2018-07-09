require 'rspotify'
artists = RSpotify::Artist.search('Arctic Monkeys')

class Song < ActiveRecord::Base

end
