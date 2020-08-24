
# We use two data structures to implement an LRU Cache.

# Queue which is implemented using a doubly linked list.
# The maximum size of the queue will be equal to
# the total number of frames available (cache size).
# The most recently used pages will be near front end and
# least recently pages will be near the rear end.
# A Hash with page number as key and address of
# the corresponding queue node as value.

class LRUCache
    def initialize(capacity)
        @max_capacity = capacity
        @cache = []
    end

    def count
      # returns number of elements currently in cache
      @cache.length
    end

    def add(el)
      # adds element to cache according to LRU principle

      # essentially, add the element in like a queue with a limited size would
      
      # need to check if new_el is already in the cache
      if @cache.include?(el) 
        # if the new_el is in the cache,
        # then we need to move it to the end of the queue
        
        @cache.delete(el)
      elsif self.count >= @max_capacity
        difference = self.count - @max_capacity
        difference.times{ @cache.shift }
      end

      @cache << el
      # tried using set, but set doesn't have a shift method
    end

    def show
      # shows the items in the cache, with the LRU item first
        p @cache
    end

    private
    # helper methods go here!

end


johnny_cache = LRUCache.new(4)

johnny_cache.add("I walk the line")
johnny_cache.add(5)

johnny_cache.count # => returns 2

johnny_cache.add([1,2,3])
johnny_cache.add(5)

#johnny_cache.show

johnny_cache.add(-5)

#johnny_cache.show

johnny_cache.add({a: 1, b: 2, c: 3})

#johnny_cache.show

johnny_cache.add([1,2,3,4])

#johnny_cache.show

johnny_cache.add("I walk the line")
johnny_cache.add(:ring_of_fire)
johnny_cache.add("I walk the line")
johnny_cache.add({a: 1, b: 2, c: 3})

# actually printing: [-5, [1, 2, 3, 4], :ring_of_fire, "I walk the line", {:a=>1, :b=>2, :c=>3}]
# is there a typo in expected answer?

johnny_cache.show # => prints [[1, 2, 3, 4], :ring_of_fire, "I walk the line", {:a=>1, :b=>2, :c=>3}]