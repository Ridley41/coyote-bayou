/mob/living/simple_animal/hostile/asteroid/wolf
	name = "white wolf"
	desc = "A beast that survives by feasting on weaker opponents, they're much stronger with numbers."
	icon = 'icons/mob/icemoon/icemoon_monsters.dmi'
	icon_state = "whitewolf"
	icon_living = "whitewolf"
	icon_dead = "whitewolf_dead"
	mob_biotypes = MOB_ORGANIC|MOB_BEAST
	mouse_opacity = MOUSE_OPACITY_ICON
	friendly_verb_continuous = "howls at"
	friendly_verb_simple = "howl at"
	speak_emote = list("howls")
	speed = 5
	move_to_delay = 5
	maxHealth = 130
	health = 130
	obj_damage = 15
	melee_damage_lower = 15
	melee_damage_upper = 35
	rapid_melee = 2 // every second attack
	dodging = TRUE
	dodge_prob = 50
	attack_verb_continuous = "bites"
	attack_verb_simple = "bite"
	attack_sound = 'sound/weapons/bite.ogg'
	vision_range = 7
	aggro_vision_range = 7
	move_force = MOVE_FORCE_WEAK
	move_resist = MOVE_FORCE_WEAK
	pull_force = MOVE_FORCE_WEAK
	guaranteed_butcher_results = list(/obj/item/reagent_containers/food/snacks/meat/slab = 2, /obj/item/stack/sheet/sinew = 2, /obj/item/stack/sheet/bone = 2)
	crusher_loot = /obj/item/crusher_trophy/watcher_wing
	stat_attack = CONSCIOUS
	robust_searching = TRUE
	retreat_health_percent = 0.5
	max_heal_amount = 0.9
	heal_per_life = 0.115
	tactical_retreat = 10
