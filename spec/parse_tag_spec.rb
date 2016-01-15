require_relative '../lib/parse_tag'


describe 'ParseTag and TagInfo' do
  let (:tag_string) { "<p class='foo bar' id='baz' name='fozzie'>" }
  let (:other_string) { "<p id='baz'>" }
  let (:text_tag) { "This document contains data" }

  let( :parse_tag ) { ParseTag.new }
  
  it 'creates the tag type' do
    expect(parse_tag.run(tag_string).type).to eq("p")
  end

  it 'creates the tag classes' do
    expect(parse_tag.run(tag_string).classes).to eq(["foo", "bar"])
  end

  it 'creates empty array for classes' do
    expect(parse_tag.run(other_string).classes).to eq([])
  end

  it 'creates the tag id' do
    expect(parse_tag.run(tag_string).id).to eq("baz")
  end

  it 'creates the tag name' do
    expect(parse_tag.run(tag_string).name).to eq("fozzie")
  end

  it '#build_tag  builds correctly' do
    expect(  parse_tag.run(tag_string).build_tag ).to eq(tag_string)
  end

  it '#build_tag  builds correctly' do
    expect(  parse_tag.run(other_string).build_tag ).to eq(other_string)
  end

  it '#build_tag  builds text correctly' do
    expect(  parse_tag.handle_text(text_tag).build_tag ).to eq(text_tag)
  end

end
