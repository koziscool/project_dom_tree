

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
        (node.depth - 1).times { print "  " }
        print node.info.print_info
        print "  depth: #{node.depth}"
        puts
    end

    def display_tree (start_node = nil)
        start_node ||= @head
        unless start_node.nil?
            display_node( start_node )
            start_node.children.each { | node | display_tree( node ) }
        end
    end

    def subtree( node, type = nil )
        subnodes_hash = Hash.new( 0 )
        unless node.nil?
            subnodes_hash[node.info.type] += 1
            subnodes_hash["total"] += 1
            node.children.each do | child_node | 
                return_hash = subtree( child_node, type ) 
                return_hash.each do | key, value |
                    subnodes_hash[key] += return_hash[key]
                end
            end
        end

        subnodes_hash
    end

    def attribute_match?(node, attribute, value)
        case attribute
        when :id
            node.info.id == value ? true : false
        when :type
            node.info.type == value ? true : false
        when :class
            node.info.classes.include? value ? true : false
        when :text
            node.info.text == value ? true : false
        when :name
            node.info.name == value ? true : false
        end
    end


    def search_tree( attribute, value )
        search_subtree( @head, attribute, value )
    end

    def search_subtree( start_node, attribute, value )
        return_nodes_array = []
        unless start_node.nil?

            # return_nodes_array << start_node if attribute_match?(start_node, attribute, value)

            case attribute
            when :id
                return_nodes_array << start_node if start_node.info.id == value
            when :type
                return_nodes_array << start_node if start_node.info.type == value
            when :class
                return_nodes_array << start_node if start_node.info.classes.include? value
            when :text
                return_nodes_array << start_node if start_node.info.text == value
            when :name
                return_nodes_array << start_node if start_node.info.name == value
            end

            start_node.children.each do | child_node | 
                return_nodes_array += search_subtree( child_node, attribute, value )
            end
        end
        return_nodes_array
    end

    def search_ancestors( start_node, attribute, value )
        return_nodes_array = []
        unless start_node.nil?

            case attribute
            when :id
                return_nodes_array << start_node if start_node.info.id == value
            when :type
                return_nodes_array << start_node if start_node.info.type == value
            when :class
                return_nodes_array << start_node if start_node.info.classes.include? value
            when :text
                return_nodes_array << start_node if start_node.info.text == value
            when :name
                return_nodes_array << start_node if start_node.info.name == value
            end

            return_nodes_array += search_ancestors( start_node.parent, attribute, value )
        end
        return_nodes_array
    end

    def rebuild_html(start_node = nil)
        start_node ||= @head
        ret_string = ""
        unless start_node.nil?
            ret_string += start_node.info.build_tag
            children_index = 0
            while !start_node.children[children_index].nil?
                ret_string += rebuild_html( start_node.children[children_index] )
                children_index += 1
            end
            if start_node.info.type != "text"
                ret_string += "</" + start_node.info.type + ">"
            end
        end
        ret_string
    end

end

