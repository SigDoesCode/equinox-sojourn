/obj/item/gun/projectile/automatic/c20r
	name = "\"C-20r\" SMG"
	desc = "A bullpup submachine gun that could be chambered in either 9mm Auto or 10mm Magnum by virtue of it's peculiar hybrid barrel threads."
	icon = 'icons/obj/guns/projectile/cr20.dmi'
	icon_state = "c20r"
	item_state = "c20r"
	w_class = ITEM_SIZE_NORMAL
	force = WEAPON_FORCE_PAINFUL
	caliber = CAL_PISTOL
	origin_tech = list(TECH_COMBAT = 5, TECH_MATERIAL = 2)
	slot_flags = SLOT_BELT|SLOT_BACK
	load_method = SINGLE_CASING|MAGAZINE
	mag_well = MAG_WELL_SMG
	auto_eject = TRUE
	matter = list(MATERIAL_PLASTEEL = 20, MATERIAL_PLASTIC = 12)
	price_tag = 2000
	auto_eject_sound = 'sound/weapons/smg_empty_alarm.ogg'
	unload_sound 	= 'sound/weapons/guns/interact/sfrifle_magout.ogg'
	reload_sound 	= 'sound/weapons/guns/interact/sfrifle_magin.ogg'
	cocked_sound 	= 'sound/weapons/guns/interact/sfrifle_cock.ogg'
	damage_multiplier = 1.2
	penetration_multiplier = 1.5
	zoom_factors = list(0.4)
	init_recoil = SMG_RECOIL(0.9)
	serial_type = "SA"

	gun_tags = list(GUN_PROJECTILE, GUN_SILENCABLE, GUN_CALIBRE_9MM, GUN_SCOPE, GUN_MAGWELL)
	gun_parts = list(/obj/item/part/gun/frame/c20r = 1, /obj/item/part/gun/grip/black = 1, /obj/item/part/gun/mechanism/smg = 1, /obj/item/part/gun/barrel/pistol = 1)

	init_firemodes = list(
		FULL_AUTO_300_NOLOSS,
		SEMI_AUTO_NODELAY,
		BURST_3_ROUND_NOLOSS
		)

	wield_delay = 0.5 SECOND
	wield_delay_factor = 0.1 // 10 vig

/obj/item/part/gun/frame/c20r
	name = "C20r frame"
	desc = "A C20r SMG frame. It can be chambered in either 9mm Auto or 10mm Magnum."
	icon_state = "frame_syndi"
	nra = FALSE
	result = /obj/item/gun/projectile/automatic/c20r
	resultvars = list(/obj/item/gun/projectile/automatic/c20r)
	gripvars = list(/obj/item/part/gun/grip/black)
	mechanismvar = /obj/item/part/gun/mechanism/smg
	barrelvars = list(/obj/item/part/gun/barrel/pistol, /obj/item/part/gun/barrel/magnum)


/obj/item/gun/projectile/automatic/c20r/update_icon()
	cut_overlays()
	icon_state = "[initial(icon_state)][silenced ? "_s" : ""]"
	if(ammo_magazine)
		add_overlay("mag[silenced ? "_s" : ""][ammo_magazine.ammo_color]")
	if (!ammo_magazine || !length(ammo_magazine.stored_ammo))
		add_overlay("slide[silenced ? "_s" : ""]")

/obj/item/gun/projectile/automatic/c20r/Initialize()
	. = ..()
	update_icon()

/obj/item/gun/projectile/automatic/c20r/sci
	name = "Soteria \"C20-m\" SMG"
	desc = "A bullpup submachine gun that could be chambered in either 9mm Auto or 10mm Magnum by virtue of it's peculiar hybrid barrel threads. This one seems to be a colony-made reproduction."
	icon = 'icons/obj/guns/projectile/si_cr20.dmi'
	damage_multiplier = 1.1
	penetration_multiplier = 1.3
	gun_parts = list(/obj/item/part/gun/frame/c20r/sci = 1, /obj/item/part/gun/grip/black = 1, /obj/item/part/gun/mechanism/smg = 1, /obj/item/part/gun/barrel/pistol = 1)
	price_tag = 500
	serial_type = "SI"

/obj/item/gun/projectile/automatic/c20r/sci/preloaded

/obj/item/gun/projectile/automatic/c20r/sci/preloaded/New()
	. = ..()
	ammo_magazine = new /obj/item/ammo_magazine/smg_35/hv(src)

/obj/item/part/gun/frame/c20r/sci
	name = "C20m frame"
	desc = "A reverse engineered C-20r frame. It can be chambered in either 9mm Auto or 10mm Magnum."
	icon_state = "frame_sci"
	result = /obj/item/gun/projectile/automatic/c20r/sci
	resultvars = list(/obj/item/gun/projectile/automatic/c20r/sci)
	gripvars = list(/obj/item/part/gun/grip/black)
	mechanismvar = /obj/item/part/gun/mechanism/smg
	barrelvars = list(/obj/item/part/gun/barrel/pistol, /obj/item/part/gun/barrel/magnum)


