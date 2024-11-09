//
//  Locations.swift
//  Explore
//
//  Created by felicia tan on 9/11/24.
//

import Foundation
import MapKit

struct Location: Identifiable {
    let id = UUID()
    let name: String
    let coordinate: CLLocationCoordinate2D
}

// landmarks is a list 
var allLandmarks = [
    Location(
        name: "National Gallery Singapore",
        coordinate: CLLocationCoordinate2D(
            latitude: 1.29000000002855,
            longitude: 103.851355999735006
        )
    ),
    Location(
        name: "Sultan Mosque (Masjid Sultan) Singapore",
        coordinate: CLLocationCoordinate2D(
            latitude: 1.3020000004261,
            longitude: 103.859171000287006
        )
    ),
    Location(
        name: "Sri Mariamman Temple: Hindu Temple in Singapore",
        coordinate: CLLocationCoordinate2D(
            latitude: 1.28200000029374,
            longitude: 103.845380000188996
        )
    ),
    Location(
        name: "Armenian Church in Singapore",
        coordinate: CLLocationCoordinate2D(
            latitude: 1.29300000039531,
            longitude: 103.849660000323993
        )
    ),
    Location(
        name: "CHIJMES Singapore",
        coordinate: CLLocationCoordinate2D(
            latitude: 1.29500000011955,
            longitude: 103.851680000242993
        )
    ),
    Location(
        name: "St Andrew's Cathedral - Singapore Architecture Landmark",
        coordinate: CLLocationCoordinate2D(
            latitude: 1.2920000003645,
            longitude: 103.85230999961
        )
    ),
    Location(
        name: "Kreta Ayer Square",
        coordinate: CLLocationCoordinate2D(
            latitude: 1.2811980001643,
            longitude: 103.843585299873993
        )
    ),
    Location(
        name: "Albert Mall Trishaw Park",
        coordinate: CLLocationCoordinate2D(
            latitude: 1.29954890040453,
            longitude: 103.853484799781
        )
    ),
    Location(
        name: "Chinatown Food Street",
        coordinate: CLLocationCoordinate2D(
            latitude: 1.28255329957829,
            longitude: 103.843792399604993
        )
    ),
    Location(
        name: "Chinatown Heritage Centre",
        coordinate: CLLocationCoordinate2D(
            latitude: 1.28399999981531,
            longitude: 103.844350000380999
        )
    ),
    Location(
        name: "Thian Hock Keng Temple",
        coordinate: CLLocationCoordinate2D(
            latitude: 1.28099999981183,
            longitude: 103.84763000017
        )
    ),
    Location(
        name: "Eurasian Heritage Centre",
        coordinate: CLLocationCoordinate2D(
            latitude: 1.30999999987936,
            longitude: 103.899420000077001
        )
    ),
    Location(
        name: "Shophouses",
        coordinate: CLLocationCoordinate2D(
            latitude: 1.27699999987638,
            longitude: 103.837336000077997
        )
    ),
    Location(
        name: "Capitol Building Singapore",
        coordinate: CLLocationCoordinate2D(
            latitude: 1.29400000044934,
            longitude: 103.851569999728994
        )
    ),
    Location(
        name: "Esplanade Theatres on the Bay",
        coordinate: CLLocationCoordinate2D(
            latitude: 1.28999999976427,
            longitude: 103.855280000277006
        )
    ),
    Location(
        name: "Gardens by the Bay",
        coordinate: CLLocationCoordinate2D(
            latitude: 1.28199999966925,
            longitude: 103.863612999588995
        )
    ),
    Location(
        name: "The Interlace",
        coordinate: CLLocationCoordinate2D(
            latitude: 1.28199999962561,
            longitude: 103.803050000141994
        )
    ),
    Location(
        name: "PARKROYAL on Pickering",
        coordinate: CLLocationCoordinate2D(
            latitude: 1.28599999964806,
            longitude: 103.846522000443002
        )
    ),
    Location(
        name: "Lasalle College of the Arts",
        coordinate: CLLocationCoordinate2D(
            latitude: 1.30299999964428,
            longitude: 103.851600000185996
        )
    ),
    Location(
        name: "Kranji War Memorial",
        coordinate: CLLocationCoordinate2D(
            latitude: 1.41899999993219,
            longitude: 103.757490000066994
        )
    ),
    Location(
        name: "Indian National Army Monument",
        coordinate: CLLocationCoordinate2D(
            latitude: 1.28999999972323,
            longitude: 103.854216999708996
        )
    ),
    Location(
        name: "Reflections at Bukit Chandu",
        coordinate: CLLocationCoordinate2D(
            latitude: 1.28000000039258,
            longitude: 103.794329999699002
        )
    ),
    Location(
        name: "The Cenotaph",
        coordinate: CLLocationCoordinate2D(
            latitude: 1.29000000011184,
            longitude: 103.853838000322995
        )
    ),
    Location(
        name: "Civilian War Memorial",
        coordinate: CLLocationCoordinate2D(
            latitude: 1.29299999961119,
            longitude: 103.854617999677998
        )
    ),
    Location(
        name: "Sri Veeramakaliamman Temple",
        coordinate: CLLocationCoordinate2D(
            latitude: 1.30799999960669,
            longitude: 103.852579999691997
        )
    ),
    Location(
        name: "Maghain Aboth Synagogue",
        coordinate: CLLocationCoordinate2D(
            latitude: 1.29800000044313,
            longitude: 103.850810000066005
        )
    ),
    Location(
        name: "Old Supreme Court",
        coordinate: CLLocationCoordinate2D(
            latitude: 1.28999999966472,
            longitude: 103.851280000201001
        )
    ),
    Location(
        name: "SIT Flats Singapore",
        coordinate: CLLocationCoordinate2D(
            latitude: 1.28400000017477,
            longitude: 103.833600000057004
        )
    ),
    Location(
        name: "Lau Pa Sat Singapore",
        coordinate: CLLocationCoordinate2D(
            latitude: 1.28099999966763,
            longitude: 103.850439999931993
        )
    ),
    Location(
        name: "Malay Heritage Centre",
        coordinate: CLLocationCoordinate2D(
            latitude: 1.30299999990489,
            longitude: 103.859860000254002
        )
    ),
    Location(
        name: "Peranakan Museum Singapore",
        coordinate: CLLocationCoordinate2D(
            latitude: 1.2940000002022,
            longitude: 103.849200000392997
        )
    ),
    Location(
        name: "Raffles Singapore",
        coordinate: CLLocationCoordinate2D(
            latitude: 1.29600000035821,
            longitude: 103.854039999720001
        )
    ),
    Location(
        name: "Gillman Barracks",
        coordinate: CLLocationCoordinate2D(
            latitude: 1.27800000008414,
            longitude: 103.804589999624
        )
    ),
    Location(
        name: "ArtScience Museum",
        coordinate: CLLocationCoordinate2D(
            latitude: 1.28600000000066,
            longitude: 103.859290000076001
        )
    ),
    Location(
        name: "SAM at 8Q",
        coordinate: CLLocationCoordinate2D(
            latitude: 1.2970000001282,
            longitude: 103.851680000257005
        )
    ),
    Location(
        name: "Jamae Mosque",
        coordinate: CLLocationCoordinate2D(
            latitude: 1.283,
            longitude: 103.84554
        )
    ),
    Location(
        name: "Institute of Contemporary Arts",
        coordinate: CLLocationCoordinate2D(
            latitude: 1.303,
            longitude: 103.8516
        )
    ),
    Location(
        name: "Singapore Flyer",
        coordinate: CLLocationCoordinate2D(
            latitude: 1.289,
            longitude: 103.863137
        )
    ),
    Location(
        name: "Marina Bay Sands",
        coordinate: CLLocationCoordinate2D(
            latitude: 1.283,
            longitude: 103.86081
        )
    ),
    Location(
        name: "Marina Barrage",
        coordinate: CLLocationCoordinate2D(
            latitude: 1.281,
            longitude: 103.87159
        )
    ),
    Location(
        name: "Henderson Waves",
        coordinate: CLLocationCoordinate2D(
            latitude: 1.276,
            longitude: 103.815254
        )
    ),
    Location(
        name: "Pinnacle@Duxton",
        coordinate: CLLocationCoordinate2D(
            latitude: 1.275,
            longitude: 103.84142
        )
    ),
    Location(
        name: "Hajjah Fatimah Mosque",
        coordinate: CLLocationCoordinate2D(
            latitude: 1.303,
            longitude: 103.86285
        )
    ),
    Location(
        name: "Haw Par Villa",
        coordinate: CLLocationCoordinate2D(
            latitude: 1.286,
            longitude: 103.78314
        )
    ),
    Location(
        name: "NUS Baba House",
        coordinate: CLLocationCoordinate2D(
            latitude: 1.277,
            longitude: 103.83731
        )
    ),
    Location(
        name: "Hong San See Temple",
        coordinate: CLLocationCoordinate2D(
            latitude: 1.293,
            longitude: 103.841222
        )
    ),
    Location(
        name: "Chinese Heritage Centre",
        coordinate: CLLocationCoordinate2D(
            latitude: 1.344,
            longitude: 103.68398
        )
    ),
    Location(
        name: "Kampong Glam",
        coordinate: CLLocationCoordinate2D(
            latitude: 1.302,
            longitude: 103.8595
        )
    ),
    Location(
        name: "Contemporary Arts Center",
        coordinate: CLLocationCoordinate2D(
            latitude: 1.275,
            longitude: 103.8045
        )
    ),
    Location(
        name: "The Substation",
        coordinate: CLLocationCoordinate2D(
            latitude: 1.294,
            longitude: 103.84934
        )
    ),
    Location(
        name: "Red Dot Design Museum",
        coordinate: CLLocationCoordinate2D(
            latitude: 1.278,
            longitude: 103.84572
        )
    ),
    Location(
        name: "Singapore Art Museum",
        coordinate: CLLocationCoordinate2D(
            latitude: 1.297,
            longitude: 103.85107
        )
    ),
    Location(
        name: "Esplanade Theatres on the Bay",
        coordinate: CLLocationCoordinate2D(
            latitude: 1.29,
            longitude: 103.85528
        )
    ),
    Location(
        name: "National Design Centre",
        coordinate: CLLocationCoordinate2D(
            latitude: 1.299,
            longitude: 103.85351
        )
    ),
    Location(
        name: "Victoria Theatre Singapore",
        coordinate: CLLocationCoordinate2D(
            latitude: 1.288,
            longitude: 103.85164
        )
    ),
    Location(
        name: "NUS University Museum",
        coordinate: CLLocationCoordinate2D(
            latitude: 1.302,
            longitude: 103.77269
        )
    ),
    Location(
        name: "Sun Yat Sen Memorial Hall",
        coordinate: CLLocationCoordinate2D(
            latitude: 1.328,
            longitude: 103.84692
        )
    ),
    Location(
        name: "Asian Civilisations Museum",
        coordinate: CLLocationCoordinate2D(
            latitude: 1.287,
            longitude: 103.85172
        )
    ),
    Location(
        name: "National Museum of Singapore",
        coordinate: CLLocationCoordinate2D(
            latitude: 1.297,
            longitude: 103.84883
        )
    ),
    Location(
        name: "The Japanese Cemetery Park",
        coordinate: CLLocationCoordinate2D(
            latitude: 1.364,
            longitude: 103.87584
        )
    ),
    Location(
        name: "Dalhousie Obelisk",
        coordinate: CLLocationCoordinate2D(
            latitude: 1.287,
            longitude: 103.85238
        )
    ),
    Location(
        name: "Sir Stamford Raffles Statue",
        coordinate: CLLocationCoordinate2D(
            latitude: 1.288,
            longitude: 103.85084
        )
    ),
    Location(
        name: "Children’s Museum Singapore",
        coordinate: CLLocationCoordinate2D(
            latitude: 1.293,
            longitude: 103.8487
        )
    ),
    Location(
        name: "Old Ford Factory Singapore Museum",
        coordinate: CLLocationCoordinate2D(
            latitude: 1.352,
            longitude: 103.76883
        )
    ),
    Location(
        name: "Singapore Coins and Notes Museum",
        coordinate: CLLocationCoordinate2D(
            latitude: 1.283,
            longitude: 103.84452
        )
    ),
    Location(
        name: "Singapore City Gallery",
        coordinate: CLLocationCoordinate2D(
            latitude: 1.28,
            longitude: 103.84513
        )
    ),
    Location(
        name: "Changi Museum Singapore",
        coordinate: CLLocationCoordinate2D(
            latitude: 1.362,
            longitude: 103.97403
        )
    ),
    Location(
        name: "MINT Museum of Toys Singapore",
        coordinate: CLLocationCoordinate2D(
            latitude: 1.296,
            longitude: 103.85439
        )
    ),
    Location(
        name: "Lim Bo Seng Memorial",
        coordinate: CLLocationCoordinate2D(
            latitude: 1.288,
            longitude: 103.85303
        )
    ),
    Location(
        name: "Universal Studios Singapore",
        coordinate: CLLocationCoordinate2D(
            latitude: 1.254,
            longitude: 103.82381
        )
    ),
    Location(
        name: "Singapore Science Centre",
        coordinate: CLLocationCoordinate2D(
            latitude: 1.333,
            longitude: 103.73587
        )
    ),
    Location(
        name: "Fuk Tak Chi Museum & Places of Interest",
        coordinate: CLLocationCoordinate2D(
            latitude: 1.283,
            longitude: 103.84887
        )
    ),
    Location(
        name: "Katong Antique House Singapore",
        coordinate: CLLocationCoordinate2D(
            latitude: 1.307,
            longitude: 103.90714
        )
    ),
    Location(
        name: "Chinese Garden Singapore",
        coordinate: CLLocationCoordinate2D(
            latitude: 1.339,
            longitude: 103.73
        )
    ),
    Location(
        name: "East Coast Park Singapore",
        coordinate: CLLocationCoordinate2D(
            latitude: 1.301,
            longitude: 103.91219
        )
    ),
    Location(
        name: "Fort Canning Park",
        coordinate: CLLocationCoordinate2D(
            latitude: 1.295,
            longitude: 103.84651
        )
    ),
    Location(
        name: "Kusu Island",
        coordinate: CLLocationCoordinate2D(
            latitude: 1.223,
            longitude: 103.86052
        )
    ),
    Location(
        name: "HortPark, Singapore",
        coordinate: CLLocationCoordinate2D(
            latitude: 1.279,
            longitude: 103.79972
        )
    ),
    Location(
        name: "Adventure Cove Waterpark",
        coordinate: CLLocationCoordinate2D(
            latitude: 1.257,
            longitude: 103.81953
        )
    ),
    Location(
        name: "Lasalle College of the Arts",
        coordinate: CLLocationCoordinate2D(
            latitude: 1.303,
            longitude: 103.8516
        )
    ),
    Location(
        name: "Singapore River",
        coordinate: CLLocationCoordinate2D(
            latitude: 1.288,
            longitude: 103.84676
        )
    ),
    Location(
        name: "Singapore Peranakan Neighbourhood",
        coordinate: CLLocationCoordinate2D(
            latitude: 1.306,
            longitude: 103.90448
        )
    ),
    Location(
        name: "Sentosa Island",
        coordinate: CLLocationCoordinate2D(
            latitude: 1.249,
            longitude: 103.82809
        )
    ),
    Location(
        name: "Chinatown Singapore",
        coordinate: CLLocationCoordinate2D(
            latitude: 1.282,
            longitude: 103.84377
        )
    ),
    Location(
        name: "Buddha Tooth Relic Temple & Museum, Singapore",
        coordinate: CLLocationCoordinate2D(
            latitude: 1.282,
            longitude: 103.84438
        )
    ),
    Location(
        name: "Labrador Nature Reserve, Singapore",
        coordinate: CLLocationCoordinate2D(
            latitude: 1.266,
            longitude: 103.80194
        )
    ),
    Location(
        name: "Marina Bay Sands",
        coordinate: CLLocationCoordinate2D(
            latitude: 1.28,
            longitude: 103.85645
        )
    ),
    Location(
        name: "Chek Jawa, Pulau Ubin",
        coordinate: CLLocationCoordinate2D(
            latitude: 1.408,
            longitude: 103.96371
        )
    ),
    Location(
        name: "Merlion Park",
        coordinate: CLLocationCoordinate2D(
            latitude: 1.287,
            longitude: 103.85455
        )
    ),
    Location(
        name: "Marina Bay Sands SkyPark",
        coordinate: CLLocationCoordinate2D(
            latitude: 1.283,
            longitude: 103.86081
        )
    ),
    Location(
        name: "Resorts World Sentosa",
        coordinate: CLLocationCoordinate2D(
            latitude: 1.257,
            longitude: 103.82033
        )
    ),
    Location(
        name: "The Southern Ridges",
        coordinate: CLLocationCoordinate2D(
            latitude: 1.281,
            longitude: 103.81759
        )
    ),
    Location(
        name: "Sungei Buloh Wetland Reserve",
        coordinate: CLLocationCoordinate2D(
            latitude: 1.44699999964566,
            longitude: 103.730149000053999
        )
    ),
    Location(
        name: "S.E.A. Aquarium",
        coordinate: CLLocationCoordinate2D(
            latitude: 1.25700000023439,
            longitude: 103.819492999936003
        )
    ),
    Location(
        name: "Singapore Botanic Gardens",
        coordinate: CLLocationCoordinate2D(
            latitude: 1.31399999971771,
            longitude: 103.815914000380005
        )
    ),
    Location(
        name: "Singapore Zoo",
        coordinate: CLLocationCoordinate2D(
            latitude: 1.40400000006262,
            longitude: 103.793022999905006
        )
    ),
    Location(
        name: "River Wonders, Singapore",
        coordinate: CLLocationCoordinate2D(
            latitude: 1.40399999993071,
            longitude: 103.789422999620001
        )
    ),
    Location(
        name: "Cable Car Singapore & Mount Faber",
        coordinate: CLLocationCoordinate2D(
            latitude: 1.27099999983543,
            longitude: 103.819206000278001
        )
    ),
    Location(
        name: "Night Safari, Singapore",
        coordinate: CLLocationCoordinate2D(
            latitude: 1.40199999958714,
            longitude: 103.788061000135997
        )
    ),
    Location(
        name: "Pulau Ubin & Singapore Islands",
        coordinate: CLLocationCoordinate2D(
            latitude: 1.41399999977259,
            longitude: 103.959261000401995
        )
    ),
    Location(
        name: "Little India, Singapore",
        coordinate: CLLocationCoordinate2D(
            latitude: 1.30700000001345,
            longitude: 103.849820000248002
        )
    ),
    Location(
        name: "Orchard Road, Singapore",
        coordinate: CLLocationCoordinate2D(
            latitude: 1.30399999967044,
            longitude: 103.832489999885993
        )
    ),
    Location(
        name: "MacRitchie Singapore Nature Reserve",
        coordinate: CLLocationCoordinate2D(
            latitude: 1.34499999994054,
            longitude: 103.822346000248004
        )
    ),
    Location(
        name: "Gardens by the Bay Singapore",
        coordinate: CLLocationCoordinate2D(
            latitude: 1.28199999966925,
            longitude: 103.863612999588995
        )
    ),
    Location(
        name: "Civic District, Singapore",
        coordinate: CLLocationCoordinate2D(
            latitude: 1.29299999971177,
            longitude: 103.852220000030997
        )
    ),
    Location(
        name: "HarbourFront, Singapore",
        coordinate: CLLocationCoordinate2D(
            latitude: 1.26500000005246,
            longitude: 103.820570000177
        )
    ),
    Location(
        name: "Bras Basah.Bugis, Singapore Cultural District",
        coordinate: CLLocationCoordinate2D(
            latitude: 1.30099999961535,
            longitude: 103.856240000084
        )
    )
]
