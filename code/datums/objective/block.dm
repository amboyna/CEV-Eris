/datum/objective/block
	explanation_text = "Do not allow any organic lifeforms to escape on the shuttle alive."


/datum/objective/block/check_completion()
	if(!issilicon(owner.current))
		return FALSE
	if(!emergency_shuttle.returned())
		return FALSE
	if(!owner.current)
		return FALSE

	var/area/first_escape_pod = locate(/area/shuttle/escape_pod1/centcom)
	var/area/second_escape_pod = locate(/area/shuttle/escape_pod2/centcom)
	var/protected_mobs[] = list(/mob/living/silicon/ai, /mob/living/silicon/pai, /mob/living/silicon/robot)
	for(var/mob/living/player in player_list)
		if(player.type in protected_mobs)
			continue
		if(player.mind)
			if(player.stat != 2)
				if(get_turf(player) in first_escape_pod || get_turf(player) in second_escape_pod)
					return FALSE
	return TRUE
