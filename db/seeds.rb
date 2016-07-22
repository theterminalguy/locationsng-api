# this file should contain all the record creation needed to seed the database with its default values.
# the data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# examples:
#
#   cities = city.create([{ name: 'chicago' }, { name: 'copenhagen' }])
#   mayor.create(name: 'emanuel', city: cities.first)


Zone.create(
  [
    {
     code: "nc",
      name: "north-central"
    },
    {
     code: "ne",
      name: "north-eastern"
    },
    {
     code: "nw",
      name: "north-western"
    },
    {
     code: "se",
      name: "south-eastern"
    },
    {
     code: "ss",
      name: "south-south"
    },
    {
     code: "sw",
      name: "south-western"
    }
  ]
)

State.create(
  [
    {
     code: "ab",
      name: "abia",
      zone_id: 4
    },
    {
     code: "ad",
      name: "adamawa",
      zone_id: 2
    },
    {
     code: "ak",
      name: "akwa ibom",
      zone_id: 5
    },
    {
     code: "an",
      name: "anambra",
      zone_id: 4
    },
    {
     code: "ba",
      name: "bauchi",
      zone_id: 2
    },
    {
     code: "by",
      name: "bayelsa",
      zone_id: 5
    },
    {
     code: "bn",
      name: "benue",
      zone_id: 1
    },
    {
     code: "bo",
      name: "borno",
      zone_id: 2
    },
    {
     code: "cr",
      name: "cross river",
      zone_id: 5
    },
    {
     code: "dt",
      name: "delta",
      zone_id: 5
    },
    {
     code: "eb",
      name: "ebonyi",
      zone_id: 4
    },
    {
     code: "ed",
      name: "edo",
      zone_id: 5
    },
    {
     code: "ek",
      name: "ekiti",
      zone_id: 6
    },
    {
     code: "en",
      name: "enugu",
      zone_id: 4
    },
    {
     code: "fc",
      name: "fct-abuja",
      zone_id: 1
    },
    {
     code: "gm",
      name: "gombe",
      zone_id: 2
    },
    {
     code: "im",
      name: "imo",
      zone_id: 4
    },
    {
     code: "jg",
      name: "jigawa",
      zone_id: 3
    },
    {
     code: "kd",
      name: "kaduna",
      zone_id: 3
    },
    {
     code: "kn",
      name: "kano",
      zone_id: 3
    },
    {
     code: "kt",
      name: "katsina",
      zone_id: 3
    },
    {
     code: "kb",
      name: "kebbi",
      zone_id: 3
    },
    {
     code: "kg",
      name: "kogi",
      zone_id: 1
    },
    {
     code: "kw",
      name: "kwara",
      zone_id: 1
    },
    {
     code: "la",
      name: "lagos",
      zone_id: 6
    },
    {
     code: "ns",
      name: "nassarawa",
      zone_id: 1
    },
    {
     code: "ng",
      name: "niger",
      zone_id: 1
    },
    {
     code: "og",
      name: "ogun",
      zone_id: 6
    },
    {
     code: "od",
      name: "ondo",
      zone_id: 6
    },
    {
     code: "os",
      name: "osun",
      zone_id: 6
    },
    {
     code: "oy",
      name: "oyo",
      zone_id: 6
    },
    {
     code: "pl",
      name: "plateau",
      zone_id: 1
    },
    {
     code: "rv",
      name: "rivers",
      zone_id: 5
    },
    {
     code: "so",
      name: "sokoto",
      zone_id: 3
    },
    {
     code: "tr",
      name: "taraba",
      zone_id: 2
    },
    {
     code: "yb",
      name: "yobe",
      zone_id: 2
    },
    {
     code: "zm",
      name: "zamfara",
      zone_id: 3
    }
  ]
)



Town.create([
  {
    state_id: 1, 
    name: "Jimeta",
    id:""
  }
])


Area.create([
  {
    town_id: 1, 
    name: "Majalisa"
  }
])

Street.create([
  {
    area_id: 1, 
    name: "Majalisa"
  }
])
