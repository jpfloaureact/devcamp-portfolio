10.times do |blog|
  Blog.create!(
    title: "My Blog Post #{blog}",
    body: "test body just too show some text"
  )
end

5.times do |skill|
  Skill.create!(
    title: "Rails #{skill}",
    percent_utilized: 15
  )
end

puts "5 skills created"

9.times do |portfolio_item|
  Portfolio.create!(
    title: "Portfolio title: #{portfolio_item}",
    subtitle:"My Great Service",
    body:"Some text here just to show what the body would look like but doesnt really mean anything",
    main_image:"http://via.placeholder.com/350x200",
    thumb_image:"http://via.placeholder.com/350x200",
  )
end

puts "9 portfolio items created"
