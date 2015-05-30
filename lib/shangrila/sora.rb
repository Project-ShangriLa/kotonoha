require 'net/http'
require 'uri'
require 'json'
require 'httpclient'
require 'pathname'
require 'digest/md5'

module Shangrila

  class Sora
    URL = 'http://api.moemoe.tokyo/anime/v1/master'

    def initialize
    end

    #Shangrila::Sora.new().get_title_list(year, cours)
    def get_master_data(year, cours)
      response = HTTPClient.get(sprintf("%s/%s/%s", URL, year, cours))
      JSON.load(response.body)
    end

    def get_title_list(year, cours)
      master_list = get_master_data(year, cours)
      master_list.map{|master| master['title']}
    end

    def get_map_with_key_title(year, cours, property)
      master_list = get_master_data(year, cours)

      master_map = {}

      master_list.each{|master| master_map[master['title']] = master[property]}

      master_map
    end

  end

end