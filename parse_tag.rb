
Tag = Struct.new( :type, :id, :classes, :name  )


def parse_tag( tag_string )

end

def parse_type( tag_string )
  type = tag_string.match(/<(.*) /)
  type
end

def parse_class( tag_string )
  classes_string = tag_string.match(/ class="(.*)  /)
  classes_array = classes_string.split(" ")
  classes_array
end

def parse_id( tag_string )
  id = tag_string.match(/ id="(.*)  /)
  id
end