require_relative 'tag_info.rb'

class DOMParser
  attr_reader :html_string

  def initialize(file)
    @html_string = File.read(file)[16..-1]
  end

  def handle_line(line)
    tag_regex = /<.*>(.*?)<\/.*>/
    open_tag_regex = /<.*?>/
    close_tag_regex = /<\/.*?>/

    string1 = line.match(open_tag_regex).pre_match
    open_subtag = line.match(open_tag_regex)
    between_subtags = line.match(tag_regex)[1]
    closed_subtag = line.match(close_tag_regex)
    string2 = line.match(close_tag_regex).post_match
  end

  def inspect_line(line)

  end

  def convert_string(string)
    tag_regex = /<.*>(.*?)<\/.*>/
    greedy_tag_regex = /<.*>(.*)<\/.*>/
    greedy_tag_open_regex = /<.*>(.*)/
    open_tag_regex = /<.*?>/
    close_tag_regex = /<\/.*?>/

    substring = string.match(greedy_tag_open_regex).post_match
  end
end

# H_string = "I'm an inner div!!! I might just <em>emphasize</em> some text."

# H_string2 = "<h1>some stuff <em>djhfsdhf</em>sdjhfhjdssd<strong>sdjhfds</strong>  fjhksdjhdfskjhsd"

d = DOMParser.new("test.html")
# puts d.html_string.inspect
puts d.convert_string(d.html_string)



# m1 =  H_string.match open_tag_regex
# puts m1.pre_match
# print H_string.match open_tag_regex
# puts
# m3 =  H_string.match(tag_regex)[1]
# puts m3
# print H_string.match close_tag_regex
# puts
# m2 =  H_string.match close_tag_regex
# puts m2.post_match

# puts "Next test"
# m1 =  H_string2.match open_tag_regex
# puts m1.pre_match
# print H_string2.match open_tag_regex
# puts
# m3 =  H_string2.match(tag_regex)[1]
# puts m3
# print H_string2.match close_tag_regex
# puts
# m2 =  H_string2.match close_tag_regex
# puts m2.post_match














