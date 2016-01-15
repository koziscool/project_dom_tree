require_relative 'tag_info.rb'
require_relative 'dom_tree.rb'


class DOMParser
  attr_reader :html_string

  def initialize(file)
    @html_string = File.read(file)[16..-1]
    @tree = DomTree.new
    @tag_parser = ParseTag.new
  end

  def convert_string(string)
    tag_regex = /<.*>/
    greedy_tag_regex = /<.*>(.*)<\/.*>/
    greedy_tag_open_regex = /<.*>(.*)/
    open_tag_regex = /<[^\/].*?>/
    close_tag_regex = /<\/.*?>/


    remaining_string = html_string
    while remaining_string != ""
      substring = string.match(greedy_tag_open_regex).post_match

      open_match_obj = string.match(open_tag_regex)
      close_match_obj = string.match(close_tag_regex)

      open_index = (open_tag_regex =~ string)
      close_index = (close_tag_regex =~ string)

      if open_index < close_index
        first_match = open_match_obj
      else
        first_match = close_match_obj
      end

      pre_string = first_match.pre_match
      @tree.add_text_to_open_node( pre_string )

      tag_string = first_match.to_s
      
      #if open tag
        # create new Node and attack to Dom Tree
        @tree.open_new_node(DOMTreeNode(nil, @tree.current_open_node, nil, @tree.current_open_node.depth + 1, true))
        # populate the info with functionality form tag_parser
        @tag_parser.run( tag_string )

      #else   # close tag
        # close the open tag in the dom tree
        @tree.close_node
      #end

      remaining_string = first_match.post_match
      # save text as its own node to avoid rendering problem
    end

  end
end


d = DOMParser.new("test.html")
# d.convert_string(d.html_string)










