# project_dom_tree
Like leaves on the wind

[A data structures, algorithms, file I/O, ruby and regular expression (regex) project from the Viking Code School](http://www.vikingcodeschool.com)

John and Kelsey

-------------------------------
Parse DOM/HTML file pseducode
------------------------------
class ReadFile

    def run
        line_array = file readlines
        line_array.each line
            handle_line
        end
    end

    def handle_line
        case OpenTag
            parse OpenTag
        case Text
            find parent Tag
            update TagInfo
        case CloseTag
            update DOM
    end
end


class DOMTree
    head

    create_node
    attach_node
-------
    get_children( node )

end

Node = new Struct( tag_info, parent, children )




