require 'pry'
vote_results =
  {
    "Precinct 1" => {
      'Mary Sue' => 218,
      'Sally Jane' => 455,
      'Billy Joe' => 185
    },
    "Precinct 2" => {
      'Mary Sue' => 229,
      'Sally Jane' => 41,
      'Billy Joe' => 35
    },
    "Precinct 3" => {
      'Mary Sue' => 297,
      'Sally Jane' => 423,
      'Billy Joe' => 488
    },
    "Precinct 4" => {
    'Mary Sue' => 283,
    'Sally Jane' => 171,
    'Billy Joe' => 353
    }
  }

  # 1) Generate the voting totals by Precinct and Candidate as shown in the directions.
precincts = ["Precinct 1","Precinct 2","Precinct 3","Precinct 4"]
candidates = ["Mary Sue","Sally Jane","Billy Joe"]

precincts.each do |precinct|
  puts precinct
  candidates.each do |candidate|
    puts "  -#{candidate} got #{vote_results[precinct][candidate]}"
  end
end
puts
  # 2) How many people voted in each precinct? Create a new hash where the keys name the precinct and the values start at 0. Iterate over the provided `vote_results` to update the totals.
precinct_results = []
precincts.each do |precinct|
  sum = vote_results[precinct].each_value.reduce(:+)
  puts "#{precinct} had #{sum} votes"
  precinct_results.push(sum)
end
puts

  # 3) Which precinct had the highest voter turnout? Use the hash you created in Question 2 to return the answer.
max = precinct_results.max
puts "Precinct #{precinct_results.index(max) + 1} had the most votes with #{max} votes"
puts
  # 4) Output the total number of votes per candidate in the format seen above. Create a new hash where the keys name the candidate and the values start at 0. Iterate over the provided `vote_results` to update the totals.
results = {"Mary Sue" => 0, "Sally Jane" => 0, "Billy Joe" => 0}

vote_results.each do |key, value|
  value.each do |key, value|
    case key
    when "Mary Sue"
      results["Mary Sue"] += value
    when "Sally Jane"
      results["Sally Jane"] += value
    when "Billy Joe"
      results["Billy Joe"] += value
    end
  end
end

results.each {|key,value| puts "#{key} had #{value} votes"}
puts
  # 5) Who was the winning candidate in Precinct 4 and how many votes did they get?
vote_results.each do |key, value|
  person = ''
  if key == "Precinct 4"
    value.each { |k, v| person = k if v == value.values.max }
    puts "#{person} won Precinct 4 with #{value[person]} votes"
  end
end
puts

  # 6) How many people voted in total?
vote_results
  # 7) Who won the election and how many votes did they get? Use the hash you created in Question 4 to return the answer.

  # 8) How many more votes did the winner have as compared to the third place candidate? Use the hash you created in Question 4 and the winning candidate total votes value from Question 7 to complete this question.
