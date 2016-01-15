
TagInfo = Struct.new( :type, :id, :classes, :name, :text ) do

  def print_info
    print "type: #{type}" if type
    print " id: #{id}" if id 
    print " classes: #{classes}" if classes
    print " name: #{name}" if name
    print " text: #{text}" if text
  end
end


class ParseTag

  def initialize
  end

  def parse_type( tag_string )
    tag_string.match(/<(.*?)[ >]/) ? tag_string.match(/<(.*?)[ >]/)[1] : nil
  end

  def parse_classes( tag_string )
    tag_string.match(/class=['"](.*?)['"]/) ? tag_string.match(/class=['"](.*?)['"]/)[1].to_s : nil
  end

  def parse_id( tag_string )
    tag_string.match(/id=['"](.*?)['"]/) ? tag_string.match(/id=['"](.*?)['"]/)[1].to_s : nil
  end

  def parse_name( tag_string )
    tag_string.match(/name=['"](.*?)['"]/) ? tag_string.match(/name=['"](.*?)['"]/)[1].to_s : nil
  end

  def run( tag_string )
    tag = TagInfo.new(parse_type(tag_string), parse_id(tag_string), parse_classes(tag_string), parse_name(tag_string)  )
    tag
  end

  def handle_text ( text )
    TagInfo.new("text", nil, nil, nil, text )
  end

end
