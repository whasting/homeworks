def sluggish_octo(fish_array)
  sorted = false
  until sorted
    sorted = true
    i = 0
    while i < fish_array.length - 1
      j = i + 1
      if fish_array[i].length > fish_array[j].length
        fish_array[i], fish_array[j] = fish_array[j], fish_array[i]
        sorted = false
      end
      i += 1
    end
  end
  fish_array
end

# p sluggish_octo(['fish', 'fiiish', 'fiiiiish', 'fiiiish', 'fffish', 'ffiiiiisshh', 'fsh', 'fiiiissshhhhhh'])

def dominant_octo(fish_array)
  #merge sort
  return fish_array if fish_array.length <= 1

  mid = fish_array.length / 2
  left = fish_array[0...mid]
  right = fish_array[mid..-1]

  dominant_octo_helper(dominant_octo(left), dominant_octo(right))
end

def dominant_octo_helper(left, right)
  merged = []

  until left.empty? || right.empty?
    case left.first.length <=> right.first.length
    when -1
      merged << left.shift
    when 0
      merged << left.shift
    when 1
      merged << right.shift
    end
  end

  merged + left + right
end

# p dominant_octo(['fish', 'fiiish', 'fiiiiish', 'fiiiish', 'fffish', 'ffiiiiisshh', 'fsh', 'fiiiissshhhhhh'])

def clever_octo(fish_array)
  return fish_array if fish_array.length < 1

  pivot = fish_array.shift
  left = []
  right = []

  fish_array.each do |fish|
    if fish.length < pivot.length
      left << fish
    else
      right << fish
    end
  end
  clever_octo(left) + [pivot] + clever_octo(right)
end

# p clever_octo(['fish', 'fiiish', 'fiiiiish', 'fiiiish', 'fffish', 'ffiiiiisshh', 'fsh', 'fiiiissshhhhhh'])

def slow_dance(target, tiles_arr)
  tiles_arr.each_with_index do |tile, idx|
    return idx if tile == target
  end
  nil
end

tiles_array = %w(up right-up right right-down down left-down left left-up)
# p slow_dance("up", tiles_array)
# > 0

# p slow_dance("right-down", tiles_array)
# > 3

def constant_dance(target, tiles_hash)
  return tiles_hash[target] unless tiles_hash[target].nil?
  nil
end

tiles_hash = {
  "up" => 0,
  "right-up" => 1,
  "right" => 2,
  "right-down" => 3,
  "down" => 4,
  "left-down" => 5,
  "left" => 6,
  "left-up" => 7
}
# p constant_dance("up", tiles_hash)
# > 0

# p constant_dance("right-down", tiles_hash)
# > 3
