require "./lib/shangrila/sora.rb"




def build_children(title)
  children = {}
  children['name'] = title
  children['children'] = []
  children['children'][0] = {'name' =>  title, 'size' => rand(10000)}

  children
end


def build_data(title_list)

  data = {}
  data['name'] = 'flare'

  data['children'] = title_list.map{|t| build_children(t)}



  JSON.dump(data)
end


year = ARGV[0]
cours = ARGV[1]

title_list = Shangrila::Sora.new().get_title_list(year, cours)
#p title_list
puts build_data(title_list)

#twitter_accaount_map = Shangrila::Sora.new().get_map_with_key_title(year, cours, 'twitter_account')
#p twitter_accaount_map
