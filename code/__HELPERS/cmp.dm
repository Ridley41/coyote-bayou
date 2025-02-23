/proc/cmp_numeric_dsc(a,b)
	return b - a

/proc/cmp_numeric_asc(a,b)
	return a - b

/proc/cmp_text_asc(a,b)
	return sorttext(b,a)

/proc/cmp_text_dsc(a,b)
	return sorttext(a,b)

/proc/cmp_name_asc(atom/a, atom/b)
	return sorttext(b.name, a.name)

/proc/cmp_name_dsc(atom/a, atom/b)
	return sorttext(a.name, b.name)

GLOBAL_VAR_INIT(cmp_field, "name")
/proc/cmp_records_asc(datum/data/record/a, datum/data/record/b)
	return sorttext(b.fields[GLOB.cmp_field], a.fields[GLOB.cmp_field])

/proc/cmp_records_dsc(datum/data/record/a, datum/data/record/b)
	return sorttext(a.fields[GLOB.cmp_field], b.fields[GLOB.cmp_field])

/proc/cmp_filter_data_priority(list/A, list/B)
	return A["priority"] - B["priority"]

/proc/cmp_ckey_asc(client/a, client/b)
	return sorttext(b.ckey, a.ckey)

/proc/cmp_ckey_dsc(client/a, client/b)
	return sorttext(a.ckey, b.ckey)

/proc/cmp_ckey_mob_asc(mob/a, mob/b)
	if(!ismob(a) || !ismob(b))
		return rand(-1,1) // sort this, runtime randy
	return sorttext(b.ckey, a.ckey)

/proc/cmp_ckey_mob_dsc(mob/a, mob/b)
	if(!ismob(a) || !ismob(b))
		return rand(-1,1) // sort this, runtime randy
	return sorttext(a.ckey, b.ckey)

/proc/cmp_subsystem_init(datum/controller/subsystem/a, datum/controller/subsystem/b)
	return initial(b.init_order) - initial(a.init_order)	//uses initial() so it can be used on types

/proc/cmp_subsystem_display(datum/controller/subsystem/a, datum/controller/subsystem/b)
	return sorttext(b.name, a.name)

/proc/cmp_subsystem_priority(datum/controller/subsystem/a, datum/controller/subsystem/b)
	return a.priority - b.priority

/proc/cmp_timer(datum/timedevent/a, datum/timedevent/b)
	return a.timeToRun - b.timeToRun

/proc/cmp_clientcolour_priority(datum/client_colour/A, datum/client_colour/B)
	return B.priority - A.priority

/*/proc/cmp_clockscripture_priority(datum/clockwork_scripture/A, datum/clockwork_scripture/B)
	return initial(A.sort_priority) - initial(B.sort_priority)*/

/proc/cmp_ruincost_priority(datum/map_template/ruin/A, datum/map_template/ruin/B)
	return initial(A.cost) - initial(B.cost)

/proc/cmp_qdel_item_time(datum/qdel_item/A, datum/qdel_item/B)
	. = B.hard_delete_time - A.hard_delete_time
	if (!.)
		. = B.destroy_time - A.destroy_time
	if (!.)
		. = B.failures - A.failures
	if (!.)
		. = B.qdels - A.qdels

/proc/cmp_generic_stat_item_time(list/A, list/B)
	. = B[STAT_ENTRY_TIME] - A[STAT_ENTRY_TIME]
	if (!.)
		. = B[STAT_ENTRY_COUNT] - A[STAT_ENTRY_COUNT]

/proc/cmp_profile_avg_time_dsc(list/A, list/B)
	return (B[PROFILE_ITEM_TIME]/(B[PROFILE_ITEM_COUNT] || 1)) - (A[PROFILE_ITEM_TIME]/(A[PROFILE_ITEM_COUNT] || 1))

/proc/cmp_profile_time_dsc(list/A, list/B)
	return B[PROFILE_ITEM_TIME] - A[PROFILE_ITEM_TIME]

/proc/cmp_profile_count_dsc(list/A, list/B)
	return B[PROFILE_ITEM_COUNT] - A[PROFILE_ITEM_COUNT]

/proc/cmp_atom_layer_asc(atom/A,atom/B)
	if(A.plane != B.plane)
		return A.plane - B.plane
	else
		return A.layer - B.layer

/proc/cmp_advdisease_resistance_asc(datum/disease/advance/A, datum/disease/advance/B)
	return A.totalResistance() - B.totalResistance()

/proc/cmp_uplink_items_dsc(datum/uplink_item/A, datum/uplink_item/B)
	return sorttext(initial(B.name), initial(A.name))

/proc/cmp_numbered_displays_name_asc(datum/numbered_display/A, datum/numbered_display/B)
	return sorttext(A.sample_object.name, B.sample_object.name)

/proc/cmp_numbered_displays_name_dsc(datum/numbered_display/A, datum/numbered_display/B)
	return sorttext(B.sample_object.name, A.sample_object.name)

/proc/cmp_quirk_asc(datum/quirk/A, datum/quirk/B)
	if(!ispath(A) || !ispath(B))
		return TRUE // sure
	var/a_sign = num2sign(initial(A.value) * -1)
	var/b_sign = num2sign(initial(B.value) * -1)

	// Neutral traits go last
	// if(a_sign == 0)
	// 	a_sign = 2
	// if(b_sign == 0)
	// 	b_sign = 2 // neutral traits go wherever I feel like, and I feel like they should go in the middle

	var/a_name = initial(A.name)
	var/b_name = initial(B.name)

	if(a_sign != b_sign)
		return a_sign - b_sign
	else
		return sorttext(b_name, a_name)

/proc/cmp_item_block_priority_asc(obj/item/A, obj/item/B)
	return A.block_priority - B.block_priority

/proc/cmp_skill_categories(datum/skill/A, datum/skill/B)
	if(A.ui_category == B.ui_category)
		return sorttext(A.name, B.name)
	return sorttext(A.ui_category, B.ui_category)

/proc/cmp_chemical_reactions_default(datum/chemical_reaction/A, datum/chemical_reaction/B)
	if(A.priority != B.priority)
		return B.priority - A.priority
	else if(A.is_cold_recipe)
		return A.required_temp - B.required_temp		//return coldest
	else
		return B.required_temp - A.required_temp		//return hottest


/proc/cmp_mob_realname_dsc(mob/A,mob/B)
	return sorttext(A.real_name,B.real_name)

/proc/cmp_job_display_asc(datum/job/A, datum/job/B)
	return A.display_order - B.display_order

/proc/cmp_reagents_asc(datum/reagent/a, datum/reagent/b)
	return sorttext(initial(b.name),initial(a.name))

/proc/cmp_typepaths_asc(A, B)
	return sorttext("[B]","[A]")

/proc/cmp_typepaths_length_asc(A, B)
	return length("[A]") - length("[B]")
