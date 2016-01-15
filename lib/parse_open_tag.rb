Tag = Struct.new( :type, :id, :classes, :name  )
# class MyTag < Struct.new(:attributes, :go, :here)
class ParseTag

  def initialize( tag_string )
    @tag_string = tag_string
    run
  end

  def parse_type( tag_string )
    type = tag_string.match(/<(.*?)[ >]/)[1]
    type
  end

  def parse_classes( tag_string )
    classes_string = tag_string.match(/class=['"](.*?)['"]/)[1].to_s
    classes_array = classes_string.split(" ")
    classes_array
  end

  def parse_id( tag_string )
    id_string = tag_string.match(/id=['"](.*?)['"]/)[1].to_s
    id_string
  end

  def parse_name( tag_string )
    name_string = tag_string.match(/name=['"](.*?)['"]/)[1].to_s
    name_string
  end

  def run( tag_string )
    tag = Tag.new(parse_type(tag_string), parse_id(tag_string), parse_classes(tag_string), parse_name(tag_string))
    tag
  end

end