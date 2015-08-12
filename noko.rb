#!/usr/bin/env ruby
# encoding: utf-8
#!/usr/bin/env ruby
# encoding: utf-8
require 'nokogiri'
require 'open-uri'
require 'date'
require 'pry'
require 'csv'
require 'time'

puts "start_crawl"
start_time = Time.now
puts start_time

# url_arr = ["anteprima"]
today_date = Date.today
# tomorrow = today_date + 1
url_arr = ["aruns","anteprima","Turkish-Cuisine","Ombra","Andies-Restaurant-Andersonville","Big-Jones","Acre-Restaurant","Adriatic-Restaurant","Parachute","Red-Apple-Buffet-Avondale","Mirabell-Restaurant-Chicago","The-Duck-Inn","Moon-Palace-Restaurant","Everest","Fogo-de-Chao-Brazilian-Steakhouse-Chicago","Trattoria-No-10","Remingtons","Mortons-The-Steakhouse-Chicago-Wacker-Place","The-Gage","Acanto","Catch-35-Chicago","Rosebud-Prime","Petterinos","South-Branch","Metropolitan-Club","Cherry-Circle-Room","676-Restaurant-and-Bar","Rudy's-Bar-and-Grille","Stetsons-Modern-Steak-and-Sushi","Hot-Woks-Cool-Sushi-Willis-Tower","Tilted-Kilt","312-Chicago","Sayat-Nova","Pazzos-Cucina-Italiana-23-E-Jackson-Blvd","Rosebud-Theater-District","The-Florentine","Sweetwater-Tavern-and-Grille","Berghoff-Catering-and-Restaurant-Group","Palm-Restaurant-Chicago","Pizanos-Pizza-and-Pasta-Madison","McCormick-and-Schmicks-Seafood-Chicago-Wacker-Dr","AraOn","Filini-Restaurant-and-Bar-Radisson-Blu-Aqua-Hotel","The-Marq","Great-Street","Vivere","Primebar-Chicago","III-Forks-Chicago","Tradition","Aria","Commons-Club","One-North-Kitchen-and-Bar","La-Cantina-Italian-Chophouse","Pearl-Tavern","Chucks-A-Kerry-Simon-Kitchen","Lockwood-Restaurant-and-Bar","South-Water-Kitchen","The-Walnut-Room-Chicago","Emerald-Loop-Bar-and-Grill","Atwood","Pazzo's-Cucina-Italiana-101-N-Wacker-Dr","The-Grillroom","Tavern-at-the-Park","Hubble-Hookah","Mia-Figlia","Collettis","Pearls-Southern-Comfort","Francescas-Bryn-Mawr","Ethiopian-Diamond","Broadway-Cellars","La-Fonda-Latino-Grill","Revival-Social-Club","Pasteur","Uncommon-Ground-Edgewater","Don-Juan-Restaurante","Hugos-Frog-Bar-and-Fish-House-Chicago","The-Capital-Grille-Chicago-Downtown","Les-Nomades","RL-Restaurant","Eddie-Vs-Chicago","Lawrys-The-Prime-Rib-Chicago","The-Palm-Court","Merlo-on-Maple","Le-Colonial-Chicago","Ditkas-Chicago","Gibsons-Bar-and-Steakhouse-Chicago","The-Lobby","Pelago","Chicago-q","Mirai-Sushi-Gold-Coast","Rosebud-Steakhouse","Nico-Osteria","Mortons-The-Steakhouse-Chicago-The-Original","Carmines","Bistrot-Zinc","Tavern-on-Rush","Rosebud-on-Rush","Cantina-Laredo-Chicago","ikram-cafe","Mariposa-at-Neiman-Marcus-Michigan-Avenue","Shulas-Steak-House-Chicago","Michael-Jordans-Steakhouse","Hopsmith-Tavern","Shanghai-Terrace","RA-Sushi-Bar-Restaurant-Chicago","Allium","Cape-Cod","bistronomic","Cafe-Spiaggia","Emilios-Tapas-Sol-Y-Nieve","TRU","Pump-Room-Public-Hotel","Devon-Seafood-Grill-Chicago","Cafe-Des-Architectes-CDA","Jellyfish","Frankies-Pizzeria-and-Scaloppine","Spiaggia","Table-Fifty-Two","Pinstripes-Chicago","The-Grill-on-the-Alley-Chicago","FIG-and-OLIVE-Chicago","Coco-Pazzo-Cafe","Mercadito-Kitchen-Gold-Coast","Marios-Table","The-Local-Chicago","Kendall-College-Dining-Room","Athena-Restaurant","Santorini-Greek-Restaurant","Pegasus-Restaurant-and-Taverna","Ja-Grill-Hyde-Park","Piccolo-Mondo-Hyde-Park","Porkchop-Hyde-Park","A10-Hyde-Park","Las-Tablas-Colombian-Steak-House-Irving-Park","Yum-Cha","Rollapalooza","Taverna-750","ARTango-South-American-Bistro","Bistro-Dre","Osteria-de-Pizza-Metro","Mia-Francesca","mfk","Ukai-Sushi","Bar-Pastoral","Pars-Cove-Restaurant","Ani","Mixteco-Grill","Fornello-Trattoria","Select-Cut-Steakhouse","Shiawase-Restaurant","Spencers-Jolly-Posh-Foods","Tutto-Fresco-Trattoria","Fiorentinos","El-Mariachi-Tequila-Bar-and-Grill","Tac-Quick","Rise-Sushi-and-Sake-Lounge","Revolucion-Steakhouse","Andies-Restaurant-Lakeview","Matsuya-Japanese-Restaurant","Wood","Mystic-Celt","Las-Tablas-Colombian-Steak-House","Anna-Maria-Pasteria","Bulerias","Ceres-Table","Old-Crow-Smokehouse-Chicago","dagostinos-wrigleyville","PS-Bangkok","Schubas-Harmony-Grill","Blokes-and-Birds","DS-Tequila-Company","Bites-Asian-Tapas-and-Sushi","Hutch","minibar","Barcocina-Chicago","The-Peasantry","Deleece-Restaurant-on-Southport","Uncommon-Ground-Lakeview","Roong-Petch","Newport-Bar-and-Grill","Boka","North-Pond","Gejas-Cafe","Cafe-Ba-Ba-Reeba","Sapori-Trattoria","Riccardo-Trattoria","INTRO","Gemini-Bistro","Sai-Cafe","Juno","Mon-Ami-Gabi","de-Quay","Summer-House","Riccardo-Enoteca","Chez-Moi","Knife-and-Tine","Tandoor-Char-House","Goose-Island-Brewery","Kingsbury-Street-Cafe","Tarantinos","Shine","Stella-Barra-Pizzeria-Chicago","Filippos-Restaurant","Rock-Wrap-and-Roll","Elio-Pizza-on-Fire","Miss-Asia-Cuisine","Ringo-Japanese-Kitchen","Pizzeria-da-Nella","Papacitos-Mexican-Grille","White-Oak-Tavern-and-Inn","Las-Fuentes-Restaurant-Chicago","Perennial-Virant","Vinci","Balena","Four-Farthings","Aquitaine-Chicago","Barn-and-Company","Pizanos-Pizza-and-Pasta-on-Lincoln","Raj-Darbar-Indian-Restaurant","The-Hidden-Shamrock","Fairways","RJ-Grunts","Trattoria-Gianni","Standard-Market-Grill","Harrys-Velvet-Room","Dinosaur-Bar-B-Que-Chicago","Dees-Mandarin-Restaurant","Lokal-Lincoln-Park","The-Blanchard","Rice-Cafe","goosefoot","Due-Lire","Bistro-Campagne","I-Monelli-Trattoria-Pizzeria","Restaurant-Sarajevo","Himmels","Me-dee-Cafe","Essence-of-India","Fork","Mrs-Murphy-and-Sons-Irish-Bistro","Chez-Joel","RoSals","The-Rosebud","Davanti-Enoteca-Taylor-Street","Tuscany-on-Taylor","Bacchanalia-Chicago","Francescas-on-Taylor","Kohan-Japanese-Restaurant","Three-Aces","La-Taberna-Tapas-on-Halsted","Il-Vicinato-Ristorante","Bascule","Grub-Chicago","Lula-Cafe","Fat-Rice","Osteria-Langhe","DNoche","Table-Donkey-and-Stick","The-Radler","Hachis-Kitchen","Letizias-Fiore","Analogue","s-at-kura-fusion-japanese-and-sushi-restaurant","Gosu","Yusho-Logan-Square","Sink-Swim","Son-of-a-Butcher-Tavern","Zoku-Sushi","Sunny-Side-Up","Theory-Chicago","The-Terrace-at-Trump","Umi","Annas-Asian-Grill-and-Sushi-Bar","Browntrout","Melao-Latin-Cuisine","Sola","Via-Lima-Restaurant","Sabatinos-Restaurant","Bread-and-Wine","Hot-Woks-Cool-Sushi-Pulaski","Salpicon","Old-Jerusalem","Wells-on-Wells","Kamehachi-of-Tokyo-Wells-Street","Old-Town-Pour-House","The-Glunz-Tavern","OBriens-Restaurant-and-Bar","Adobo-Grill-Old-Town","Fireplace-Inn","Bistrot-Margot","Old-Town-Social","Nightwood","Ciao-Amore-Ristorante","Hands-On-Modern-Thai-and-Sushi-Bar","Legno","RUK","Nami-Sushi","La-Parrilla-Colombian-Steakhouse","Miku-Sushi","Bavettes","Joes-Seafood-Prime-Steak-and-Stone-Crab","Boho-Bohemian-House","Sixteen","RPM-Italian","MK-The-Restaurant","Tanta","RPM-Steak","Shaws-Crab-House-Chicago","Quartino","ROKA-AKOR-Chicago","Bistro-Voltaire","Sunda","Three-Dots-and-a-Dash","Siena-Tavern","Prosecco","Gyu-Kaku-Chicago","Kikis-Bistro","Bennys-Chop-House","Tortoise-Club","GT-Fish-and-Oyster","Beatrix","Chicago-Cut-Steakhouse","The-Boarding-House","Kinzie-Chophouse","Osteria-Via-Stato","Bub-City","ZED451-Chicago","Mastros-Steakhouse-Chicago","Travelle-The-Langham-Chicago","Topolobampo","Brindille","Ramen-san","Seasons-52-Chicago","Wildfire-Chicago","Gilt-Bar","Erie-Cafe","Celeste","Paris-Club-Bistro-and-Bar","Harry-Carays-Italian-Steakhouse-Chicago","Flemings-Steakhouse-Chicago","Maggianos-Chicago","SUMI-Robata-Bar","Piccolo-Sogno-Due","Phil-Stefanis-437-Rush","Dolce-Italian","Andys-Jazz-Club","Rebar-Trump-International-Hotel-and-Tower","SullivansSteakhouse-Chicago","Del-Friscos-Double-Eagle-Steak-House-Chicago","Piccolo-Sogno","Two","Paramount-Room","Thalia-Spice","The-Dawson","Sepia","Japonais-by-Morimoto","SUMMER","Indie-Cafe","Pride-Sushi-and-Thai","Act-One","Via-Veneto","Chopal-Kabab-and-Steak","Volo-Restaurant-Wine-Bar","Hot-Woks-Cool-Sushi-Roscoe-Village","Piazza-Bella","Turquoise","Cuba-312","Monasteros","Tapas-Valencia","Cafe-Bionda","Mercat-a-La-Planxa","UMAI-Japanese-Kitchen-and-Sushi","Gioco","Acadia","Kurah-Mediterranean-Tapas","May-St-Steakhouse","Sofi-Restaurant","Tutto-Italiano-Ristorante","Niu-B-Sushi-and-Robata-South-Michigan-Ave","Connies-Pizza-in-Bridgeport","Asian-Outpost","Villains-Chicago","Amarit-Thai-Restaurant","Tamarind-Chicago","Adamus-Silversmith-Hotel","720-South-Bar-And-Grill","Weather-Mark-Tavern","Brasserie-by-LM","Chicago-Curry-House-Indian-and-Nepalese-Restaurant","Parrot-Cage-Washburne-Culinary-Institute","a-tavola","Homestead-on-the-Roof","Gari-Sushi-and-Asian-Bistro","Boeufhaus","Agami-Contemporary-Sushi","Demera-Ethiopian-Restaurant","Hai-Yen-Argyle","Magnolia-Cafe","Girl-and-the-Goat","Little-Goat","Maudes-liquor-bar","Momotaro","Embeya","Blackbird","The-Izakaya-at-Momotaro-Restaurant","Viaggio-Ristorante-and-Lounge","RM-Champagne-Salon","Grace","The-Publican","Vivo","Carnivale","BellyQ","Macello","Graham-Elliot-Bistro","Il-Pesce-Le-Verdure-at-Eataly-Chicago","Saigon-Sisters","Tanoshii-West-Loop","Bar-Takito-West-Loop","Osteria-di-Eataly","Nellcote","Nia-Mediterranean","Paolas-Vinum","Dine","TETE-Charcuterie","Vera","La-Pizza-and-La-Pasta-at-Eataly-Chicago","Salero","Moto-Restaurant","Ovie-Bar-and-Grill","The-Ogden-Chicago","Chicken-and-Farm-Shop","Fulton-Market-Kitchen","Mas","Mart-Anthonys","Formentos","Jaipur","Kaiser-Tiger","Park-Tavern-Chicago","City-Winery-Chicago","Pizza-East-Chicago","Trattoria-Isabella","Brass-Monkey","Bin-36","Porkchop","Parlor-Pizza-Bar","Randolph-Tavern","STK–Chicago","Bar-Siena","Mexique","Green-Zebra","Bella-Notte","Shaman-by-Chilam-Balam","Charlatan","Sabor-A-Cafe","Unite-Urban-Grill","Gaudi-Cafe","The-Bristol","Nando-Milano-Trattoria","Cafe-Absinthe","Takito-Kitchen-Wicker-Park","Mirai-Sushi-Wicker-Park","Trenchermen","Tocco-Pizza-e-Arte","Arami","Sol-De-Mexico","Taxim","Pizanos-Pizza-and-Pasta-Division","The-Winchester","Hot-Chocolate","Presidio","The-Boundary-Tavern-and-Grille","Enoteca-Roma","UNI-SUSHI-BISTRO","Papajin","The-Bedford","Pasta-Bowl-Wicker-Park","Pizza-House-1647","Via-Carducci-Wicker-Park","Fatpour-Tap-Works","Bar-Bar-Black-Sheep","Enso-Sushi-and-Bar","Irazu-Costa-Rican-Restaurant","The-Monarch","Kin-Sushi-and-Thai-Cuisine","Club-Lucky","Nori-Sushi-Milwaukee-Ave","Seadog-Sushi-Bar","Carriage-House","Janes","The-Southern","Runa-Japanese-Restaurant","Black-Bull","Frontier","Lokal","Chop-Shop","Francescas-Forno","Red-Door","Taus-Authentic","Feast-Bucktown","John-Barleycorn-Wrigleyville","Heating-and-Cooling","Raw-Bar-and-Grill","Rockit-Burger-Bar","Moes-Cantina-Wrigleyville"]
final_hash = Hash.new
# add .shuffle
url_arr.shuffle.each do |restaurant|
	covers = [2,4,6,8,10]
	covers_hash = Hash.new
	covers.each do |party_size|
		final_times = []
		times = ["%1617", "%1619", "%1621","%1623"]
		times.each do |time|
			# url = "http://www.opentable.com/"+restaurant+"?DateTime="+Date.today.to_s+time+"&Covers="+party_size.to_s+"&MetroID=3"
			url = "http://www.opentable.com/"+restaurant+"?DateTime="+today_date.to_s+time+"&Covers="+party_size.to_s+"&MetroID=3"
			begin
				doc = Nokogiri::HTML(open(url))
			rescue Exception => e
				# OpenURI::HTTPError, URI::InvalidURIError, RuntimeError, NoMethodError => e
				# if e.message == '404 Not Found'
					final_times.push e.message
			else
				unless doc.nil?
					doc.xpath('//*[@id="dtp-results"]/div/ul/li/a').each do |w|
					final_times.push w.text.split(" PM")[0]
					end
				end
			end
		end
	final_times.uniq!
	final_times = final_times.delete_if {|x| x == " "}
	covers_hash[party_size.to_s] = final_times
	final_hash[restaurant] = covers_hash
	end
end
final_hash.each do |key, hash|
	hash.each do |covers, array|
		array.each do |value|
			CSV.open("./data/#{today_date}.csv", "a+") do |csv|
				csv << [today_date,key, value,covers]
			end
		end
	end
end
end_time = Time.now
puts end_time
crawl_time = (end_time - start_time)/60
puts "end_Crawl"
puts "#{crawl_time} minutes"


















# CSV.open("./test.csv", "w") do |csv|
#   csv << ["row", "of", "CSV", "data"]
# end
				# url = "http://www.opentable.com/anteprima?DateTime=2015-07-08%2122&Covers=2&MetroID=3"
				#        http://www.opentable.com/anteprima?DateTime=2015-07-07%1621Covers=2&MetroID=3
				# doc = Nokogiri::HTML(open(url))
				# doc.xpath('//*[@id="dtp-results"]/div/ul/li/a').each do |time|
				# 	puts time.text.split(" PM")
				# end
				# y = Date.today
				# puts y

				# y = doc.css("a.dtp-button.button").text.split(" PM")
				# y = doc.xpath('//*[@id="dtp-results"]/div/ul/li/a').text.split(" PM")
				# puts "hello world"
				# puts y
				# puts "what the hell"
				# key = rest_url.split("=")[1].split("%")[0]
				# my_hash.merge!("#{key}" => y)




