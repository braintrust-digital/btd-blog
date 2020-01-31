15.times do
  fake_html_content = ""
  Faker::Hipster.paragraphs(number: rand(2..8)).each do |s|
    fake_html_content +=  "<p>#{s}</p>"
  end

  Post.create({
    title: Faker::Hipster.sentence(word_count: rand(2..5)),
    content: fake_html_content,
    published_at: Time.now - rand(1..20).days
  })
end
