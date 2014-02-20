#I have quotes contained love, life
Given /I have quotes contained (.+)$/ do |quotes|
  quotes.split(',').each do |quote|
    tags = 'test'
    Quote.create!(body: quote, tag_list: tags, tags_field: tags)
  end
end

Given /^I have no quotes$/ do
  Quote.delete_all
end

Then /^I should have ([0-9]+) quotes?$/ do |count|
  expect(Quote.count).to eq count.to_i
end