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
        name: "Sri Mariamman Temple",
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
        name: "Raffles Hotel",
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
        name: "Merlion Park",
        coordinate: CLLocationCoordinate2D(
            latitude: 1.287,
            longitude: 103.85455
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
        name: "HarbourFront Centre, Singapore",
        coordinate: CLLocationCoordinate2D(
            latitude: 1.26500000005246,
            longitude: 103.820570000177
        )
    ),
    Location(
        name: "Bras Basah. Bugis, Singapore Cultural District",
        coordinate: CLLocationCoordinate2D(
            latitude: 1.30099999961535,
            longitude: 103.856240000084
        )
    ),
    Location(
        name: "East Coast Lagoon Food Village",
        coordinate: CLLocationCoordinate2D(
            latitude: 1.3069438107727314,
            longitude: 103.93496004030008
        )
    ),
    Location(
        name: "Mount Faber Park",
        coordinate: CLLocationCoordinate2D(
            latitude: 1.2718634725234674,
            longitude: 103.81922322407603
        )
    ),
    Location(
        name: "Kent Ridge Park",
        coordinate: CLLocationCoordinate2D(
            latitude: 1.283917377130876,
            longitude: 103.79127303756881
        )
    ),
    Location(
        name: "Maxwell Food Centre",
        coordinate: CLLocationCoordinate2D(
            latitude: 1.2803476281539212,
            longitude: 103.84470834592531
        )
    ),
    Location(
        name: "Rifle Range Nature Reserve",
        coordinate: CLLocationCoordinate2D(
            latitude: 1.343453346457944,
            longitude: 103.77940749748599
        )
    ),
    Location(
        name: "Upper Pierce Reservoir Park",
        coordinate: CLLocationCoordinate2D(
            latitude: 1.3731764182203636,
            longitude: 103.8119567841713
        )
    ),
    Location(
        name: "Bishan Ang Mo kio Park",
        coordinate: CLLocationCoordinate2D(
            latitude: 1.3634923620128285,
            longitude: 103.84325796312525
        )
    ),
    Location(
        name: "Bird Paradise",
        coordinate: CLLocationCoordinate2D(
            latitude: 1.4076044693496128,
            longitude: 103.7811726957048
        )
    ),
    Location(
        name: "Innovis",
        coordinate: CLLocationCoordinate2D(
            latitude: 1.2989909604748786,
            longitude: 103.78866410000002
        )
    ),
    Location(
        name: "NSRCC Kranji Golf Course",
        coordinate: CLLocationCoordinate2D(
            latitude: 1.4246628693727657,
            longitude: 103.72865184914738
        )
    ),
    Location(
        name: "Kranji Dam",
        coordinate: CLLocationCoordinate2D(
            latitude: 1.4387993895833529,
            longitude: 103.7369630106728
        )
    ),
    Location(
        name: "Admiralty Park",
        coordinate: CLLocationCoordinate2D(
            latitude: 1.4437068748172364,
            longitude: 103.78314435652887
        )
    ),
    Location(
        name: "Woodlands Jetty",
        coordinate: CLLocationCoordinate2D(
            latitude: 1.4528277214771579,
            longitude: 103.77850910613405
        )
    ),
    Location(
        name: "Chua Chu Kang Park",
        coordinate: CLLocationCoordinate2D(
            latitude: 1.3877585912634793,
            longitude: 103.74654046759579
        )
    ),
    Location(
        name: "Marsiling Park",
        coordinate: CLLocationCoordinate2D(
            latitude: 1.438540604719462,
            longitude: 103.77038736735895
        )
    ),
    Location(
        name: "Malta Crescent Bunker",
        coordinate: CLLocationCoordinate2D(
            latitude: 1.4590905994879693,
            longitude: 103.83524349153663
        )
    ),
    Location(
        name: "Sembawang Park",
        coordinate: CLLocationCoordinate2D(
            latitude: 1.4590683843872236,
            longitude: 103.83631163446506
        )
    ),
    Location(
        name: "Eagles Point",
        coordinate: CLLocationCoordinate2D(
            latitude: 1.4603995557105451,
            longitude: 103.8416550925268
        )
    ),
    Location(
        name: "Yishun Point",
        coordinate: CLLocationCoordinate2D(
            latitude: 1.4238213598215022,
            longitude: 103.86089100010147
        )
    ),
    Location(
        name: "Pasir Ris Beach",
        coordinate: CLLocationCoordinate2D(
            latitude: 1.38503263857209,
            longitude: 103.94553409151764
        )
    ),
    Location(
        name: "Pasir Ris Bird Watching Tower",
        coordinate: CLLocationCoordinate2D(
            latitude: 1.3787727353198869,
            longitude: 103.95276324255424
        )
    ),
    Location(
        name: "Changi Broadwalk",
        coordinate: CLLocationCoordinate2D(
            latitude: 1.391708215863051,
            longitude: 103.97589276156293
        )
    ),
    Location(
        name: "Changi Coastal Walk",
        coordinate: CLLocationCoordinate2D(
            latitude: 1.3902308379231318,
            longitude: 103.9883101117522
        )
    ),
    Location(
        name: "Changi Beach",
        coordinate: CLLocationCoordinate2D(
            latitude: 1.3871105480609822,
            longitude: 104.00016198821237
        )
    ),
    Location(
        name: "Changi Bay Point",
        coordinate: CLLocationCoordinate2D(
            latitude: 1.369826190741353,
            longitude: 104.01370385157549
        )
    ),
    Location(
        name: "NSRCC Beach",
        coordinate: CLLocationCoordinate2D(
            latitude: 1.3161390457366635,
            longitude: 103.97273038115324
        )
    ),
    Location(
        name: "East Coast Park Seafood Center",
        coordinate: CLLocationCoordinate2D(
            latitude: 1.3050923759848343,
            longitude: 103.93084817341354
        )
    ),
    Location(
        name: "Changi Jurassic Mile",
        coordinate: CLLocationCoordinate2D(
            latitude: 1.3349013114269468,
            longitude: 103.98354005712568
        )
    ),
    Location(
        name: "Tanah Merah Beach",
        coordinate: CLLocationCoordinate2D(
            latitude: 1.3169177255655427,
            longitude: 103.980636450302
        )
    ),
    Location(
        name: "Punggol Point Jetty",
        coordinate: CLLocationCoordinate2D(
            latitude: 1.4216023532101003,
            longitude: 103.91071971405133
        )
    ),
    Location(
        name: "Adventure Bridge",
        coordinate: CLLocationCoordinate2D(
            latitude: 1.4117818830544642,
            longitude: 103.90415090459612
        )
    ),
    Location(
        name: "Punggol Promenade Bridge",
        coordinate: CLLocationCoordinate2D(
            latitude: 1.4083752412155706,
            longitude: 103.91715364165536
        )
    ),
    Location(
        name: "Lorong Halus Jetty",
        coordinate: CLLocationCoordinate2D(
            latitude: 1.3981159185007876,
            longitude: 103.93240746818257
        )
    ),
    Location(
        name: "Serangoon East Dam",
        coordinate: CLLocationCoordinate2D(
            latitude: 1.400856907046413,
            longitude: 103.92959862761555
        )
    ),
    Location(
        name: "Coney Island",
        coordinate: CLLocationCoordinate2D(
            latitude: 1.4016322675266368,
            longitude: 103.92970782989418
        )
    ),
    Location(
        name: "SG Discovery Center",
        coordinate: CLLocationCoordinate2D(
            latitude: 1.3326337274438695,
            longitude: 103.67902439775115
        )
    ),
    Location(
        name: "Japanese Garden",
        coordinate: CLLocationCoordinate2D(
            latitude: 1.3350616177708585,
            longitude: 103.72906335715764
        )
    ),
    Location(
        name: "Lakeside Garden",
        coordinate: CLLocationCoordinate2D(
            latitude: 1.3401005272910254,
            longitude: 103.72487640208907
        )
    ),
    Location(
        name: "Yunnan Gardens",
        coordinate: CLLocationCoordinate2D(
            latitude: 1.3428897692621142,
            longitude: 103.68483062998378
        )
    ),
    Location(
        name: "Bukit Batok Nature Park Lookout Point",
        coordinate: CLLocationCoordinate2D(
            latitude: 1.3506636995824093,
            longitude: 103.76466335699536
        )
    ),
    Location(
        name: "Bukit Timah Hill",
        coordinate: CLLocationCoordinate2D(
            latitude: 1.3546424342222267,
            longitude: 103.77642057355165
        )
    ),
    Location(
        name: "National Stadium",
        coordinate: CLLocationCoordinate2D(
            latitude: 1.3050818258288195,
            longitude: 103.87682095070915
        )
    ),
    Location(
        name: "Mandai Trail",
        coordinate: CLLocationCoordinate2D(
            latitude: 1.3980423027463722,
            longitude: 103.77495012990076
        )
    ),
    Location(
        name: "Downtown East",
        coordinate: CLLocationCoordinate2D(
            latitude: 1.3774022528338536,
            longitude: 103.95516961102548
        )
    ),
    Location(
        name: "Pasir Ris Park",
        coordinate: CLLocationCoordinate2D(
            latitude: 1.3813058897285426,
            longitude: 103.95039143091012
        )
    ),
    Location(
        name: "Expo",
        coordinate: CLLocationCoordinate2D(
            latitude: 1.334885395386975,
            longitude: 103.9579298911414
        )
    ),
    Location(
        name: "Keppel Hill Bunker",
        coordinate: CLLocationCoordinate2D(
            latitude: 1.2709643581063408,
            longitude: 103.81583960171925
        )
    ),
    Location(
        name: "Ice Cream Museum",
        coordinate: CLLocationCoordinate2D(
            latitude: 1.3027230759745831,
            longitude: 103.81246286463325
        )
    ),
    Location(
        name: "Lee Kong Chian Natural History Museum",
        coordinate: CLLocationCoordinate2D(
            latitude: 1.3014009985124682,
            longitude: 103.7736565766955
        )
    ),
    Location(
        name: "Singapore Air Force Museum",
        coordinate: CLLocationCoordinate2D(
            latitude: 1.3467374953155573,
            longitude: 103.89939300049218
        )
    ),
    Location(
        name: "Singaore Navy Museum",
        coordinate: CLLocationCoordinate2D(
            latitude: 1.3167957921088542,
            longitude: 104.0163259707711
        )
    ),
    Location(
        name: "Sentosa Cove",
        coordinate: CLLocationCoordinate2D(
            latitude: 1.2451367613283078,
            longitude: 103.8401461507898
        )
    ),
    Location(
        name: "Tanjong Beach",
        coordinate: CLLocationCoordinate2D(
            latitude: 1.2416481687005276,
            longitude: 103.82936782717309
        )
    ),
    
    Location(
        name: "Palawan Beach",
        coordinate: CLLocationCoordinate2D(
            latitude: 1.247905,
            longitude: 103.823387
        )
    ),
    
    Location(
        name: "Haji Lane",
        coordinate: CLLocationCoordinate2D(
            latitude: 1.300729,
            longitude: 103.859140
        )
    ),
    
    Location(
        name: "Joo Chiat Peranakan Shophouses",
        coordinate: CLLocationCoordinate2D(
            latitude: 1.3105142370645813,
            longitude: 103.90292340494457
        )
    ),
        
    Location(
        name: "One Holland V",
        coordinate: CLLocationCoordinate2D(
            latitude: 1.311707018313559,
            longitude: 103.79446861375109
        )
    ),
    Location(
        name: "Lower Seletar Resevoir Park", 
        coordinate: CLLocationCoordinate2D (
            latitude: 1.4100963736993735,
            longitude: 103.83210913998103) )
]
