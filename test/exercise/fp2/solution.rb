module Exercise
  module Fp2
    class MyArray < Array
      # Использовать стандартные функции массива для решения задач нельзя.
      # Использовать свои написанные функции для реализации следующих - можно.

      # Написать свою функцию my_each
      def my_each
        i = 0
        while i < length
          yield self[i]
          i += 1
        end

        self
      end

      # Написать свою функцию my_map
      def my_map
        new_array = MyArray.new

        i = 0
        while i < length
          new_array.push(yield self[i])
          i += 1
        end

        new_array
      end

      # Написать свою функцию my_compact
      def my_compact
        new_array = MyArray.new

        my_each { |element| new_array << element unless element.nil? }
        new_array
      end

      # Написать свою функцию my_reduce
      def my_reduce; end
    end
  end
end
