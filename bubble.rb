def bubble_sort(arr)

  (arr.length**2).times do
    0.upto(arr.length-2) do |a|
      (arr[a],arr[a+1] = arr[a+1],arr[a]) if (arr[a] <=> arr[a+1]) == 1
    end
  end
  arr
end
print bubble_sort([4,3,7,8,2,0,2])

def bubble_sort_by(arr)
    (arr.length**2).times do
      0.upto(arr.length-2) do |a|
        (arr[a],arr[a+1] = arr[a+1],arr[a]) if (yield arr[a],arr[a+1]) > 0
      end
    end
    print arr
end
bubble_sort_by(["hi","hello","hey"]) do |a,b|
  a.length - b.length
end
#
