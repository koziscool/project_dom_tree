require_relative '../lib/parse_tag'

let (:tag_string) { "<p class='foo bar' id='baz' name='fozzie'>" }

describe '#parse_tag' do
  it 'creates the tag type' do
    expect(parse_tag(tag_string).type).to eq("p")
  end

  it 'creates the tag classes' do
    expect(parse_tag(tag_string).classes).to eq(["foo", "bar"])
  end

  it 'creates the tag id' do
    expect(parse_tag(tag_string).id).to eq("baz")
  end

  it 'creates the tag name' do
    expect(parse_tag(tag_string).name).to eq("fozzie")
  end
end