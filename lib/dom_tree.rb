
DOMTreeNode = Struct.new( :info, :parent, :children, :depth, :is_open )

class DOMTree

    attr_accessor :head

    def initialize
        @head = 6
        @current_open_node = nil
    end

    def get_children

    end

    def add_text_to_open_node new_text
        # @open_node.info.text = new_text
    end

end
