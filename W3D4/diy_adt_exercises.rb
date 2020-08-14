# Kevin Lai

# Stack = LIFO
class Stack
	# Kevin Lai
    attr_reader :ivar
	
	def initialize
      # create ivar to store stack here!
	  @ivar = []
    end

    def push(el)
      # adds an element to the stack
	  self.ivar.push(el)
    end

    def pop
      # removes one element from the stack
	  self.ivar.pop
    end

    def peek
      # returns, but doesn't remove, the top element in the stack
	  self.ivar[-1]
    end
end

puts "Stack"
stack = Stack.new
p stack
stack.push(6)
stack.push(7)
stack.push(8)
p stack
p stack.pop
p stack
p stack.peek
stack.push("KevinLai")

# Queue = FIFO
class Queue
	# Kevin Lai
    attr_reader :ivar
	
	def initialize
      # create ivar to store here!
	  @ivar = []
    end

    def enqueue(el)
      # adds an element to the queue
	  self.ivar.push(el)
    end

    def dequeue
      # removes one element from the queue
	  self.ivar.shift
    end

    def peek
      # returns, but doesn't remove
	  self.ivar[0]
    end
end

puts "==========="
puts "Queue"
queue = Queue.new
p queue
queue.enqueue(6)
queue.enqueue(7)
queue.enqueue(8)
p queue
p queue.dequeue
p queue
p queue.peek
queue.enqueue("KevinLai")

# A map stores information in key-value pairs, where the keys are always unique.
class Map
	# Kevin Lai
	attr_reader :ivar

    def initialize
      # create ivar to store here!
	  @ivar = Array.new{Array.new}
    end

    def set(key,value)
		self.ivar.each do |pair|
			if pair[0] == key
				pair << value
				return
			end
		end			
		self.ivar << [key,value]
    end

	# returns the values for the specified key
    def get(key)
		self.ivar.each do |pair|
			if pair[0] == key
				return pair[1..-1]
			end
		end
		return []
    end

    def delete(key)
		self.ivar.each_with_index do |pair, index|
			if pair[0] == key
				self.ivar.delete_at(index)
				return
			end
		end
    end
	
	def show
		p self.ivar
	end

end

puts "==========="
puts "Map"
dictionary = Map.new
p dictionary
dictionary.set("hi", 6)
dictionary.set("hi", 7)
dictionary.set("KevinLai", 7)
dictionary.set("hello", 8)
dictionary.show
p dictionary.get("hi")
p dictionary
dictionary.delete("hello")
dictionary.show

