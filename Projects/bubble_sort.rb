def bubble_sort(elements)
  sorted = false
  until sorted
    i = 0
    sorted = true
    while i < (elements.length - 1)
      if elements[i] > elements[i + 1]
        elements[i + 1], elements[i] = elements[i], elements[i + 1]
        sorted = false
      end
      i += 1
    end
  end
  puts elements.to_s
end

bubble_sort([6, 8, 9, 1, 5, 10])
