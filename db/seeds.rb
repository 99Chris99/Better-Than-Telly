# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

EventAttendee.destroy_all
Review.destroy_all
Event.destroy_all
User.destroy_all
Category.destroy_all
Venue.destroy_all




# CATEGORIES

categories_new = Category.create [
    {name: "Visual Art"}, {name: "Live Music"}, {name: "Gastronomy"}, {name: "Club Night"}, {name: "Exhibition"}, {name: "Spoken Word"}, {name: "Theatre"}
    ]


## VENUES
tatemodern = Venue.create(name: "Tate Modern", address: "Bankside, London")
islingtonassembly = Venue.create(name: "Islington Assembly Hall", address: "Upper Street, Islington")
fabric = Venue.create(name: "Fabric", address: "Charterhouse Street, London")
venues_new = Venue.create [{name: "Modern Art Oxford", address: "30 Pembroke Street, Oxford, OX1 1BP"}, 
    {name: "The Jam Factory", address: "4 Hollybush Row, Oxford, OX1 1HU"}, 
    {name: "The Bullingdon", address: "162 Cowley Road, Oxford, OX4 1UE"}]
fullers_brewery = Venue.create(name: "Fullers Brewery", address: "North Stree, Chiswick, London")
tooting = Venue.create(name: "Tooting", address: "Hereward Road, Tooting, London")
old_vic = Venue.create(name: "Old Vic", address: "Waterloo, London")


## USERS
erin = User.create(name: "Erin", email: "erin@flatironschool.com", password: "erin", password_confirmation: "erin")
ben = User.create(name: "Ben", email: "ben@flatironschool.com", password: "ben", password_confirmation:"ben")
tegan = User.create(name: "Tegan", email: "tegan@flatironschool.com", password: "tegan", password_confirmation:"tegan")
users_new = User.create [
    {email: "tom-morello@gmail.com", name:"Tom", password: "tom", password_confirmation:"tom"}, 
    {email: "joshhomme@hotmail.com", name: "Josh", password: "josh", password_confirmation:"josh"},
    {email: "kate@gmail.com", name:"Kate", password: "kate", password_confirmation:"kate"}, 
    {email: "bob@email.com", name: "Bob", password: "bob", password_confirmation:"bob"},
    {email: "frank@email.com", name: "Frank", password: "frank", password_confirmation:"frank"},
    {email: "wallis@email.com", name: "Wallis", password: "wallis",password_confirmation:"wallis"},
]

host_users = User.create [
    {email: "max_power@email.com", name:"Max", password: "max", password_confirmation:"max"}, 
    {email: "anne@hotmail.com", name: "Anne", password: "anne", password_confirmation:"anne"},
    {email: "david@gmail.com", name:"David", password: "david", password_confirmation:"david"}, 
    {email: "taylor@email.com", name: "Taylor", password: "taylor", password_confirmation:"taylor"}
]


## EVENTS
#past
event1 = Event.create(title: "Rage Against The Machine", event_date: "2000-12-31", event_time: "08:00", description: "RATM!", category_id: Category.second.id, venue_id: Venue.second.id, user_id: User.fourth.id)
event2 = Event.create(title: "Howard Hodgkin", event_date: "2017-10-10", event_time: "22:00", description: "Art Retospecitve", category_id: Category.all[1].id, venue_id: Venue.first.id, user_id: User.all[11].id)
event3 = Event.create(title: "London Brewers Alliance Beer Festival", event_date: "2017-09-14", event_time: "22:00", description: "At this festival inside Fuller’s Griffin brewery in Chiswick, there’s a whopping 50 London-based brewers to choose from. Tickets are all inclusive, so the cost of the beer is covered before you walk through the door. ", category_id: Category.all[2].id, venue_id: Venue.all[6].id, user_id: User.all[8].id)
event4 = Event.create(title: "A Very Expensive Poison", event_date: "2019-09-16", event_time: "19:30", description: "Lucy Prebble returns with her fourth play, and this one tackles the shady circumstances surrounding Russian defector Alexander Litvinenko’s poising, and ultimately his death, in 2006. A surreal and brilliant drama, you’d think the storyline was too far-fetched – if it wasn’t for the fact that it was true. ", category_id: Category.all[6].id, venue_id: Venue.all[8].id, user_id: User.all[9].id)


#future
event4 = Event.create(title: "Chris Ofili", event_date: "2019-12-31", event_time: "10:00", description: "A retrospective of artists' works", category_id: Category.first.id, venue_id: Venue.first.id, user_id: User.first.id)
event5 = Event.create(title: "That band you like", event_date: "2019-11-15", event_time: "19:00", description: "They're going to play their instruments live in front of you", category_id: Category.second.id, venue_id: Venue.second.id, user_id: User.second.id)
event6 = Event.create(title: "Superstar DJ night", event_date: "2020-01-10", event_time: "22:00", description: "Record scratch noises", category_id: Category.fourth.id, venue_id: Venue.third.id, user_id: User.third.id)
event7 = Event.create(title: "London Design Festival", event_date: "2011-11-15", event_time: "17:00", description: "The seventeenth edition of London Design Festival returns, and there are some great interactive installations to explore throughout the nine-day fest. ‘Take the Plunge’ in an oceanic journey at Bargehouse Oxo Tower Wharf or take a pew at Paul Cocksedge’s concentric wiggles in Finsbury Avenue Square.", category_id: Category.first.id, venue_id: Venue.first.id, user_id: User.all[5].id)
event8 = Event.create(title: "Queens of the Stone Age", event_date: "2019-10-10", event_time: "08:00", description: "One night only, playing Songs for the Deaf in full!", category_id: Category.second.id, venue_id: Venue.all[5].id, user_id: User.fifth.id)
event9 = Event.create(title: "Tooting Foodival", event_date: "2019-09-14", event_time: "09:00", description: "Chow down on a feast cooked by local chefs only using ingredients grown in SW17, with each course costing just £1 a pop. And if you think of yourself as a ‘chef’ rather than a humble ‘cook’, why not put your signature savoury dish in the firing line in the Top Tooting Cook Competition?", category_id: Category.all[2].id, venue_id: Venue.all[7].id, user_id: User.all[7].id)
event10 = Event.create(title: "Mischief on the Marshes", event_date: "2019-09-15", event_time: "20:00", description: "Hear storytelling troupe The Embers Collective spin age-old yarns with a modern twist to live music.", category_id: Category.all[5].id, venue_id: Venue.fifth.id, user_id: User.all[8].id)

#template = Event.create(title: "title", event_date: "2019-11-15", event_time: "19:00", description: "description", category_id: Category.all[0].id, venue_id: Venue.all[0].id, user_id: User.all[0].id)


exhibition1 = Event.create(title: "The New London Model", event_date: "2019-11-15", event_time: "10:00", description: "NLA’s giant interactive model of central London brings the story of London’s historical and physical development to life through a sophisticated projection system integrated with films.", category_id: Category.all[4].id, venue_id: Venue.all[0].id, user_id: User.all[11].id)
exhibition2 = Event.create(title: "Culture Under Attack at IWM London", event_date: "2019-11-01", event_time: "10:00", description: "Delve into how culture suffers at the hands of conflict or dictatorship in a trio of exhibitions as part of Culture Under Attack. Discover how cultural heritage can be destroyed by war in What Remains, learn about London museums and galleries' plans to hide exhibits and artwork during the Second World War in Art in Exile, and find inspiring stories of musicians who have used their talents to rise up in the face of oppression with Rebel Sounds.", category_id: Category.all[4].id, venue_id: Venue.all[4].id, user_id: User.all[12].id)

art1 = Event.create(title: "Lucian Freud: The Self-Portraits", event_date: "2019-10-25", event_time: "09:00", description: "Lucian Freud isn’t especially known for his self-portraits, but it turns out he did quite a few of them – enough to fill an exhibition, anyhow. Famed for his unremitting and, according to artist Celia Paul, ‘clinical’ gaze, Freud’s images of himself are sharply observant and, taken as a set, capture the effects of age with precision and poignancy. ", category_id: Category.all[0].id, venue_id: Venue.all[0].id, user_id: User.all[11].id)
art2 = Event.create(title: "Sorolla: Spanish Master of Light", event_date: "2019-09-25", event_time: "09:30", description: "Known as the 'master of light' for his iridescent canvases, this is a rare opportunity to see the most complete exhibition of Joaquín Sorolla y Bastida's (1863–1923) paintings outside Spain. From the vivid seascapes, garden views, and bather scenes for which he is most renowned, to portraits, landscapes and genre scenes of Spanish life, the exhibition features 58 works spanning Sorolla's career – many of which are travelling from private collections and from afar.", category_id: Category.all[0].id, venue_id: Venue.all[0].id, user_id: User.all[12].id)

food1 = Event.create(title: "Taco Masterclass", event_date: "2019-12-15", event_time: "17:00", description: "Spend the afternoon with our Chefs as they guide you through a unique taco masterclass including learning how to make traditional corn tacos from scratch. Tickets are £35pp and include: temper cocktail.", category_id: Category.all[2].id, venue_id: Venue.all[4].id, user_id: User.all[11].id)
food2 = Event.create(title: "The BQ Club", event_date: "2019-10-15", event_time: "13:00", description: "Get your grill on this winter as Taylors's BBQ Club returns to its spot on the South Bank for a top-notch range of dishes, from bram and maple sea trout, to lamb fillets and halloumi skewers.", category_id: Category.all[2].id, venue_id: Venue.all[4].id, user_id: User.all[12].id)

theatre1 = Event.create(title: "Fleabag", event_date: "2019-11-07", event_time: "19:00", description: "The play that inspired the hit television series, Fleabag is a rip-roaring look at some sort of woman living her sort of life. Fleabag may seem oversexed, emotionally unfiltered and self-obsessed, but that's just the tip of the iceberg. With family and friendships under strain and a guinea pig café struggling to keep afloat, Fleabag suddenly finds herself with nothing to lose.", category_id: Category.all[6].id, venue_id: Venue.all[1].id, user_id: User.all[10].id)
theatre2 = Event.create(title: "Hamilton", event_date: "2019-12-15", event_time: "19:00", description: "in-Manuel Miranda's Pulitzer Prize winning hip hop musical, which won 11 Tony Awards in 2016, tells the story of Alexander Hamilton, one of America's founding fathers, who served as chief staff aide to General George Washington and was killed in a duel with Vice President Aaron Burr.", category_id: Category.all[6].id, venue_id: Venue.all[1].id, user_id: User.all[10].id)





## REVIEWS 
erinsreview = Review.create(title: "Wow this was really nice", content: "This art show was so good, I really like to look at paintings. :) :)", event_id: Event.first.id, rating: 4, user_id:User.first.id)
erinsreview2 = Review.create(title: "Wow this was really nice", content: "Great", event_id: Event.fifth.id, rating: 3, user_id:User.first.id)
bensreview = Review.create(title: "the best !!", content: "There is nothing better than going to see musicians play their instruments live in front of me. good sound system", event_id: Event.second.id, rating: 5, user_id:User.fifth.id)
tegansreview = Review.create(title: "this was the worst night of my life", content: "This evening was absolutely terrible. To anyone who thinks that they should go here, STAY AWAY", event_id: Event.third.id, rating: 1, user_id:User.third.id)

## EVENT ATTENDEES
attendee1 = EventAttendee.create(user_id: User.first.id, event_id: Event.first.id)
attendee1 = EventAttendee.create(user_id: User.first.id, event_id: Event.second.id)
attendee1 = EventAttendee.create(user_id: User.first.id, event_id: Event.third.id)
attendee1 = EventAttendee.create(user_id: User.first.id, event_id: Event.fourth.id)

attendee1 = EventAttendee.create(user_id: User.third.id, event_id: Event.first.id)
attendee1 = EventAttendee.create(user_id: User.third.id, event_id: Event.second.id)
attendee1 = EventAttendee.create(user_id: User.third.id, event_id: Event.third.id)
attendee1 = EventAttendee.create(user_id: User.third.id, event_id: Event.fourth.id)

attendee1 = EventAttendee.create(user_id: User.fifth.id, event_id: Event.first.id)
attendee1 = EventAttendee.create(user_id: User.fifth.id, event_id: Event.second.id)
attendee1 = EventAttendee.create(user_id: User.fifth.id, event_id: Event.third.id)
attendee1 = EventAttendee.create(user_id: User.fifth.id, event_id: Event.fourth.id)

attendee2 = EventAttendee.create(user_id: User.second.id, event_id: Event.first.id)
attendee5 = EventAttendee.create(user_id: User.second.id, event_id: Event.second.id)

attendee1 = EventAttendee.create(user_id: User.all[6].id, event_id: Event.first.id)
attendee1 = EventAttendee.create(user_id: User.all[6].id, event_id: Event.second.id)
attendee1 = EventAttendee.create(user_id: User.all[7].id, event_id: Event.third.id)
attendee1 = EventAttendee.create(user_id: User.all[7].id, event_id: Event.fourth.id)

attendee1 = EventAttendee.create(user_id: User.all[8].id, event_id: Event.first.id)
attendee1 = EventAttendee.create(user_id: User.all[8].id, event_id: Event.second.id)
attendee1 = EventAttendee.create(user_id: User.all[8].id, event_id: Event.third.id)
attendee1 = EventAttendee.create(user_id: User.all[8].id, event_id: Event.fourth.id)