

require_relative './dom_tree.rb'
require_relative './parse_tag.rb'

class DOMParser
  attr_reader :html_string, :tree

  OPEN_TAG_REGEX = /<[^\/].*?>/
  CLOSE_TAG_REGEX = /<\/.*?>/

  def initialize(file)
    # @html_string = File.read(file)[16..-1]
    @html_string = File.readlines(file)[1..-1].map!(& :strip).join("")
    # print @html_string
    @token_array = []
    @tree = DOMTree.new
    @tag_parser = ParseTag.new
  end


  def create_token_array
    remaining_string = @html_string
    while remaining_string != ""
      open_match_obj = remaining_string.match(OPEN_TAG_REGEX)
      close_match_obj = remaining_string.match(CLOSE_TAG_REGEX)

      if open_match_obj
        open_index = (OPEN_TAG_REGEX =~ remaining_string)
        close_index = (CLOSE_TAG_REGEX =~ remaining_string)

        open_index < close_index ? first_match = open_match_obj : first_match = close_match_obj
      else
        first_match = close_match_obj 
      end

      pre_string = first_match.pre_match
      @token_array << pre_string if pre_string != ""
      tag_string = first_match.to_s
      @token_array << tag_string

      remaining_string = first_match.post_match
    end
    # puts @token_array
  end


  def parse_token_array
    
    @token_array.each do | token |

      if token.match( OPEN_TAG_REGEX )
        if @tree.head.nil?
          tag_info = @tag_parser.run( token )
          new_node = DOMTreeNode.new(tag_info, nil, [], 1, true)
          @tree.head = new_node
          @tree.current_open_node = new_node
        else
          tag_info = @tag_parser.run( token )
          new_node = DOMTreeNode.new(tag_info, @tree.current_open_node, [],@tree.current_open_node.depth + 1, true) 
          @tree.add_child( @tree.current_open_node, new_node )
          @tree.current_open_node = new_node
        end
      elsif token.match( CLOSE_TAG_REGEX )
        @tree.current_open_node.is_open = false
        @tree.current_open_node = @tree.current_open_node.parent
      else
        text_tag = @tag_parser.handle_text( token )
        new_node = DOMTreeNode.new(text_tag, @tree.current_open_node, [],@tree.current_open_node.depth + 1, true) 
        @tree.add_child( @tree.current_open_node, new_node )

      end
    end
  end
end

d = DOMParser.new("test.html")
d.create_token_array
d.parse_token_array
# print d.tree
# d.tree.display_tree
print d.tree.subtree( d.tree.head )
puts
# x = d.tree.search_subtree( d.tree.head, :id, "main-area"  )
# x = d.tree.search_subtree( d.tree.head, :text, "One header"  )
puts d.tree.search_subtree( d.tree.head, :class, "something"  ).length
puts d.tree.search_subtree( d.tree.head, :class, "bold"  ).length
puts d.tree.search_subtree( d.tree.head, :class, "funky"  ).length
puts d.tree.search_subtree( d.tree.head, :class, "inner-div"  ).length

puts x.length
# x.each { |node| puts node }



