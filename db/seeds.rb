puts "Seeds Category"

Photo.destroy_all
Category.destroy_all

# WALLPAPERS
wallpapers = Category.create(name: "Wallpapers",
                             description: "From epic drone shots to inspiring moments in nature, find free HD wallpapers worthy of your screens.")

wallpapers.cover.attach(io: File.open("db/images/wallpapers.png"), filename: "wallpapers")

# NATURE
nature = Category.create(name: "Nature",
                         description: "Let’s celebrate the magic of Mother Earth — with images of everything our planet has to offer.")
nature.cover.attach(io: File.open("db/images/nature.png"), filename: "nature")

new_comment = nature.comments.create(body: "I like it")
new_comment = nature.comments.create(body: "I like the photos")

nature_one = Photo.create(title: "Purple lake", description: "Nice and big purple lake.",
                          category: nature)
nature_one.image.attach(io: File.open("db/images/nature/purple_lake.png"), filename: "purple_lake")

nature_two = Photo.create(title: "Green plant", description: "Nice green plant.",
                          category: nature)
nature_two.image.attach(io: File.open("db/images/nature/green_plant.png"), filename: "green_plant")

nature_three = Photo.create(title: "Lonely bird", description: "Nice lonely bird.",
                            category: nature)
nature_three.image.attach(io: File.open("db/images/nature/lonely_bird.png"),
                          filename: "lonely_bird")

# PEOPLE
people = Category.create(name: "People",
                         description: "Real people, captured. Photography has the power to reflect the world around us, give voice to individuals and groups.")
people.cover.attach(io: File.open("db/images/people.png"), filename: "people")

puts "End seedings Category"
