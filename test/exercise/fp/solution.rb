module Exercise
  module Fp
    class << self
      # Обратиться к параметрам фильма можно так:
      # film["name"], film["rating_kinopoisk"], film["rating_imdb"],
      # film["genres"], film["year"], film["access_level"], film["country"]
      def rating(array)
        films_ratings = array.map do |film|
          country_count = film['country'] ? film['country'].split(',').count : 0
          is_raiting_positive = film['rating_kinopoisk']&.to_f&.positive?
          film['rating_kinopoisk'].to_f if country_count >= 2 && is_raiting_positive
        end

        films_ratings.compact!
        films_ratings.reduce(&:+) / films_ratings.count
      end

      def chars_count(films, threshold)
        ranked_films = films.map { |film| film['name'] if film['rating_kinopoisk'].to_f >= threshold }
        ranked_films.compact!
        ranked_films.reduce(0) { |memo, film_name| memo + film_name.count('и') }
      end
    end
  end
end
