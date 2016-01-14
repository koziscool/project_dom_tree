class DOMParser
  #TODO: Write regexes for open tags, closed tags within a line
  def initialize(file)
    @line_array = file.readlines(file)
  end

  def handle_line(line)
    line.match open_tag_regex
    line match close_tag_regex


  end

  def inspect_line(line)

  end
end

tag_regex = /<.*>(.*?)<\/.*>/ # gets everything inside tags

open_tag_regex = /<.*?>/
close_tag_regex = /<\/.*?>/


H_string = "I'm an inner div!!! I might just <em>emphasize</em> some text."

# "I'm an inner div!!! I might just"
# "<em>"
# "emphasize</em> some text."


H_string2 = "emphasize</em> some text."

print H_string.match close_tag_regex
puts
print H_string.match open_tag_regex
puts


m1 =  H_string.match open_tag_regex
puts m1.pre_match
m2 =  H_string.match close_tag_regex
puts m2.post_match


m3 =  H_string2.match open_tag_regex
puts m3.post_match

<h1>some stuff <em>djhfsdhf</em>sdjhfhjdssd<strong>sdjhfds</strong>  fjhksdjhdfskjhsd
</h1>














