# ['fish', 'fiiish', 'fiiiiish', 'fiiiish', 'fffish', 'ffiiiiisshh', 'fsh', 'fiiiissshhhhhh']
# => "fiiiissshhhhhh"

# O(n^2) complexity = nested loop
def sluggish(arr)
    largest_fish = ""
	(0..arr.length-1).each do |i|
		(0..arr.length-1).each do |i2|
			if arr[i] > arr[i2]
			   largest_fish = arr[i] 
			else
			    largest_fish = arr[i2]  
			end
		end
	end
	largest_fish
end

class Array
  # Merge Sort: O(n*lg(n))
  def self.merge_sort (array, &prc)
    return array if array.length <= 1

    mid_idx = array.length / 2
    merge(
      merge_sort(array.take(mid_idx), &prc),
      merge_sort(array.drop(mid_idx), &prc),
      &prc
    )
  end

  def self.merge(left, right, &prc)
    merged_array = []
    prc = Proc.new { |num1, num2| num1 <=> num2 } unless block_given?
    until left.empty? || right.empty?
      case prc.call(left.first, right.first)
      when -1
        merged_array << left.shift
      when 0
        merged_array << left.shift
      when 1
        merged_array << right.shift
      end
    end

    merged_array + left + right
  end
end

# O(n log n) complexity = merge_sort?
def dominant(arr)
	sorted = Array.merge_sort(arr){|a,b| a.length <=> b.length}
	sorted[-1]
end


# O(n) complexity = single loop
def clever(arr)
	largest_fish = arr[0]
	(1..arr.length-1).each do |i|
		if arr[i].length > largest_fish.length
			largest_fish = arr[i]
		end
	end
	largest_fish
end


arr = ['fish', 'fiiish', 'fiiiiish', 'fiiiish', 'fffish', 'ffiiiiisshh', 'fsh', 'fiiiissshhhhhh']
# p sluggish(arr)
# p dominant(arr)
# p clever(arr)


# Dancing Octopus
tiles_array = ["up", "right-up", "right", "right-down", "down", "left-down", "left",  "left-up" ]

def slow_dance(dir_str, moves_arr)
	moves_arr.each_with_index do |move, idx|
		return idx if move == dir_str
	end
end

p slow_dance("up", tiles_array)	# => 0
p slow_dance("right-down", tiles_array) # => 3


new_tiles_data_structure = {
	"up"=>0,
	"right_up"=>1,
	"right"=>2,
	"right-down"=>3,
	"down"=>4,
	"left-down"=>5,
	"left"=>6,
	"left-up"=>7
}

def fast_dance(dir_str, moves_hash)
	moves_hash[dir_str]
end

p fast_dance("up", new_tiles_data_structure) #=> 0
p fast_dance("right-down", new_tiles_data_structure) #=> 3


