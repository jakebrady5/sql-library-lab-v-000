def select_books_titles_and_years_in_first_series_order_by_year
  "SELECT title, year FROM books WHERE series_id = 1 ORDER BY year;"
end

def select_name_and_motto_of_char_with_longest_motto
  "SELECT name, motto FROM characters ORDER BY length(motto) DESC LIMIT 1;"
end

def select_value_and_count_of_most_prolific_species
  "SELECT species, COUNT(species) AS species_times 
  FROM characters GROUP BY species ORDER BY species_times DESC LIMIT 1;"
end

def select_name_and_series_subgenres_of_authors
  "SELECT authors.name, subgenres.name FROM authors 
  INNER JOIN (series INNER JOIN subgenres ON series.subgenre_id = subgenres.id) 
  ON authors.id = series.author_id;"
end

def select_series_title_with_most_human_characters
  "SELECT series.title FROM series INNER JOIN 
  (books INNER JOIN 
  (character_books INNER JOIN characters ON character_books.character_id = characters.id)
  ON books.id = character_books.book_id) 
  ON series.id = books.series_id
  GROUP BY books.series_id
  ORDER BY COUNT(species = 'human') DESC
  LIMIT 1;"
end

def select_character_names_and_number_of_books_they_are_in
  "SELECT characters.name, COUNT(book_id) AS num_of_books FROM characters INNER JOIN 
  character_books ON characters.id = character_books.character_id
  GROUP BY characters.name
  ORDER BY num_of_books DESC;"
end
