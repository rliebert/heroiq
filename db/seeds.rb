# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

#### 

#### PRODUCTS ####

### Product 1: Fender Strat ####
prod1 = Product.create(
			prod_type: "Electric Guitar",
			brand_name: "Fender",
			prod_name: "Stratocaster",
			description: "[From Wikipedia] The Fender Stratocaster is a model of electric guitar designed in 1954 by Leo Fender, Bill Carson, George Fullerton, and Freddie Tavares. The Fender Musical Instruments Corporation has manufactured the Stratocaster continuously from 1954 to the present. It is a double-cutaway guitar, with an extended top \"horn\" shape for balance. Along with the Gibson Les Paul, it is one of the most often copied electric guitar shapes. \"Stratocaster\" and \"Strat\" are trademark terms belonging to Fender.  The Stratocaster is a versatile guitar, usable for most styles of music and has been used in many genres, including country, rock, pop, soul, rhythm and blues, blues, jazz, punk and heavy metal."
			)
Photo.create(	image: 'https://dl.dropboxusercontent.com/s/cyvncyl8qoc3zz1/prod1img1.jpg?dl=0',
				caption: "American Standard Stratocaster HSS",
				product_id: prod1.id
				)
Photo.create(	image: 'https://dl.dropboxusercontent.com/s/y6a1dd4rxduizsd/prod1img2.jpg?dl=0',
				caption: "American Special Stratocaster",
				product_id: prod1.id
				)

### Product 2: Seagull Maritime SWS ###
prod2 = Product.create(
			prod_type: "Acoustic Guitar",
			brand_name: "Seagull",
			prod_name: "Maritime SWS",
			description: "[From seagullguitars.com] The Maritime Solid Wood Series features the dreadnought SWS Semi-Gloss, SWS High-Gloss & SWS Rosewood Semi-Gloss, as well as SWS Folk HG and SWS Mini-Jumbo HG. All solid wood construction is used in all SWS models including solid mahogany back & sides and select pressure tested solid spruce tops, all with a custom polished finish."
			)
Photo.create(	image: 'https://dl.dropboxusercontent.com/s/jhlzfudv4467l5x/prod2img1.jpg?dl=0',
				caption: "Maritime SWS Semi-Gloss",
				product_id: prod2.id
				)
Photo.create(	image: 'https://dl.dropboxusercontent.com/s/8zvbc74ouyauw4h/prod2img2.jpg?dl=0',
				caption: "Maritime SWS Crème Brulée CW GT QI",
				product_id: prod2.id)

### Product 3: Gibson Les Paul ###
prod3 = Product.create(
			prod_type: "Electric Guitar",
			brand_name: "Gibson",
			prod_name: "Les Paul",
			description: "[From Wikipedia] The Gibson Les Paul is a solid body electric guitar that was first sold by the Gibson Guitar Corporation in 1952. The Les Paul was designed by guitarist/inventor Les Paul with the assistance of Ted McCarty and his team.  The Les Paul was originally offered with a gold finish and two P-90 pickups. In 1957, humbucking pickups were added, along with sunburst finishes in 1958. The sunburst 1958–1960 Les Paul – today one of the best-known electric guitar types in the world – was considered a failure, with low production and sales. For 1961, the Les Paul was redesigned into what is now known as the Gibson SG. This design continued until 1968, when the traditional single cutaway, carved top bodystyle was reintroduced. The Les Paul has been continually produced in countless versions and editions since. Along with Fender's Telecaster and Stratocaster, it was one of the first mass-produced electric solid-body guitars. Les Pauls have been used in many genres, including rock, pop, soul, rhythm and blues, blues, jazz, reggae, punk, and heavy metal."
			)
Photo.create(	image: 'https://dl.dropboxusercontent.com/s/ipmp1h670hd6dv3/prod3img1.jpg?dl=0',
				caption: "Gibson Les Paul",
				product_id: prod3.id
				)
Photo.create(	image: 'https://dl.dropboxusercontent.com/s/59gnkgz5hoblfsu/prod3img2.jpg?dl=0',
				caption: "Group of Les Pauls",
				product_id: prod3.id
				)

### Product 4: Martin D-28 ###
prod4 = Product.create(
			prod_type: "Acoustic Guitar",
			brand_name: "Martin",
			prod_name: "D-28",
			description: "[From martinguitar.com] The D-28 is the Dreadnought by which all others are judged. Constructed of solid East Indian rosewood back and sides, Sitka spruce top and mahogany neck, this instrument has been a favorite of artists from Hank Williams Sr. to Jimmy Page. Massive bass response balanced with articulate highs makes this a benchmark acoustic guitar and a must-have for every guitarist. Perfect for the intermediate and advanced player."
			)
Photo.create(	image: 'https://dl.dropboxusercontent.com/s/mdl5ttfhn9r1gab/prod4img1.jpg?dl=0',
				caption: "Front 1",
				product_id: prod4.id
				)
Photo.create(	image: 'https://dl.dropboxusercontent.com/s/3u22abuf7zvufv8/prod4img2.jpg?dl=0',
				caption: "Back",
				product_id: prod4.id
				)
Photo.create(	image: 'https://dl.dropboxusercontent.com/s/gzrcyil0xciheu0/prod4img3.jpg?dl=0',
				caption: "Head",
				product_id: prod4.id
				)
Photo.create(	image: 'https://dl.dropboxusercontent.com/s/tjssdzf16sywx7p/prod4img4.jpg?dl=0',
				caption: "Body",
				product_id: prod4.id
				)


#### Listings ####

### Fender Strat ###
prod1list1 = Listing.create(
				name: "Lucille",
				description: "Cream colored beauty with rosewood fretboard",
				mfr_date: Date.new(1965, 1, 1),
				serial_no: "S12101909",
				rental_price_per_day: 30.00,
				rental_price_per_wk: 150.00,
				security_deposit: 100.00,
				sale_price: 750.00,
				accept_offers: true,
				product_id: prod1.id
				)
Photo.create(	image: 'https://dl.dropboxusercontent.com/s/mfg139ha2zeoyiv/prod1list1img1.jpg?dl=0',
				caption: "View 1",
				listing_id: prod1list1.id
				)
Photo.create(	image: 'https://dl.dropboxusercontent.com/s/nymoelk0ddqpfrt/prod1list1img2.jpg?dl=0',
				caption: "View 2",
				listing_id: prod1list1.id
				)

prod1list2 = Listing.create(
				name: "Roxanne",
				description: "Sunburst with maple fretboard",
				mfr_date: Date.new(1996, 1, 1),
				serial_no: "S12101909",
				rental_price_per_day: 35.00,
				rental_price_per_wk: 180.00,
				security_deposit: 135.00,
				sale_price: 1150.00,
				accept_offers: true,
				product_id: prod1.id
				)
Photo.create(	image: 'https://dl.dropboxusercontent.com/s/wyfdmmwo0ar7552/prod1list2img1.jpg?dl=0',
				caption: "View 1",
				listing_id: prod1list2.id
				)
Photo.create(	image: 'https://dl.dropboxusercontent.com/s/sp789429zt9vyiv/prod1list2img2.jpg?dl=0',
				caption: "View 2",
				listing_id: prod1list2.id
				)

### Seagull Maritime SWS ###
prod2list1 = Listing.create(
				name: "Woody",
				description: "Semi-Gloss finish, acoustic only, no electronics",
				mfr_date: Date.new(2008, 1, 1),
				serial_no: "S12101909",
				rental_price_per_day: 21.00,
				rental_price_per_wk: 120.00,
				security_deposit: 75.00,
				sale_price: 600.00,
				accept_offers: true,
				product_id: prod2.id
				)
Photo.create(	image: 'https://dl.dropboxusercontent.com/s/au6gzv2c8uxz4cc/prod2list1img1.jpg?dl=0',
				caption: "View 1",
				listing_id: prod2list1.id
				)
Photo.create(	image: 'https://dl.dropboxusercontent.com/s/2d4boxkim0jltm6/prod2list1img2.jpg?dl=0',
				caption: "View 2",
				listing_id: prod2list1.id
				)

