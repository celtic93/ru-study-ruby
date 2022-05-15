module Exercise
  module Arrays
    class << self
      def replace(array)
        max_element = array[0]
        array.each { |element| max_element = element if element > max_element }
        array.map { |element| element.positive? ? max_element : element }
      end

      def search(_array, _query)
        0
      end
    end
  end
end
