
require 'spec_helper'
require 'dom_parser'

describe DOMParser do
  let( :html_file ) { "test.html" }
  let( :d ) { DOMParser.new(html_file) }
  let( :rebuild) { "" } 

  
  it 'rebuild works correctly' do
    html_string = d.html_string

    expect(html_string).not_to eq(rebuild)

    d.create_token_array
    d.parse_token_array
    rebuild = d.tree.rebuild_html

    expect(html_string).to eq(rebuild)
  end
end

