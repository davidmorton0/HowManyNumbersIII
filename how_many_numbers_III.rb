require "test/unit/assertions"
include Test::Unit::Assertions

def find_all(n, k)
  arr = (1..9).map{ |x| [x] }
  while arr.length > 0 && arr[0].length < k
    arr = arr
            .map{ |a| make_digits(a) }.flatten(1)
            .select{ |a| (k - a.length) * a[-1] + a.sum <= n &&
                         (k - a.length) * 9 + a.sum >= n }
  end
  format_result(arr)
end

def make_digits(arr)
  (arr[-1]..9).map{ |x| arr + [x] }
end

def format_result(arr)
  arr.empty? ? arr : [arr.length, arr[0].join.to_i, arr[-1].join.to_i]
end

assert_equal(find_all(10, 3), [8, 118, 334])
assert_equal(find_all(27, 3), [1, 999, 999])
assert_equal(find_all(84, 4), [])
assert_equal(find_all(35, 6), [123, 116999, 566666])
