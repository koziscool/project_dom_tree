

DOMTreeNode = Struct.new( :info, :parent, :children, :depth, :is_open )

class DOMTree

    attr_accessor :head, :current_open_node

    def initialize
        @head = nil
        @current_open_node = nil
    end

    def get_children( node )
        node.children
    end

    def add_child( parent, child )
        parent.children << child
    end

    def display_node( node )
        node.depth.times { print "  " }
        print node.info.print_info
        puts
    end

    def display_tree (start_node = nil)
        start_node ||= @head
        unless start_node.nil?
            display_node( start_node )
            start_node.children.each { | node | display_tree( node ) }
        end
    end

end
