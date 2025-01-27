/// Produces a mutable appearance glued to the [EMISSIVE_PLANE] dyed to be the [EMISSIVE_COLOR].
/proc/emissive_appearance(icon, icon_state = "", layer = FLOAT_LAYER, alpha = 255, appearance_flags = 0)
	var/mutable_appearance/appearance = mutable_appearance(
		icon = icon,
		icon_state = icon_state,
		layer = layer,
		plane = EMISSIVE_PLANE,
		flags = appearance_flags|EMISSIVE_APPEARANCE_FLAGS
	)
	appearance.alpha = alpha
	appearance.blend_mode = BLEND_OVERLAY
	appearance.color = GLOB.emissive_color
	return appearance

/// Produces a mutable appearance glued to the [EMISSIVE_PLANE] dyed to be the [EM_BLOCK_COLOR].
/proc/emissive_blocker(icon, icon_state = "", layer = FLOAT_LAYER, alpha = 255, appearance_flags = 0, source = null)
	var/mutable_appearance/appearance = mutable_appearance(
		icon = icon,
		icon_state = icon_state,
		layer = layer,
		plane = EMISSIVE_PLANE,
		flags = appearance_flags|EMISSIVE_APPEARANCE_FLAGS
	)
	appearance.alpha = alpha
	appearance.blend_mode = BLEND_OVERLAY
	appearance.color = GLOB.em_block_color
	if(source)
		appearance.render_source = source
		// Since only render_target handles transform we don't get any applied transform "stacking"
		appearance.appearance_flags |= RESET_TRANSFORM
	return appearance
