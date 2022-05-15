module Exercise
  module Arrays
    class << self
      def replace(array)
        max_element = array[0]
        array.each { |element| max_element = element if element > max_element }
        array.map { |element| element.positive? ? max_element : element }
      end

      def search(array, query)
        return -1 unless array.any?

        middle_index = array.length / 2
        start_index = 0
        end_index = array.length - 1

        return middle_index if array[middle_index] == query
        return -1 if array[middle_index] < query && (array[middle_index + 1].nil? || array[middle_index + 1] > query)

        if array[middle_index] > query
          index = search(array[start_index...middle_index], query)

          return index if index >= 0
        else
          index = search(array[middle_index..end_index], query)

          return middle_index + index if index >= 0
        end

        -1
      end
    end
  end
end
