
TagInfo = Struct.new( :type, :id, :classes, :name, :text ) do

  def print_info
    print "type: #{type}" if type
    print " id: #{id}" if id 
    print " classes: #{classes}" if classes
    print " name: #{name}" if name
    print " text: #{text}" if text
  end

  def build_tag
    if type != "text"
      type ? type_string = "#{type} " : type_string = ""
      classes != [] ? class_string = "class=\"#{classes.join(" ")}\" " : class_string = ""
      id ? id_string = "id=\"#{id}\" " : id_string = ""
      name ? name_string = "name=\"#{name}\" " :  name_string = ""
      ret_string =  "<" + type_string + class_string + id_string +
        name_string
      ret_string = ret_string[0..-2] + ">"
    else
      ret_string = text
    end
    ret_string
  end
end


class ParseTag

  TYPE_REGEX = /<(.*?)[ >]/
  CLASS_REGEX = /class=['"](.*?)['"]/
  ID_REGEX = /id=['"](.*?)['"]/
  NAME_REGEX = /name=['"](.*?)['"]/

  def initialize
  end

  def parse_type( tag_string )
    tag_string.match(TYPE_REGEX) ? tag_string.match(TYPE_REGEX)[1] : nil
  end

  def parse_classes( tag_string )
    tag_string.match(CLASS_REGEX) ? tag_string.match(CLASS_REGEX)[1].split(" ") : []
  end

  def parse_id( tag_string )
    tag_string.match(ID_REGEX) ? tag_string.match(ID_REGEX)[1].to_s : nil
  end

  def parse_name( tag_string )
    tag_string.match(NAME_REGEX) ? tag_string.match(NAME_REGEX)[1].to_s : nil
  end

  def run( tag_string )
    tag = TagInfo.new(parse_type(tag_string), parse_id(tag_string), parse_classes(tag_string), parse_name(tag_string)  )
    tag
  end

  def handle_text ( text )
    TagInfo.new("text", nil, [], nil, text )
  end

end
