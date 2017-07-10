# Add a declarative step here for populating the DB with movies.

Given /the following movies exist/ do |movies_table|
  movies_table.hashes.each do |movie|
    # each returned element will be a hash whose key is the table header.
    # you should arrange to add that movie to the database here.
    Movie.create movie
  end
end

Then /^the director of "(.*)" should be "(.*)"$/ do |title_val, director_val|
    movie = Movie.find_by_title(title_val)
    expect(movie.director).to eq director_val
end
    
# Make sure that one string (regexp) occurs before or after another one
#   on the same page

Then /I should see "(.*)" before "(.*)"/ do |e1, e2|
  #  ensure that that e1 occurs before e2.
  #  page.body is the entire content of the page as a string.
  body = page.body
  location_of_e1_in_body = body.index(e1)
  location_of_e2_in_body = body.index(e2)
  loc1 = location_of_e1_in_body
  loc2 = location_of_e2_in_body
  if loc1 == nil || loc2 == nil
    fail "One of both search parameters not found"
  else
    expect(e1<e2).to eq true
  end
end