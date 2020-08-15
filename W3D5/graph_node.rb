require "set"
class GraphNode

	attr_accessor :neighbors
	attr_reader :value

	def initialize(value)
		@value = value
		@neighbors = []
	end
end

def bfs(starting_node, target_value)
	queue = []
    queue << starting_node
	# Sets do not contain duplicate values
    checked_nodes = Set.new
    until queue.empty?
        # remove the first element each time.
        ele = queue.shift
        return ele if ele.value == target_value
        ele.neighbors.each do |node|
			# see if we checked out that node before
			unless checked_nodes.include?(node)
				# if not, then push node into checked_nodes and queue
				checked_nodes << node
				queue << node
			end
		# otherwise, if we already checked out the node, then ignore it and move on.
		end
    end
    nil
end


a = GraphNode.new('a')
b = GraphNode.new('b')
c = GraphNode.new('c')
d = GraphNode.new('d')
e = GraphNode.new('e')
f = GraphNode.new('f')
a.neighbors = [b, c, e]
c.neighbors = [b, d]
e.neighbors = [a]
f.neighbors = [e]

p bfs(a, "b")
p bfs(a, "f")
p bfs(a, "d")
