Tag = Struct.new( :type, :id, :classes, :name  )


def parse_tag( tag_string )

end

def parse_type( tag_string )
  type = tag_string.match(/<(.*?) /)[1]
  type
end

def parse_class( tag_string )
  classes_string = tag_string.match(/class=(.*) /)[1].to_s
  classes_array = classes_string.split(" ")
  classes_array
end

def parse_id( tag_string )
  id_string = tag_string.match(/id=(.*)>/)[1].to_s
  id_string
end

def parse_name( tag_string )
  name_string = tag_string.match(/name=(.*)>/)[1].to_s
  name_string
end

# tag = parse_tag("<p class='foo bar' id='baz'>")
# tag.type 
# #=> "p"
# tag.classes 
# #=> ["foo", "bar"]
# tag.id 
# #=> "baz"
# tag.name 
# #=> "fozzie"

tag_string = "<p class='foo bar' id='baz' name='fozzie'>"
puts parse_type(tag_string)
puts parse_class(tag_string)
puts parse_id(tag_string)
puts parse_name(tag_string)