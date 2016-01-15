

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
        node ||= @head
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

    # def search_tree( attribute, value )
    #     node = @head


    # end

    # def search_subtree( start_node, attribute, value )
    #     start_node ||= @head
    #     unless start_node.nil?
    #         start_node.children.each do | child_node | 
    #             return_hash = subtree( child_node, type ) 
    #             return_hash.each do | key, value |
    #                 subnodes_hash[key] += return_hash[key]
    #             end
    #         end
    #     end

    # end

end
