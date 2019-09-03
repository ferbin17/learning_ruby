def smooth_list(n)
  stime = Time.now
  array1 = []
  array2 = []
  for i in (1..(n/2))
    p i
    if !(array1.include? i) && smooth(i)
      j = i
      while j <= n
        array1 << j if !(array1.include? j)
        j = j*2
      end
    end
    if !(array2.include? (n/2)+i) && smooth((n/2)+i)
      j = (n/2)+i
      while j <= n
        array2 << j if !(array2.include? j)
        j = j*2
      end
    end
  end
  etime = Time.now
  puts etime - stime
  puts (array1 | array2).length + 1
end

def smooth(num)
  largestprime(num) < Math.sqrt(num)
end

def largestprime(num)
  primefactor = 2
  while num > primefactor
    if num % primefactor == 0
      num /= primefactor
      primefactor = 2
    else
      primefactor += 1
    end
  end
  primefactor
end
smooth_list(10000000000)
