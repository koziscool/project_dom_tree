require_relative 'tag_info.rb'

class DOMParser
  attr_reader :html_string

  def initialize(file)
    @html_string = File.read(file)[16..-1]
  end

  # def handle_line(line)
  #   tag_regex = /<.*>(.*?)<\/.*>/
  #   open_tag_regex = /<.*?>/
  #   close_tag_regex = /<\/.*?>/

  #   string1 = line.match(open_tag_regex).pre_match
  #   open_subtag = line.match(open_tag_regex)
  #   between_subtags = line.match(tag_regex)[1]
  #   closed_subtag = line.match(close_tag_regex)
  #   string2 = line.match(close_tag_regex).post_match
  # end

  # def inspect_line(line)

  # end

  def convert_string(string)
    tag_regex = /<.*>(.*?)<\/.*>/
    greedy_tag_regex = /<.*>(.*)<\/.*>/
    greedy_tag_open_regex = /<.*>(.*)/
    open_tag_regex = /<.*?>/
    close_tag_regex = /<\/.*?>/


    remaining_string = html_string
    while remaining_string != ""
      substring = string.match(greedy_tag_open_regex).post_match

      match_obj = string.match(tag_regex)

      pre_string = match_obj.pre_match
      # add as text to last open tag

      tag_string = match_obj.to_s
      # parse tag
        # if open tag, create node, w attributes if available
        # if close tag, the close appropriate open tag
            # update TagInfo case

      remaining_string = match_obj.post_match

    end



  end
end


d = DOMParser.new("test.html")
d.convert_string(d.html_string)










