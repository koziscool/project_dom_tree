class DOMParser
  #TODO: Write regexes for open tags, closed tags within a line
  def initialize(file)
    @line_array = file.readlines(file)
  end

  def handle_line(line)

  end

  def inspect_line(line)

  end
end

tag_regex = /<.*>(.*?)<\/.*>/ # gets everything inside tags