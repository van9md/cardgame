extends Node2D
var selected = false
var released = false
var element_top= ""
var intersect = false
var area_top = "Area"
var card
signal  reaction(a,b)

@export var element: String = "element"
@export var color:Color

@export var reactions = {}

func _ready():
	find_reactions()
	get_node("Icon/Area2D/Label").text = element
	get_node("Icon").set_modulate(color)
	
func _physics_process(delta):
	#move card with delay
	if selected:
		global_position = lerp(global_position, get_global_mouse_position(),25*delta)

func _process(delta):
	#find_reactions()
	var level = self.get_parent()
	check_drop()
		
func _on_control_gui_input(event):
	if Input.is_action_just_pressed("click"):
		selected = true
		released = false
		print(element, " clicked!")
		print("my reaction is: ", reactions )
	if Input.is_action_just_released("click"):
		released = true
		selected = false
		print(element, " released")
		

func _on_area_2d_area_entered(area):
	if selected == false:
		element_top = area.get_node("Label").text
		print(element_top, " ENTERED ", element)
		area_top= area
		intersect = true
		
func _on_area_2d_area_exited(area):
	intersect = false
	
func check_drop():
	if selected == false and intersect == true and area_top.get_parent().get_parent().released == true:
		#custom signal
		#reaction.emit(element,element_top,self,area_top.get_parent().get_parent())
		#delete if it any reaction
		if element_top in reactions:
			#delete element_top on enter
			area_top.get_parent().get_parent().queue_free()
			#create new card from reactions
			create_new_card()
			self.queue_free()
			
		
func create_new_card():
	var card = Globals.card.instantiate()
	card.element=reactions[element_top]
	card.color = Color(1, 1, 1, 1)
	card.global_position=get_global_mouse_position()
	self.get_parent().add_child(card)
		

func find_reactions():
		for i in reactions_list:
			if i[0]== element:
				reactions[i[1]]=i[2]
			if i[1]==element:
				reactions[i[0]]=i[2]


var reactions_list = [["Fire" , "Water","Steam"],
["Fire" , "Earth" , "Lava"],
["Fire" , "Air" , "Smoke"],
["Water" , "Earth" , "Mud"],
["Water" , "Air" , "Mist"],
["Earth" , "Air" , "Dust"],
["Fire" , "Steam" , "Ash"],
["Fire" , "Lava" , "Magma"],
["Fire" , "Smoke" , "Flame"],
["Water" , "Mud" , "Clay"],
["Water" , "Mist" , "Rain"],
["Earth" , "Dust" , "Sand"],
["Earth" , "Mud" , "Soil"],
["Air" , "Dust" , "Wind"],
["Air" , "Mist" , "Fog"],
["Fire" , "Ash" , "Charcoal"],
["Fire" , "Magma" , "Obsidian"],
["Fire" , "Flame" , "Blaze"],
["Water" , "Clay" , "Porcelain"],
["Water" , "Rain" , "Hail"],
["Earth" , "Sand" , "Stone"],
["Earth" , "Soil" , "Mudbrick"],
["Air" , "Wind" , "Gust"],
["Air" , "Fog" , "Cloud"],
["Fire" , "Charcoal" , "Ember"],
["Fire" , "Obsidian" , "Glass"],
["Fire" , "Blaze" , "Inferno"],
["Water" , "Porcelain" , "Ceramic"],
["Water" , "Hail" , "Ice"],
["Earth" , "Stone" , "Pebble"],
["Earth" , "Mudbrick" , "Adobe"],
["Air" , "Gust" , "Breeze"],
["Air" , "Cloud" , "Sky"],
["Fire" , "Ember" , "Bonfire"],
["Fire" , "Glass" , "Crystal"],
["Fire" , "Inferno" , "Explosion"],
["Water" , "Ceramic" , "Glaze"],
["Water" , "Ice" , "Snow"],
["Earth" , "Pebble" , "Gravel"],
["Earth" , "Adobe" , "Brick"],
["Air" , "Breeze" , "Zephyr"],
["Air" , "Sky" , "Atmosphere"],
["Fire" , "Bonfire" , "Campfire"],
["Fire" , "Crystal" , "Diamond"],
["Fire" , "Explosion" , "Blast"],
["Water" , "Glaze" , "Enamel"],
["Water" , "Snow" , "Frost"],
["Earth" , "Gravel" , "Boulder"],
["Earth" , "Brick" , "Wall"],
["Air" , "Zephyr" , "Gale"],
["Air" , "Atmosphere" , "Climate"],
["Fire" , "Campfire" , "Torch"],
["Fire" , "Diamond" , "Ruby"],
["Fire" , "Blast" , "Explosion"],
["Water" , "Enamel" , "Glassware"],
["Water" , "Frost" , "Iceberg"],
["Earth" , "Boulder" , "Rock"],
["Earth" , "Wall" , "Building"],
["Air" , "Gale" , "Storm"],
["Air" , "Climate" , "Weather"],
["Fire" , "Torch" , "Beacon"],
["Fire" , "Ruby" , "Garnet"],
["Fire" , "Explosion" , "Fireworks"],
["Water" , "Glassware" , "Aquarium"],
["Water" , "Iceberg" , "Glacier"],
["Earth" , "Rock" , "Mountain"],
["Earth" , "Building" , "Architecture"],
["Air" , "Storm" , "Hurricane"],
["Air" , "Weather" , "Meteorology"],
["Fire" , "Beacon" , "Signal fire"],
["Fire" , "Garnet" , "Topaz"],
["Fire" , "Fireworks" , "Explosion"],
["Water" , "Aquarium" , "Fish"],
["Water" , "Glacier" , "Ice sheet"],
["Earth" , "Mountain" , "Volcano"],
["Earth" , "Architecture" , "Design"],
["Air" , "Hurricane" , "Tornado"],
["Air" , "Meteorology" , "Climate change"],
["Fire" , "Signal fire" , "Bonfire"],
["Fire" , "Topaz" , "Sapphire"],
["Fire" , "Explosion" , "Bomb"],
["Water" , "Fish" , "Dolphin"],
["Water" , "Ice sheet" , "Antarctica"],
["Earth" , "Volcano" , "Magma chamber"],
["Earth" , "Design" , "Plan"],
["Air" , "Tornado" , "Whirlwind"],
["Air" , "Climate change" , "Global warming"],
["Fire" , "Bonfire" , "Fire pit"],
["Fire" , "Sapphire" , "Amethyst"],
["Fire" , "Bomb" , "Explosion"],
["Water" , "Dolphin" , "Whale"],
["Water" , "Antarctica" , "Ice shelf"],
["Earth" , "Magma chamber" , "Caldera"],
["Earth" , "Plan" , "Blueprint"],
["Air" , "Whirlwind" , "Cyclone"],
["Air" , "Global warming" , "Climate crisis"],
["Fire" , "Fire pit" , "Barbecue"],
["Fire" , "Amethyst" , "Emerald"],
["Fire" , "Explosion" , "Detonation"],
["Water" , "Whale" , "Shark"],
["Water" , "Ice shelf" , "Iceberg"],
["Earth" , "Caldera" , "Crater"],
["Earth" , "Blueprint" , "Design"],
["Air" , "Cyclone" , "Typhoon"],
["Air" , "Climate crisis" , "Climate emergency"],
["Fire" , "Barbecue" , "Grilling"],
["Fire" , "Emerald" , "Jade"],
["Fire" , "Detonation" , "Explosion"],
["Water" , "Shark" , "Octopus"],
["Water" , "Iceberg" , "Titanic"],
["Earth" , "Crater" , "Impact"],
["Earth" , "Design" , "Architecture"],
["Air" , "Typhoon" , "Monsoon"],
["Air" , "Climate emergency" , "Environmental crisis"],
["Fire" , "Grilling" , "Cooking"],
["Fire" , "Jade" , "Opal"],
["Fire" , "Explosion" , "Blast"],
["Water" , "Octopus" , "Squid"],
["Water" , "Titanic" , "Iceberg"],
["Earth" , "Impact" , "Meteorite"],
["Earth" , "Architecture" , "Building design"],
["Air" , "Monsoon" , "Rainstorm"],
["Air" , "Environmental crisis" , "Sustainability"],
["Fire" , "Cooking" , "Baking"],
["Fire" , "Opal" , "Pearl"],
["Fire" , "Blast" , "Bang"],
["Water" , "Squid" , "Cuttlefish"],
["Water" , "Iceberg" , "Arctic"],
["Earth" , "Meteorite" , "Crater"],
["Earth" , "Building design" , "Urban planning"],
["Air" , "Rainstorm" , "Thunderstorm"],
["Air" , "Sustainability" , "Eco-friendliness"],
["Fire" , "Baking" , "Roasting"],
["Fire" , "Pearl" , "Coral"],
["Fire" , "Bang" , "Boom"],
["Water" , "Cuttlefish" , "Nautilus"],
["Water" , "Arctic" , "Polar bear"],
["Earth" , "Crater" , "Depression"],
["Earth" , "Urban planning" , "Cityscape"],
["Air" , "Thunderstorm" , "Lightning"],
["Air" , "Eco-friendliness" , "Green energy"],
["Fire" , "Roasting" , "Frying"],
["Fire" , "Coral" , "Seashell"],
["Fire" , "Boom" , "Bang"],
["Water" , "Nautilus" , "Chambered nautilus"],
["Water" , "Polar bear" , "Walrus"],
["Earth" , "Depression" , "Sinkhole"],
["Earth" , "Cityscape" , "Skyline"],
["Air" , "Lightning" , "Thunder"],
["Air" , "Green energy" , "Renewable energy"],
["Fire" , "Frying" , "SautР“В©ing"],
["Fire" , "Seashell" , "Conch"],
["Fire" , "Bang" , "Explosion"],
["Water" , "Chambered nautilus" , "Cuttlebone"],
["Water" , "Walrus" , "Seal"],
["Earth" , "Sinkhole" , "Cenote"],
["Earth" , "Skyline" , "Architecture"],
["Air" , "Thunder" , "Storm"],
["Air" , "Renewable energy" , "Solar power"],
["Fire" , "SautР“В©ing" , "Grilling"],
["Fire" , "Conch" , "Abalone"],
["Fire" , "Explosion" , "Detonation"],
["Water" , "Cuttlebone" , "Calcium"],
["Water" , "Seal" , "Otter"],
["Earth" , "Cenote" , "Sinkhole"],
["Earth" , "Architecture" , "Building"],
["Air" , "Storm" , "Tornado"],
["Air" , "Solar power" , "Wind power"],
["Fire" , "Grilling" , "Barbecue"],
["Fire" , "Abalone" , "Mother of pearl"],
["Fire" , "Detonation" , "Explosion"],
["Water" , "Calcium" , "Coral reef"],
["Water" , "Otter" , "Beaver"],
["Earth" , "Sinkhole" , "Karst"],
["Earth" , "Building" , "Skyscraper"],
["Air" , "Tornado" , "Cyclone"],
["Air" , "Wind power" , "Hydroelectric power"],
["Fire" , "Barbecue" , "Smoking"],
["Fire" , "Mother of pearl" , "Pearl"],
["Fire" , "Explosion" , "Blast"],
["Water" , "Coral reef" , "Ecosystem"],
["Water" , "Beaver" , "Dam"],
["Earth" , "Karst" , "Cave"],
["Earth" , "Skyscraper" , "Tower"],
["Air" , "Cyclone" , "Hurricane"],
["Air" , "Hydroelectric power" , "Tidal power"],
["Fire" , "Smoking" , "Curing"],
["Fire" , "Pearl" , "Jewelry"],
["Fire" , "Blast" , "Boom"],
["Water" , "Ecosystem" , "Biome"],
["Water" , "Dam" , "Reservoir"],
["Earth" , "Cave" , "Speleology"],
["Earth" , "Tower" , "Skyscraper"],
["Air" , "Hurricane" , "Typhoon"],
["Air" , "Tidal power" , "Wave power"],
["Fire" , "Curing" , "Brining"],
["Fire" , "Jewelry" , "Gemstone"],
["Fire" , "Boom" , "Bang"],
["Water" , "Biome" , "Habitat"],
["Water" , "Reservoir" , "Lake"]]

