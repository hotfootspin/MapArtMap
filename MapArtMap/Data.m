//
//  Data.m
//  MapArtMap
//
//  Created by Mark Brautigam on 4/17/14.
//  Copyright (c) 2014 Mark Brautigam. All rights reserved.
//

#import "Data.h"
#import "Map.h"

@implementation Data

// static Data* sharedInstance = nil;

- (instancetype)init
{
    self = [super init];
    if (self) {
        
        if (maps == nil) {
            maps = [NSMutableArray arrayWithCapacity:100];
            NSString * strMap;
            
            strMap = @"alaska.png|Alaska|Mendenhall Glacier|Chevron|1953|58.416626|-134.547152|";
            [maps addObject:[self strToMap:strMap]];
            strMap = @"albuquerque.png|Albuquerque|San Felipe de Neri Church|Chevron|1959|35.096598|-106.669963|";
            [maps addObject:[self strToMap:strMap]];
            strMap = @"az_picacho.png|Arizona|Picacho Peak|Chevron|1956|32.635068|-111.40067|";
            [maps addObject:[self strToMap:strMap]];
            strMap = @"aznm.png|Arizona-New Mexico|Carlsbad Caverns|Chevron|1949|32.147855|-104.556714|";
            [maps addObject:[self strToMap:strMap]];
            strMap = @"ENCO_aznm_oak.png|Arizona-New Mexico|Oak Creek Canyon, near Sedona, Ariz.|Enco|1962|34.9125169|-111.7268235|";
            [maps addObject:[self strToMap:strMap]];
            strMap = @"SO_ark_teche.png|Arkansas-Louisiana-Mississippi|Bayou Teche|Esso|1960|30.055028|-91.819796|The Bayou Teche, near St. Martinsville, LA";
            [maps addObject:[self strToMap:strMap]];
            strMap = @"SH_atlanta.png|Atlanta|City Underground|Shell|1973|33.751402|-84.389576|";
            [maps addObject:[self strToMap:strMap]];
            strMap = @"SO_boston_fan.png|Boston|Faneuil Hall|Esso|1958|42.360062|-71.056103|";
            [maps addObject:[self strToMap:strMap]];
            strMap = @"bc_yoho.png|British Columbia|Yoho National Park|Chevron|1962|51.466667|-116.583333|";
            [maps addObject:[self strToMap:strMap]];
            strMap = @"calif_redwoods.png|California|Coast Redwoods|Chevron|1950|41.213179|-124.004628|";
            [maps addObject:[self strToMap:strMap]];
            strMap = @"SH_calif.png|Caliofrnia|Vineyards in the Napa Valley|Shell|1973|38.4298199|-122.4208311|";
            [maps addObject:[self strToMap:strMap]];
            strMap = @"colorado.png|Colorado|Rocky Mountain National Park|Chevron|1950|40.342793|-105.683639|";
            [maps addObject:[self strToMap:strMap]];
            strMap = @"SO_del_harper.png|Delaware-Maryland-Virginia|Harpers Ferry, West Virginia|Esso|1949|39.325379|-77.738882|";
            [maps addObject:[self strToMap:strMap]];
            strMap = @"SO_del_zwaan.png|Delaware-Maryland-Virginia|Zwaanendael House, Lewes, Del.|Esso|1951|38.773922|-75.139138|";
            [maps addObject:[self strToMap:strMap]];
            strMap = @"del_williamsburg.png|Delaware-Maryland-Virginia|Williamsburg, Virginia|Calso|1953|37.270702|-76.707457|";
            [maps addObject:[self strToMap:strMap]];
            strMap = @"del_nat_bridge.png|Delaware-Maryland-Virginia|Natural Bridge, Virginia|Calso|1957|37.628621|-79.543762|";
            [maps addObject:[self strToMap:strMap]];
            strMap = @"SH_del_bridge.png|Delaware-Maryland-Virginia|The Natural Bridge in Virginia|Shell|1974|37.62|-79.54|";
            [maps addObject:[self strToMap:strMap]];
            strMap = @"eastbay_uc.png|East Bay Cities|Campanile, University of California|Chevron|1949|37.8720616|-122.2578123|";
            [maps addObject:[self strToMap:strMap]];
            strMap = @"eastbay_merritt_ch.png|East Bay Cities|Lake Merritt|Chevron|1952|37.801239|-122.258299|";
            [maps addObject:[self strToMap:strMap]];
            strMap = @"elpaso.png|El Paso|El Paso Skyline|Chevron|1957|31.769956|-106.496806|";
            [maps addObject:[self strToMap:strMap]];
            strMap = @"KY_fl_wakulla.png|Florida|Wakulla Springs, near Tallahassee|Kyso|1950|30.234974|-84.297584|";
            [maps addObject:[self strToMap:strMap]];
            strMap = @"SH_florida.png|Florida|The Everglades National Park|Shell|1973|25.286616|-80.898651|";
            [maps addObject:[self strToMap:strMap]];
            strMap = @"KY_gall_okef_49.png|Georgia-Alabama|Okefenokee Swamp Park|Kyso|1949|31.05|-82.26|Okefenokee Swamp Park, near Waycross, Ga.";
            [maps addObject:[self strToMap:strMap]];
            strMap = @"KY_gaal_ave_maria.png|Georgia-Alabama|Ave Maria Grotto|Kyso|1958|34.174117|-86.813697|Scenic walk in missions section, Ave Maria Grotto, Cullman, Ala.";
            [maps addObject:[self strToMap:strMap]];
            strMap = @"KY_gaal_okef.png|Georgia-Alabama|Okefenokee Swamp Park|Kyso|1961|31.057304|-82.272379|Okefenokee Swamp Park, near Waycross, Ga.";
            [maps addObject:[self strToMap:strMap]];
            strMap = @"hawaii.png|Hawaii|Diamond Head|Chevron|1955|21.263798|-157.804094|";
            [maps addObject:[self strToMap:strMap]];
            strMap = @"SH_hawaii.png|Hawaii|Volcanic Mountains|Shell|1973|19.383333|-155.2|";
            [maps addObject:[self strToMap:strMap]];
            strMap = @"SH_idaho_montana.png|Idaho-Montana|Mountains reflected in a wilderness lake|Shell|1973|45.1307841|-115.0583204|";
            [maps addObject:[self strToMap:strMap]];
            strMap = @"SH_indy.png|Indianapolis|Indianapolis 500 Speedway|Shell|1973|39.795354|-86.235301|";
            [maps addObject:[self strToMap:strMap]];
            strMap = @"KY_kytn_mammoth.png|Kentucky-Tennessee|Mammoth Cave National Park|Kyso|1958|37.186998|-86.100528|Boat ride on underground lake, Mammoth Cave National Park, Cave City, Ky.";
            [maps addObject:[self strToMap:strMap]];
            strMap = @"KY_kytn_bridge.png|Kentucky-Tennessee|Natural Bridge State Park|Kyso|1953|37.77419|-83.685381|Massive stone arch at scenic Natural Bridge State Park near Slade, Kentucky.";
            [maps addObject:[self strToMap:strMap]];
            strMap = @"longbeach_motor.png|Long Beach|Speedboat|Chevron|1959|33.76|-118.19|";
            [maps addObject:[self strToMap:strMap]];
            strMap = @"longbeach_sail.png|Long Beach|Sailboat|Chevron|1963|33.755|-118.18|";
            [maps addObject:[self strToMap:strMap]];
            strMap = @"la_westlake.png|Los Angeles|Westlake Park|Chevron|1951|34.060336|-118.278358|";
            [maps addObject:[self strToMap:strMap]];
            strMap = @"la_mission.png|Los Angeles|Mission San Gabriel|Chevron|1953|34.097147|-118.107759|";
            [maps addObject:[self strToMap:strMap]];
            strMap = @"la_grif.png|Los Angeles|Griffith Observatory|Chevron|1960|34.118434|-118.300394|";
            [maps addObject:[self strToMap:strMap]];
            strMap = @"la_poly.png|Los Angeles County|Arabian Horses, California State Polytechnic College|Chevron|1961|34.05932|-117.819462|";
            [maps addObject:[self strToMap:strMap]];
            strMap = @"maine_acadia.png|Maine|Acadia National Park|Calso|1951|44.338556|-68.273335|";
            [maps addObject:[self strToMap:strMap]];
            strMap = @"maine_portland.png|Maine-New Hampshire-Vermont|Portland Light|Calso|1950|43.623038|-70.208183|";
            [maps addObject:[self strToMap:strMap]];
            strMap = @"mass_glouc.png|Massachusetts-Connecticut-Rhode Island|Gloucester|Calso|1954|42.6310145|-70.6876914|";
            [maps addObject:[self strToMap:strMap]];
            strMap = @"mass_berk.png|Massachusetts-Connecticut-Rhode Island|Autumn in the Berkshires|Calso|1957|42.3473084|-73.3092742|";
            [maps addObject:[self strToMap:strMap]];
            strMap = @"SH_milwaukee.png|Milwaukee|Old Milwaukee Days Circus Parade|Shell|1973|43.045|-87.89|";
            [maps addObject:[self strToMap:strMap]];
            strMap = @"SH_minneapolis.png|Minneapolis|Minnehaha Falls|Shell|1973|44.915223|-93.209741|";
            [maps addObject:[self strToMap:strMap]];
            strMap = @"KY_miss_holly.png|Mississippi-Arkansas-Louisiana|Holly Bluff Gardens|Kyso|1957|30.39|-89.44|Holly Bluff Gardens on-the-Jordan, Bay St. Louis, Miss.";
            [maps addObject:[self strToMap:strMap]];
            strMap = @"SH_missouri.png|Missouri|Hogdson Mill in Sycamore|Shell|1973|36.7029462|-92.2744974|";
            [maps addObject:[self strToMap:strMap]];
            strMap = @"montana.png|Montana|St. Mary Lake, Glacier National Park|Chevron|1949|48.7140714|-113.4876451|";
            [maps addObject:[self strToMap:strMap]];
            strMap = @"nebraska.png|Nebraska|Scotts Bluff National Park|Chevron|1949|41.83168|-103.716122|";
            [maps addObject:[self strToMap:strMap]];
            strMap = @"nevada_tahoe.png|Nevada|Lake Tahoe|Chevron|1956|39.096849|-120.032351|";
            [maps addObject:[self strToMap:strMap]];
            strMap = @"SO_ne_wiscasset.png|New England|Main Street, Wiscasset, Maine|Esso|1950|44.0028346|-69.6659444|";
            [maps addObject:[self strToMap:strMap]];
            strMap = @"SO_ne_public.png|New England|The Public Gardens, Boston, Mass.|Esso|1959|42.356294|-71.065123|";
            [maps addObject:[self strToMap:strMap]];
            strMap = @"nhvt_river.png|New Hampshire-Vermont|Connecticut River|Calso|1954|43.234444|-72.433|";
            [maps addObject:[self strToMap:strMap]];
            strMap = @"nhvt_maple.png|New Hampshire-Vermont|Maple Syrup Time|Calso|1958|44.558803|-72.577841|";
            [maps addObject:[self strToMap:strMap]];
            strMap = @"nj_gap.png|New Jersey|Delaware Water Gap|Calso|1949|40.967596|-75.122122|";
            [maps addObject:[self strToMap:strMap]];
            strMap = @"nj_atlantic.png|New Jersey|Atlantic City|Calso|1953|39.364283|-74.422927|";
            [maps addObject:[self strToMap:strMap]];
            strMap = @"newmex_taos.png|New Mexico|Taos Pueblo|Chevron|1953|36.438179|-105.547389|";
            [maps addObject:[self strToMap:strMap]];
            strMap = @"ny_niagara.png|New York|Niagara Falls|Calso|1949|43.079|-79.076|";
            [maps addObject:[self strToMap:strMap]];
            strMap = @"ny_taugh.png|New York|Taughannock Falls State Park|Calso|1950|42.536133|-76.61156|";
            [maps addObject:[self strToMap:strMap]];
            strMap = @"ny_liberty.png|New York|Statue of Liberty|Calso|1953|40.689249|-74.0445|";
            [maps addObject:[self strToMap:strMap]];
            strMap = @"SO_ny_canyon.png|New York|Letchworth State Park|Esso|1956|42.62917|-77.978838|Grand Canyon of the East, Letchworth State Park";
            [maps addObject:[self strToMap:strMap]];
            strMap = @"SH_ny.png|New York|Niagara Falls|Shell|1973|43.085|-79.07|";
            [maps addObject:[self strToMap:strMap]];
            strMap = @"SO_nyc_evening.png|New York City|Evening, Lower Manhattan|Esso|1950|40.71|-74.009|";
            [maps addObject:[self strToMap:strMap]];
            strMap = @"nyc_towers.png|New York City|Towers of Manhattan|Calso|1956|40.748496|-73.985596|";
            [maps addObject:[self strToMap:strMap]];
            strMap = @"SH_ny_metro.png|New York Metro|Lower Manhattan|Shell|1972|40.7214947|-73.9954898|";
            [maps addObject:[self strToMap:strMap]];
            strMap = @"SO_NS_Carolina_swan.png|North and South Carolina|Swan Lake Gardens, near Sumter, S.C.|Esso|1957|33.921075|-80.369231|";
            [maps addObject:[self strToMap:strMap]];
            strMap = @"SO_NS_Carolina_biltmore.png|North and South Carolina|Biltmore Estate, Asheville, N.C.|Esso|1958|35.540566|-82.55232|";
            [maps addObject:[self strToMap:strMap]];
            strMap = @"SH_NSCarolina.png|North and South Carolina|Tweetsie Railroad|Shell|1973|36.169528|-81.646689|The Tweetsie Railroad in the mountain region";
            [maps addObject:[self strToMap:strMap]];
            strMap = @"ns_dakota.png|North and South Dakota|Mt. Rushmore|Chevron|1953|43.879102|-103.459067|";
            [maps addObject:[self strToMap:strMap]];
            strMap = @"northeast.png|Northeastern United States|Great Lakes|Calso|1955|47.723087|-86.940716|";
            [maps addObject:[self strToMap:strMap]];
            strMap = @"SH_oakland.png|Oakland and East Bay Cities|Bay Bridge in the Evening|Shell|1972|37.802|-122.374|";
            [maps addObject:[self strToMap:strMap]];
            strMap = @"SH_oc_disney.png|Orange County|Disneyland|Shell|1972|33.810486|-117.919|";
            [maps addObject:[self strToMap:strMap]];
            strMap = @"penn_indep.png|Pennsylvania|Independence Hall|Calso|1951|39.948837|-75.149995|";
            [maps addObject:[self strToMap:strMap]];
            strMap = @"penn_forge.png|Pennsylvania|Washington's Headquarters, Valley Forge|Calso|1954|40.100489|-75.444624|";
            [maps addObject:[self strToMap:strMap]];
            strMap = @"SO_penn_indep.png|Pennsylvania|Independence Hall, Philadelphia|Esso|1956|39.948|-75.15|";
            [maps addObject:[self strToMap:strMap]];
            strMap = @"portland_rose.png|Portland|Rose Test Garden, Washington Park|Chevron|1954|45.515427|-122.710243|";
            [maps addObject:[self strToMap:strMap]];
            strMap = @"portland_hood.png|Portland|View of Mount Hood in the Evening|Chevron|1961|45.373444|-121.695662|";
            [maps addObject:[self strToMap:strMap]];
            strMap = @"slc.png|Salt Lake City|Mormon Temple|Chevron|1952|40.71258|-111.901814|";
            [maps addObject:[self strToMap:strMap]];
            strMap = @"sd_tower.png|San Diego|California Tower, Balboa Park|Chevron|1950|32.731431|-117.152374|";
            [maps addObject:[self strToMap:strMap]];
            strMap = @"sd_fine.png|San Diego|Fine Arts Palace, Balboa Park|Chevron|1952|32.732158|-117.150431|";
            [maps addObject:[self strToMap:strMap]];
            strMap = @"sd_cons.png|San Diego|Conservatory, Balboa Park|Chevron|1953|32.7318549|-117.1465514|";
            [maps addObject:[self strToMap:strMap]];
            strMap = @"sd_balboa.png|San Diego|Balboa Park|Chevron|1956|32.734148|-117.144553|";
            [maps addObject:[self strToMap:strMap]];
            strMap = @"san_fern.png|San Fernando Valley|San Fernando Mission|Chevron|1959|34.273207|-118.461247|";
            [maps addObject:[self strToMap:strMap]];
            strMap = @"SH_san_fern.png|San Fernando Valley|Orange Groves|Shell|1972|34.236412|-118.526171|";
            [maps addObject:[self strToMap:strMap]];
            strMap = @"sf_baybridge.png|San Francisco|San Francisco-Oakland Bay Bridge|Chevron|1949|37.79822|-122.377738|";
            [maps addObject:[self strToMap:strMap]];
            strMap = @"sf_cable.png|San Francisco|California Street Cable Car|Chevron|1950|37.7916|-122.4111|";
            [maps addObject:[self strToMap:strMap]];
            strMap = @"sf_gg.png|San Francisco|Golden Gate Bridge|Chevron|1951|37.81992|-122.478907|";
            [maps addObject:[self strToMap:strMap]];
            strMap = @"sf_wharf.png|San Francisco|Fisherman's Wharf|Chevron|1952|37.808|-122.417743|";
            [maps addObject:[self strToMap:strMap]];
            strMap = @"SH_sf_cable.png|San Francisco|Cable Car|Shell|1972|37.7948128|-122.4119646|";
            [maps addObject:[self strToMap:strMap]];
            strMap = @"sf_peninsula.png|San Francisco Peninsula|Stanford University Chapel|Chevron|1961|37.423104|-122.163433|";
            [maps addObject:[self strToMap:strMap]];
            strMap = @"sanjose.png|San Jose|Santa Clara Mission|Chevron|1954|37.363505|-121.97066|";
            [maps addObject:[self strToMap:strMap]];
            strMap = @"santa_barbara.png|Santa Barbara|Santa Barbara Mission|Chevron|1965|34.438019|-119.713517|";
            [maps addObject:[self strToMap:strMap]];
            strMap = @"seattle_lake.png|Seattle|Lake Washington|Chevron|1958|47.621547|-122.255756|";
            [maps addObject:[self strToMap:strMap]];
            strMap = @"seattle_needle.png|Seattle|Space Needle|Chevron|1962|47.620467|-122.349116|";
            [maps addObject:[self strToMap:strMap]];
            strMap = @"seatac_puget.png|Seattle-Tacoma|Puget Sound|Chevron|1951|47.723654|-122.471335|";
            [maps addObject:[self strToMap:strMap]];
            strMap = @"SH_st_Louis.png|St. Louis|Gateway to the West Arch|Shell|1973|38.624692|-90.184774|";
            [maps addObject:[self strToMap:strMap]];
            strMap = @"stockton.png|Stockton|University of the Pacific|Chevron|1964|37.98066|-121.30761|";
            [maps addObject:[self strToMap:strMap]];
            strMap = @"tacoma.png|Tacoma|The Narrows Bridge|Chevron|1958|47.268985|-122.551657|";
            [maps addObject:[self strToMap:strMap]];
            strMap = @"SO_tnky_incline_2.png|Tennessee-Kentucky|Lookout Mountain Incline Railway|Esso|1957|35.009606|-85.328261|Lookout Mountain Incline Railway, Chattanooga, Tenn.";
            [maps addObject:[self strToMap:strMap]];
            strMap = @"SO_tnky_cades.png|Tennessee-Kentucky|Cades Cove in Great Smoky Mountains National Park|Esso|1964|35.5942533|-83.8418427|Cable Mill, Cades Cove, Great Smoky Mountains National Park, near Gatlinburg, Tenn.";
            [maps addObject:[self strToMap:strMap]];
            strMap = @"texas.png|Texas|Big Bend National Park|Chevron|1950|29.127487|-103.242538|";
            [maps addObject:[self strToMap:strMap]];
            strMap = @"tucson.png|Tucson|Mission San Xavier del Bac|Chevron|1963|32.107162|-111.007868|";
            [maps addObject:[self strToMap:strMap]];
            strMap = @"Utah_official.png|Utah|Colorful Bryce Canyon|Official|1952|37.6|-112.2|";
            [maps addObject:[self strToMap:strMap]];
            strMap = @"utah_bryce.png|Utah|Bryce Canyon|Chevron|1956|37.593038|-112.18709|";
            [maps addObject:[self strToMap:strMap]];
            strMap = @"utah_arch.png|Utah|Arches National Monument|Chevron|1960|38.733081|-109.592514|";
            [maps addObject:[self strToMap:strMap]];
            strMap = @"Vancouver_Double.png|Vancouver|Capilano Canyon Bridge|Chevron|1951|49.342758|-123.114562|";
            [maps addObject:[self strToMap:strMap]];
            strMap = @"Victoria_Double.png|Victoria|View from Malahat Drive|Chevron|1951|48.5468994|-123.5145634|";
            [maps addObject:[self strToMap:strMap]];
            strMap = @"SH_wash.png|Washington|Mount Shuskan|Shell|1974|48.830958|-121.602917|";
            [maps addObject:[self strToMap:strMap]];
            strMap = @"wash_snoq.png|Washington|Snoqualmie Falls|Chevron|1961|47.542078|-121.836472|";
            [maps addObject:[self strToMap:strMap]];
            strMap = @"SO_wash_smith.png|Washington DC|Smithsonian Institution|Esso|1958|38.888786|-77.026023|";
            [maps addObject:[self strToMap:strMap]];
            strMap = @"SH_wash_capitol.png|Washington DC|Capitol Building|Shell|1972|38.889939|-77.00905|";
            [maps addObject:[self strToMap:strMap]];
            strMap = @"GULF_wash_capitol.png|Washington DC|Capitol Building|Gulf|1967|38.891|-77.011|";
            [maps addObject:[self strToMap:strMap]];
            strMap = @"western_timp.png|Western United States|Mount Timpanogos|Chevron|1956|40.390787|-111.645755|";
            [maps addObject:[self strToMap:strMap]];
            strMap = @"western_gc.png|Western United States|Grand Canyon|Chevron|1958|36.231719|-113.030911|";
            [maps addObject:[self strToMap:strMap]];
            strMap = @"wyoming.png|Wyoming|Yellowstone Falls|Chevron|1949|44.712681|-110.500124|";
            [maps addObject:[self strToMap:strMap]];
            
            // These maps added Friday 5-9-14
            // We can no longer put them in the above list because of the assigned ID's.
            //
            strMap = @"oklahoma.png|Oklahoma|Will Rogers Memorial|Chevron|1961|36.321081|-95.631427|";
            [maps addObject:[self strToMap:strMap]];
            strMap = @"SH_cleveland.png|Cleveland|Terminal Tower|Shell|1974|41.498382|-81.694053|";
            [maps addObject:[self strToMap:strMap]];
            strMap = @"SH_dallas.png|Dallas|Dallas Downtown Night Skyline|Shell|1972|32.78014|-96.800451|";
            [maps addObject:[self strToMap:strMap]];
            strMap = @"SH_detroit.png|Detroit|Downtown Detroit|Shell|1972|42.331427|-83.045754|";
            [maps addObject:[self strToMap:strMap]];
            strMap = @"SH_houston.png|Houston|Houston Downtown Skyline with One Shell Plaza|Shell|1972|29.759042|-95.36753|";
            [maps addObject:[self strToMap:strMap]];
            strMap = @"SH_iowa.png|Iowa|Rodeo of Sydney|Shell|1974|40.748334|-95.647496|";
            [maps addObject:[self strToMap:strMap]];
            strMap = @"SH_longbeach.png|Long Beach|Sailboats in harbor|Shell|1972|33.745|-118.16|";
            [maps addObject:[self strToMap:strMap]];
            strMap = @"SH_maine_nh_vt.png|Maine-New Hampshire-Vermont|Rural chapel amid Fall foliage|Shell|1974|44.0012306|-71.5799231|";
            [maps addObject:[self strToMap:strMap]];
            strMap = @"SH_oklahoma.png|Oklahoma|Buffalo grazing on the Oklahoma plains|Shell|1973|35.007752|-97.092877|";
            [maps addObject:[self strToMap:strMap]];
            strMap = @"SH_oregon.png|Oregon|Bear Lake in the Wallowa Mountains|Shell|1973|45.2954351|-117.4490288|";
            [maps addObject:[self strToMap:strMap]];
            strMap = @"SH_tampa.png|Tampa-St. Petersburg|Gasparilla Pirate Festival|Shell|1972|27.948825|-82.461567|";
            [maps addObject:[self strToMap:strMap]];
            strMap = @"westcan_maligne.png|Western Canada|Maligne Lake, Jasper Park|Chevron|1952|52.6612594|-117.5265544|";
            [maps addObject:[self strToMap:strMap]];
            
            // Added Tue-Wed May 13-14, 2014
            //
            strMap = @"az-01-saguaro.png|Arizona|Giant Saguaro Cactus|Chevron|1948|32.27556|-111.23192|";
            [maps addObject:[self strToMap:strMap]];
            strMap = @"az-02.png|Arizona|Chiricahua National Monument|Chevron|1950|32.002225|-109.342631|";
            [maps addObject:[self strToMap:strMap]];
            strMap = @"az-03-sfpeaks.png|Arizona|San Francisco Peaks|Chevron|1953|35.346709|-111.678085|";
            [maps addObject:[self strToMap:strMap]];
            strMap = @"az-04-cheilly.png|Arizona|Canyon de Chelly|Chevron|1951|36.133611|-109.469444|";
            [maps addObject:[self strToMap:strMap]];
            strMap = @"az-05-oakcreek.png|Arizona|Oak Creek Canyon|Chevron|1952|34.9025169|-111.7278235|";
            [maps addObject:[self strToMap:strMap]];
            strMap = @"az-06-saguaronm.gif|Arizona|Saguaro National Monument|Chevron|1954|32.27556|-111.18192|";
            [maps addObject:[self strToMap:strMap]];
            strMap = @"az-07-montezuma.png|Arizona|Montezuma Castle|Chevron|1957|34.611576|-111.834985|";
            [maps addObject:[self strToMap:strMap]];
            strMap = @"az-08-canyonlake.png|Arizona|Canyon Lake|Chevron|1959|33.542212|-111.436532|";
            [maps addObject:[self strToMap:strMap]];
            strMap = @"ca-01-kings.png|California|Kings Canyon National Park|Chevron|1948|36.486367|-118.565752|";
            [maps addObject:[self strToMap:strMap]];
            strMap = @"ca-02-halfdome.gif|California|Yosemite National Park (Half Dome)|Chevron|1949|37.746495|-119.533228|";
            [maps addObject:[self strToMap:strMap]];
            strMap = @"ca-03-capitan.png|California|El Capitan, Yosemite National Park|Chevron|1954|37.734189|-119.637436|";
            [maps addObject:[self strToMap:strMap]];
            strMap = @"ca-04-lobos.png|California|Point Lobos State Park|Chevron|1951|36.51584|-121.941065|";
            [maps addObject:[self strToMap:strMap]];
            strMap = @"ca-05-poppies.png|California|California Poppies|Chevron|1952|34.734904|-118.39601|";
            [maps addObject:[self strToMap:strMap]];
            strMap = @"ca-06-burney.png|California|Burney Falls|Chevron|1953|41.013796|-121.649362|";
            [maps addObject:[self strToMap:strMap]];
            strMap = @"ca-07-vernal.png|California|Vernal Falls, Yosemite|Chevron|1956|37.839995|-119.540956|";
            [maps addObject:[self strToMap:strMap]];
            strMap = @"ca-08-shasta.png|California|Mount Shasta|Chevron|1958|41.309875|-122.310567|";
            [maps addObject:[self strToMap:strMap]];
            strMap = @"ca-09-redwoods.png|California|In the Redwoods|Chevron|1960|41.402|-124.042434|";
            [maps addObject:[self strToMap:strMap]];
            strMap = @"id-01.png|Idaho|Boulder Peak|Chevron|1948|43.832686|-114.518114|";
            [maps addObject:[self strToMap:strMap]];
            strMap = @"id-02.png|Idaho|Pend Oreille Lake|Chevron|1949|48.140045|-116.405722|";
            [maps addObject:[self strToMap:strMap]];
            strMap = @"id-03.png|Idaho|Stanley Lake, Sawtooth Mountains|Chevron|1950|44.245518|-115.062424|";
            [maps addObject:[self strToMap:strMap]];
            strMap = @"id-04-cabinet.png|Idaho|Cabinet Gorge|Chevron|1951|48.086667|-116.064444|";
            [maps addObject:[self strToMap:strMap]];
            strMap = @"id-05-sawtooth.png|Idaho|Sawtooth Mountains|Chevron|1952|43.953237|-114.990634|";
            [maps addObject:[self strToMap:strMap]];
            strMap = @"id-06-joe.png|Idaho|St. Joe River|Chevron|1953|47.393056|-116.754167|";
            [maps addObject:[self strToMap:strMap]];
            strMap = @"id-07-chimney.png|Idaho|Chimney Rock|Chevron|1954|45.301848|-115.77818|";
            [maps addObject:[self strToMap:strMap]];
            strMap = @"id-08-mesa.gif|Idaho|Upper Mesa Falls|Chevron|1956|44.187693|-111.327907|";
            [maps addObject:[self strToMap:strMap]];
            strMap = @"id-09-stanley.png|Idaho|Stanley Lake|Chevron|1960|44.248518|-115.053424|";
            [maps addObject:[self strToMap:strMap]];
            strMap = @"nv-01.png|Nevada|Pyramid Lake|Chevron|1948|40.012933|-119.557168|";
            [maps addObject:[self strToMap:strMap]];
            strMap = @"nv-02.png|Nevada|Cathedral Gorge State Park|Chevron|1949|37.828157|-114.41822|";
            [maps addObject:[self strToMap:strMap]];
            strMap = @"nv-03.png|Nevada|The Temple, Lake Mead|Chevron|1950|36.177146|-114.417332|";
            [maps addObject:[self strToMap:strMap]];
            strMap = @"nv-04-elephant.png|Nevada|Elephant Rock, Valley of Fire|Chevron|1951|36.429747|-114.515319|";
            [maps addObject:[self strToMap:strMap]];
            strMap = @"nv-05-forest.png|Nevada|In Nevada National Forest|Chevron|1952|38.985407|-117.388381|";
            [maps addObject:[self strToMap:strMap]];
            strMap = @"nv-06-ruby.png|Nevada|In the Ruby Mountains|Chevron|1954|40.479289|-115.473437|";
            [maps addObject:[self strToMap:strMap]];
            strMap = @"nv-07-charleston.png|Nevada|Charleston Peak Area|Chevron|1959|36.272185|-115.695019|";
            [maps addObject:[self strToMap:strMap]];
            strMap = @"or-00.png|Oregon|Mount Hood|Chevron|1948|45.333444|-121.715662|";
            [maps addObject:[self strToMap:strMap]];
            strMap = @"or-01-crater.png|Oregon|Crater Lake|Chevron|1949|42.868441|-122.168478|";
            [maps addObject:[self strToMap:strMap]];
            strMap = @"or-02.png|Oregon|Wallowa Mountains|Chevron|1950|45.162335|-117.306154|";
            [maps addObject:[self strToMap:strMap]];
            strMap = @"or-03-mck.png|Oregon|McKenzie River|Chevron|1951|44.12568|-123.105644|";
            [maps addObject:[self strToMap:strMap]];
            strMap = @"or-04-diamond.png|Oregon|Diamond Lake|Chevron|1952|43.173696|-122.152147|";
            [maps addObject:[self strToMap:strMap]];
            strMap = @"or-05-coast.png|Oregon|Oregon Coast|Chevron|1957|43.6618699|-124.2082577|";
            [maps addObject:[self strToMap:strMap]];
            strMap = @"or-06-multnomah.png|Oregon|Multnomah Falls|Chevron|1954|45.57616|-122.115776|";
            [maps addObject:[self strToMap:strMap]];
            strMap = @"or-07-wallowa.png|Oregon|Wallowa Lake|Chevron|1959|45.311753|-117.209562|";
            [maps addObject:[self strToMap:strMap]];
            strMap = @"ut-01-throne.png|Utah|Great White Throne, Zion National Park|Chevron|1948|37.259722|-112.940833|";
            [maps addObject:[self strToMap:strMap]];
            strMap = @"ut-02-rainbow.png|Utah|Rainbow Bridge National Monument|Chevron|1950|37.077431|-110.964292|";
            [maps addObject:[self strToMap:strMap]];
            strMap = @"ut-03-capitol.png|Utah|Capitol Reef National Monument|Chevron|1952|38.066514|-111.14329|";
            [maps addObject:[self strToMap:strMap]];
            strMap = @"ut-04-zion.png|Utah|Court of the Patriarchs, Zion National Park|Chevron|1954|37.237204|-112.96494|";
            [maps addObject:[self strToMap:strMap]];
            strMap = @"wa-01.png|Washington|Lake Crescent, Olympic National Park|Chevron|1948|48.058231|-123.813196|";
            [maps addObject:[self strToMap:strMap]];
            strMap = @"wa-02.png|Washington|Mount Rainier National Park|Chevron|1949|46.879966|-121.726909|";
            [maps addObject:[self strToMap:strMap]];
            strMap = @"wa-03.png|Washington|Mount St. Helens|Chevron|1950|46.1912|-122.1944|";
            [maps addObject:[self strToMap:strMap]];
            strMap = @"wa-04-shuskan.png|Washington|Mt. Shuskan|Chevron|1952|48.840958|-121.592917|";
            [maps addObject:[self strToMap:strMap]];
            strMap = @"wa-05-chelan.png|Washington|Lake Chelan|Chevron|1953|47.84078|-120.019063|";
            [maps addObject:[self strToMap:strMap]];
            strMap = @"wa-06-baker.png|Washington|Mt. Baker|Chevron|1954|48.777343|-121.813201|";
            [maps addObject:[self strToMap:strMap]];
            strMap = @"wa-07-index.png|Washington|Mt. Index|Chevron|1957|47.774549|-121.580942|";
            [maps addObject:[self strToMap:strMap]];
            
            // added Tuesday 5-20-14
            //
            strMap = @"sh_Alabama.png|Alabama|White Pillars, an ante-bellum mansion|Shell|1974|31.9594679|-87.3623918|";
            [maps addObject:[self strToMap:strMap]];
            strMap = @"sh_Arizona.png|Arizona|An Indian against purple mesas|Shell|1974|36.9908328|-110.096237|";
            [maps addObject:[self strToMap:strMap]];
            strMap = @"sh_Arkansas.png|Arkansas-Louisiana-Mississippi|Tree-shrouded ante-bellum plantation|Shell|1974|31.54317|-91.38298|";
            [maps addObject:[self strToMap:strMap]];
            strMap = @"sh_Baltimore.png|Baltimore|Baltimore Washington Monument|Shell|1972|39.297522|-76.61567|";
            [maps addObject:[self strToMap:strMap]];
            strMap = @"sh_Boston.png|Boston|Old Ironsides|Shell|1972|42.37398|-71.055424|";
            [maps addObject:[self strToMap:strMap]];
            strMap = @"sh_EasternUS.png|Eastern US|Shawnee State Forest, Ohio|Shell|1974|38.7996197|-83.4354425|";
            [maps addObject:[self strToMap:strMap]];
            strMap = @"sh_KY-TN.png|Kentucky-Tennessee|Little Pidgeon River|Shell|1973|35.7036937|-83.3841386|Little Pidgeon River in the Great Smoky Mountains NP";
            [maps addObject:[self strToMap:strMap]];
            strMap = @"sh_LosAngeles.png|Los Angeles|Center for the Performing Arts|Shell|1973|34.056634|-118.24886|";
            [maps addObject:[self strToMap:strMap]];
            strMap = @"sh_Mass.png|Massachusetts-Connecticut-Rhode Island|Minuteman Statue, Lexington|Shell|1973|42.448921|-71.230108|";
            [maps addObject:[self strToMap:strMap]];
            strMap = @"sh_Michigan.png|Michigan|Sable Falls|Shell|1974|46.668183|-86.014435|";
            [maps addObject:[self strToMap:strMap]];
            strMap = @"sh_Minnesota.png|Minnesota|Witch Tree, Lake Superior|Shell|1974|47.958333|-89.641667|";
            [maps addObject:[self strToMap:strMap]];
            strMap = @"sh_Nevada.png|Nevada|Silence in a Nevada ghost town|Shell|1973|40.44583|-118.12222|";
            [maps addObject:[self strToMap:strMap]];
            strMap = @"sh_NewJersey.png|New Jersey|Indian King Tavern|Shell|1973|39.89909|-75.030414|";
            [maps addObject:[self strToMap:strMap]];
            strMap = @"sh_NewMexico.png|New Mexico|A view along Highway 70 (windmill)|Shell|1973|34.3257831|-108.0747225|";
            [maps addObject:[self strToMap:strMap]];
            strMap = @"sh_Ohio.png|Ohio|Winter scene in rural Ohio|Shell|1973|40.1903624|-82.6692525|";
            [maps addObject:[self strToMap:strMap]];
            strMap = @"sh_Penn.png|Pennsylvania|Once a battlefield, now a quiet rural scene|Shell|1973|39.811385|-77.222373|";
            [maps addObject:[self strToMap:strMap]];
            strMap = @"sh_Phoenix.png|Phoenix|Highway Panorama|Shell|1974|33.4617522|-112.0814919|";
            [maps addObject:[self strToMap:strMap]];
            strMap = @"sh_SanJose.png|San Jose|Aerial view of Civic Center|Shell|1973|37.3512903|-121.903|";
            [maps addObject:[self strToMap:strMap]];
            strMap = @"sh_Seattle.png|Seattle|Space Needle|Shell|1972|47.62|-122.349|";
            [maps addObject:[self strToMap:strMap]];
            strMap = @"sh_Texas.png|Texas|Mission San Jose near San Antonio|Shell|1973|29.361393|-98.4784|";
            [maps addObject:[self strToMap:strMap]];
            strMap = @"sh_Wisconsin.png|Wisconsin|The Brule River|Shell|1973|46.540873|-91.584818|";
            [maps addObject:[self strToMap:strMap]];
            
            // added 5-20-14 group 2
            //
            strMap = @"ch_riverside_uc.png|Riverside and San Bernardino|University of California, Riverside|Chevron|1965|33.973287|-117.328111|";
            [maps addObject:[self strToMap:strMap]];
            strMap = @"gulf_chicago.png|Chicago|Palmolive Building and Water Tower|Gulf|1953|41.899793|-87.623501|";
            [maps addObject:[self strToMap:strMap]];
            strMap = @"gulf_miami.png|Miami and Miami Beach|Miami Beach|Gulf|1954|25.8139542|-80.1443065|";
            [maps addObject:[self strToMap:strMap]];
            strMap = @"gulf_phil.png|Philadelphia|Independence Hall 1776|Gulf|1968|39.948|-75.1505|";
            [maps addObject:[self strToMap:strMap]];
            strMap = @"KY_miss.png|Mississippi-Arkansas-Louisiana|Beauvoir, near Biloxi|Kyso|1953|30.391772|-88.969631|Beauvoir, near Biloxi, Mississippi, last home of Jefferson Davis";
            [maps addObject:[self strToMap:strMap]];
            strMap = @"sh_georgia.png|Georgia|Civil War battlefield|Shell|1973|32.8991|-82.0255|";
            [maps addObject:[self strToMap:strMap]];
            strMap = @"sh_indiana.png|Indiana|A cave scene|Shell|1974|38.375569|-86.339468|";
            [maps addObject:[self strToMap:strMap]];
            strMap = @"sh_riverside.png|Riverside and San Bernardino|Mountains and freeway|Shell|1972|34.1424181|-117.3179937|";
            [maps addObject:[self strToMap:strMap]];
            strMap = @"so_ny_boldt.png|New York|Boldt Castle|Esso|1957|44.34434|-75.922653|Boldt Castle in the Thousand Islands near Alexandria Bay";
            [maps addObject:[self strToMap:strMap]];
            strMap = @"so_ny_catskill.png|New York|Catskill Mountain Scenery|Esso|1947|42.0804|-74.3161061|Typical Catskill Mountain Scenery along Esopus Creek near Phoenicia, NY";
            [maps addObject:[self strToMap:strMap]];
            strMap = @"so_ny_watkins.png|New York|Watkins Glen State Park|Esso|1951|42.370463|-76.894449|Watkins Glen State Park in the Finger Lakes Region";
            [maps addObject:[self strToMap:strMap]];
            strMap = @"so_penn_bell.png|Pennsylvania|Liberty Bell|Esso|1951|39.9488|-75.1505|Liberty Bell, Independence Hall, Philadelphia";
            [maps addObject:[self strToMap:strMap]];
            strMap = @"tx_humble.png|Texas|Longhorn Cavern|Humble|1960|30.681708|-98.349917|Sam Bass Entrance to Longhorn Cavern State Park";
            [maps addObject:[self strToMap:strMap]];
            strMap = @"wisc_milw_pate.png|Wisconsin and Milwaukee|Fishing on a lake|Pate|1959|43.94273|-89.9932623|";
            [maps addObject:[self strToMap:strMap]];
            strMap = @"aaa_ny_carriage.png|New York|Central Park Carriage Ride|AAA|1959|40.782865|-73.965355|";
            [maps addObject:[self strToMap:strMap]];
            strMap = @"az-official-1939.png|Arizona|Fray Marcos de Niza|Official|1939|33.336111|-112.069444|In commemoration of Fray Marcos de Niza who passed this way in 1539";
            [maps addObject:[self strToMap:strMap]];
            
            // added 5-21-14
            strMap = @"bc-garibaldi.png|British Columbia and Alberta|Garibaldi Provincial Park|Chevron|1965|49.916667|-122.75|";
            [maps addObject:[self strToMap:strMap]];
            strMap = @"mexico.png|Mexico|Taxco|Chevron|1956|18.556389|-99.604722|";
            [maps addObject:[self strToMap:strMap]];
            
            // added 5-22-14
            strMap = @"Edmonton_Calgary.png|Edmonton-Calgary|Jubilee Auditorium|Chevron|1964|51.06256|-114.092713|";
            [maps addObject:[self strToMap:strMap]];
            strMap = @"humble_mexico.png|Mexico|Mexico City Cathedral|Humble|1959|19.433532|-99.132911|The Cathedral in Mexico City stands on the site of an ancient Aztec templ. The building was started in 1573 and completed in 1667.";
            [maps addObject:[self strToMap:strMap]];
            strMap = @"KY_gaal_cone.png|Georgia-Alabama|Cane Creek Falls|Kyso|1957|34.5557815|-84.0090933|Cane Creek Falls, near Dahlonega, Georgia";
            [maps addObject:[self strToMap:strMap]];
            strMap = @"Portland_1949.png|Portland|Willamette River|Chevron|1949|45.49|-122.668|";
            [maps addObject:[self strToMap:strMap]];
            strMap = @"SO_alberta_bc_eisenhower.png|Alberta-British Columbia|Mount Eisenhower, Alberta|Esso|1955|51.3273401|-115.9657409|Mount Eisenhower, Alberta (Now called Castle Mountain)";
            [maps addObject:[self strToMap:strMap]];
            strMap = @"SO_france.png|France|Parentis (Landes)|Esso|1959|44.352749|-1.08785|";
            [maps addObject:[self strToMap:strMap]];
            strMap = @"SO_italia.png|Italia|Paraggi (S. Margherita Ligure)|Esso|1955|44.3112244|9.210535|Paraggi (S. Margherita Ligure) (Paraggi, Genoa, Italy)";
            [maps addObject:[self strToMap:strMap]];
            strMap = @"SO_ontario_muskoka.png|Ontario|Muskoka Lakes|Esso|1954|45.1173375|-79.5638624|";
            [maps addObject:[self strToMap:strMap]];
            strMap = @"SO_penn_hq.png|Pennsylvania|Washington's Headquarters at Valley Forge|Esso|1949|40.102514|-75.457449|";
            [maps addObject:[self strToMap:strMap]];
            strMap = @"SO_quebec_mont.png|Quebec|Montmorency Falls|Esso|not dated|46.890616|-71.147613|Les chutes Montmorency, pres de Québec (Montmorency Falls, near Quebec City)";
            [maps addObject:[self strToMap:strMap]];
            strMap = @"SO_sweden.png|Svierge-Sweden|Slussen Cloverleaf|Esso|1957|59.319495|18.072331|The Old City of Stockholm and the Slussen Cloverleaf";
            [maps addObject:[self strToMap:strMap]];
            
            // added 5-31-14
            strMap = @"AL_BC_Butchart.png|Alberta-British Columbia|Butchart Gardens|Esso|1954|48.563576|-123.470626|The Butchart Gardens, near Victoria, B.C.";
            [maps addObject:[self strToMap:strMap]];
        }
    }
    
    for (int i=0; i<maps.count; i++) {
        Map* m = [maps objectAtIndex:i];
        m.mapId = i;
    }
    
    NSSortDescriptor *alphaTitleSort = [NSSortDescriptor sortDescriptorWithKey:@"title" ascending:YES];
    [maps sortUsingDescriptors:[NSArray arrayWithObject:alphaTitleSort]];

    for (int i=0; i<maps.count; i++) {
        Map* m = [maps objectAtIndex:i];
        m.index = i;
    }
    
return self;
}

- (Map*) strToMap:(NSString*)strMap {
    NSArray *parts = [strMap componentsSeparatedByString:@"|"];
    Map *map = [[Map alloc] init];
    map.picture = [[parts objectAtIndex:0] substringToIndex:[[parts objectAtIndex:0] length]-4];
    map.title = [parts objectAtIndex:1];
    map.subtitle = [parts objectAtIndex:2];
    map.company = [parts objectAtIndex:3];
    map.year = [parts objectAtIndex:4];
    map.latitude = [[parts objectAtIndex:5] doubleValue];
    map.longitude = [[parts objectAtIndex:6] doubleValue];
    map.description = [parts objectAtIndex:7];
    if ([map.description length] == 0)
        map.description = map.subtitle;
    NSLog(@"Adding map: %@", map.picture);
    return map;
}

+ (Data*) sharedMapData {
    
    static Data *sharedMapData = nil;
    
    @synchronized (self)
    {
        if (sharedMapData == nil) {
            sharedMapData = [[Data alloc] init];
        }
        return sharedMapData;
    }
}

- (NSMutableArray*) getMaps {
    return maps;
}

@end
