local _, ns = ...

ns.Filger_Settings = {
	configMode = false,
	flash = false,
	flashDuration = 0.5,
	flashThreshold = 5,
}

--[[ CD-Example
		{
			Name = "COOLDOWN",
			Direction = "RIGHT",
			Interval = 4,
			Mode = "ICON",
			Anchor = { "CENTER", UIParent, "CENTER", 0, -100 },

			-- Wild Growth/Wildwuchs
			{ spellID = 48438, size = 32, filter = "CD" },
		},

	ICD-Example
	-- Power Torrent
	{ spellID = 74241, trigger = "BUFF", size = 47, duration = 45, slotID = 16, filter = "ICD" }, -- if slotID not specified, spellID is used as icon
]]

ns.Filger_Spells = {
	["DRUID"] = {
		{
			Name = "SHORT_COOLDOWN",
			Direction = "HORIZONTAL",
			Interval = 1,
			Mode = "ICON",
			Opacity = 0.5,
			Merge = true,
			Filter = "CD",
			Size = 37,
			Anchor = { "LEFT", UIParent, "CENTER", 0, -40 },

			-- Skull Bash
			{ spellID = 106839 },
			-- Mangle (Bear)
			--{ spellID = 33878 },
			-- Growl
			{ spellID = 6795 },
			-- Trash
			{ spellID = 77758 },
			-- Swipe (Bear)
			--{ spellID = 779 },
			-- Wild Charge
			{ spellID = 102401 },
			-- Maul
			{ spellID = 6807 },
			-- Nature's Cure
			-- { spellID = 88423 },
			-- Starsurge
			{ spellID = 78674 },
			-- Wild Mushroom: Bloom
			--{ spellID = 102791 },
			-- Wild Mushroom: Detonate
			--{ spellID = 88751 },
			-- Typhoon
			{ spellID = 132469 },
			-- Lacerate
			{ spellID = 33745 },
			-- Maim
			{ spellID = 22570 },
		},
		{
			Name = "COOLDOWN",
			Direction = "UP",
			Interval = 1,
			Mode = "ICON",
			Opacity = 1.0,
			Merge = true,
			Filter = "CD",
			Size = 47,
			--ForceSize = true,
			Anchor = { "LEFT", UIParent, "CENTER", 198, -88 },

			-- Nature's Swiftness
			{ spellID = 132158 },
			-- Innervate
			--{ spellID = 29166 },
			-- Barkskin
			{ spellID = 22812 },
			-- Incarnation
			--{ spellID = 106731 },
			-- Tranquility
			{ spellID = 740 },
			-- Berserk
			{ spellID = 106952 },
			-- Tiger Fury
			{ spellID = 5217 },
			-- Survival Instincts
			{ spellID = 61336 },
			-- Enrage
			--{ spellID = 5229 },
			-- Dash
			{ spellID = 1850 },
			-- Stampeding Roar
			{ spellID = 77764 },
			-- -- Stampeding Roar
			-- { spellID = 77761 },
			-- -- Stampeding Roar
			-- { spellID = 106898 },
			---- Challenging Roar
			--{ spellID = 5209 },
			-- Mighty Bash
			{ spellID = 5211 },
			-- Bear Hug
			--{ spellID = 102795 },
			-- Celestial Alignment
			{ spellID = 112071 },
			-- Ironbark: 102342 --> not needed, already on heal interface
			-- Solar Beam
			{ spellID = 78675 },
			-- Starfall
			{ spellID = 48505 },
			-- Cenarion Ward: 102351 --> not needed, already on heal interface
			-- Demoralizing Roar
			{ spellID = 99 },
			-- Displacer Beast
			{ spellID = 102280 },
			-- Force of Nature
			--{ spellID = 106737 },
			-- Heart of the Wild
			--{ spellID = 108288 },
			-- Mass Entanglement
			{ spellID = 102359 },
			-- Nature's Vigil
			{ spellID = 124974 },
			-- Renewal
			{ spellID = 108238 },
			-- Ursol's Vortex
			{ spellID = 102793 },
			-- Nature's Grasp
			--{ spellID = 16689 },
			-- Rebirth: 20484 --> not needed, already on heal interface
			-- Might of Ursoc
			--{ spellID = 106922 },
			-- Incarnation - Tree of life
			{ spellID = 33891 },

			-- Nature's Grace
			--{ spellID = 16886, filter = "ICD", trigger = "BUFF", duration = 60 },
		},
		{
			Name = "PLAYER_PROC",
			Direction = "HORIZONTAL",
			Interval = 1,
			Mode = "ICON",
			Opacity = 0.5,
			Merge = true,
			Anchor = { "LEFT", UIParent, "CENTER", 0, 210 },

			-- Eclipse (Lunar)/Mondfinsternis
			--{ spellID = 48518, size = 47, unitId = "player", caster = "player", filter = "BUFF" },
			-- Eclipse (Solar)/Sonnenfinsternis
			--{ spellID = 48517, size = 47, unitId = "player", caster = "player", filter = "BUFF" },
			-- Shooting Stars/Sternschnuppen
			{ spellID = 93400, size = 47, unitId = "player", caster = "player", filter = "BUFF" },
			-- Clearcasting/Freizaubern
			{ spellID = 16870, size = 47, unitId = "player", caster = "player", filter = "BUFF" },
			-- -- Berserk lacerate/mangle proc
			-- { spellID = 93622, size = 47, unitId = "player", caster = "player", filter = "BUFF" },
			-- Dream of Cenarius
			{ spellID = 108373, size = 47, unitId = "player", caster = "player", filter = "BUFF" },

			-- Harmony (Healer Mastery Buff)
			{ spellID = 100977, size = 60, unitId = "player", filter = "IBUFF", spec = 4, incombat = true },
		},
		{
			Name = "PLAYER_BUFF",
			Direction = "LEFT",
			Interval = 1,
			Opacity = 0.8,
			Mode = "ICON",
			Merge = true,
			Size = 37,
			Filter = "BUFF",
			UnitId = "player",
			Anchor = { "RIGHT", UIParent, "CENTER", -148, 0 },

			-- Barkskin/Baumrinde
			{ spellID = 22812, caster = "player" },
			-- Innervate/Anregen
			--{ spellID = 29166, caster = "all" },
			-- Incarnation
			{ spellID = 117679, caster = "player" },
			-- Nature's Grace
			--{ spellID = 16886, caster = "player" },
			-- Dash
			{ spellID = 1850, caster = "player" },
			-- Stampeding Roar
			{ spellID = 77761, caster = "all" },
			-- Owlkin Frenzy
			--{ spellID = 48393, caster = "player" },
			-- Solar Beam
			{ spellID = 78675, caster = "player" },
			-- Starfall
			{ spellID = 48505, caster = "player" },
			-- Heart of the Wild
			--{ spellID = 108288, caster = "player" },
			-- Nature's Grasp
			--{ spellID = 16689, caster = "player" },
			-- Nature's Vigil
			{ spellID = 124974, caster = "player" },
			-- Nature's Swiftness
			{ spellID = 132158, caster = "player" },
		},
		{
			Name = "PLAYER_FERAL_BUFF",
			Direction = "LEFT",
			Interval = 1,
			Opacity = 0.8,
			Mode = "ICON",
			Size = 37,
			Filter = "BUFF",
			UnitId = "player",
			Anchor = { "RIGHT", UIParent, "CENTER", -37, -88 },

			-- -- Pulverize
			-- { spellID = 80313, caster = "player" },
			-- Savage Roar/Wildes Brüllen
			{ spellID = 52610, caster = "player" },
			-- Tiger Fury
			{ spellID = 5217, caster = "player" },
			-- Survival Instincts/Überlebensinstinkte
			{ spellID = 61336, caster = "player" },
			-- Berserk
			{ spellID = 50334, caster = "player" },
			-- Might of Ursoc
			--{ spellID = 106922, caster = "player" },
			-- Predatory Swiftness
			{ spellID = 16974, caster = "player" },
		},
		{
			Name = "TARGET_FERAL_DEBUFF",
			Direction = "RIGHT",
			Interval = 1,
			Mode = "ICON",
			Size = 38,
			Filter = "DEBUFF",
			UnitId = "target",
			Anchor = { "LEFT", UIParent, "CENTER", 37, -88 },
 
			-- Rake/Krallenhieb
			{ spellID = 1822, caster = "player" },
			-- Rip/Zerfetzen
			{ spellID = 1079, caster = "player" },
			-- Lacerate/Aufschlitzen
			{ spellID = 33745, caster = "player" },
			-- Thrash
			{ spellID = 77758, caster = "player", spec = 2 },
			-- Pounce Bleed/Anspringblutung
			--{ spellID = 9007, caster = "player" },
			-- Demoralizing Roar
			{ spellID = 99, caster = "player" },
			-- Mangle/Zerfleischen
			--{ spellID = 33876, caster = "player" },
			-- Faerie Fire/Feenfeuer
			{ spellID = 770, caster = "player" },
			-- Bear Hug
			--{ spellID = 102795, caster = "player" },
			-- Skull Bash
			{ spellID = 106839, caster = "player" },
			-- Mighty Bash
			{ spellID = 5211, caster = "player" },
			-- Thrash
			{ spellID = 106830, caster = "player", spec = 3 },

			-- -- Hibernate/Winterschlaf
			-- { spellID = 2637, caster = "all" },
			-- -- Moonfire
			-- { spellID = 8921, caster = "player" },
			-- -- Entangling Roots/Wucherwurzeln
			-- { spellID = 339, caster = "all" },
		},
		{
			Name = "FOCUS_DEBUFF",
			Direction = "UP",
			IconSide = "LEFT",
			Interval = 1,
			Mode = "ICON",
			Anchor = { "LEFT", UIParent, "CENTER", 148, 100 },

			-- Hibernate/Winterschlaf
			--{ spellID = 2637, size = 32, unitId = "focus", caster = "all", filter = "DEBUFF" },
			-- Entangling Roots/Wucherwurzeln
			{ spellID = 339, size = 32, unitId = "focus", caster = "all", filter = "DEBUFF" },
			-- Cyclone/Wirbelsturm
			{ spellID = 33786, size = 32, unitId = "focus", caster = "all", filter = "DEBUFF" },
		},
	},
	["ROGUE"] = {
		{
			Name = "PLAYER_BUFF",
			Direction = "LEFT",
			Interval = 1,
			Opacity = 0.8,
			Mode = "ICON",
			Merge = true,
			Size = 37,
			Filter = "BUFF",
			UnitId = "player",
			Anchor = { "RIGHT", UIParent, "CENTER", -148, 0 },

			-- Slice and Dice
			{ spellID = 5171, caster = "player", spec = 2 },
			-- Slice and Dice missing
			{ spellID = 5171, size = 60, unitId = "player", filter = "IBUFF", spec = 2, incombat = true },
			-- Conversion
			{ spellID = 73651, caster = "player" },
		},
		{
			Name = "TARGET_DEBUFF",
			Direction = "RIGHT",
			Interval = 1,
			Mode = "ICON",
			Size = 38,
			Filter = "DEBUFF",
			UnitId = "target",
			Anchor = { "LEFT", UIParent, "CENTER", 37, -88 },

			-- Rupture
			{ spellID = 1943, caster = "player" },
			-- Rupture missing
			{ spellID = 1943, size = 60, unitId = "target", filter = "IDEBUFF", spec = 1, incombat = true },
			-- Revealing strike
			{ spellID = 84617, caster = "player" },
			-- Crimson tempest
			{ spellID = 121411, caster = "player" },
		},
		{
			Name = "FOCUS_DEBUFF",
			Direction = "UP",
			IconSide = "LEFT",
			Interval = 1,
			Mode = "ICON",
			UnitId = "focus",
			Anchor = { "LEFT", UIParent, "CENTER", 148, 100 },

			-- Sap
			{ spellID = 6770, caster = "player" },
		},
		{
			Name = "SHORT_COOLDOWN",
			Direction = "HORIZONTAL",
			Interval = 1,
			Mode = "ICON",
			Opacity = 0.5,
			Merge = true,
			Filter = "CD",
			Size = 37,
			Anchor = { "LEFT", UIParent, "CENTER", 0, -40 },

			-- Kick
			{ spellID = 1766 },
			-- Kriss
			{ spellID = 5938 },
			-- Cloak of shadows
			{ spellID = 31224 },
			-- Killing Spree
			{ spellID = 51690 },

		},
		{
			Name = "COOLDOWN",
			Direction = "UP",
			Interval = 1,
			Mode = "ICON",
			Opacity = 1.0,
			Merge = true,
			Filter = "CD",
			Size = 47,
			--ForceSize = true,
			Anchor = { "LEFT", UIParent, "CENTER", 198, -88 },

			-- Vanish
			{ spellID = 1856 },
			-- Blind
			{ spellID = 2094 },
			-- Sprint
			{ spellID = 2983 },
			-- Evade
			{ spellID = 5277 },
			-- Adrenaline Rush
			{ spellID = 13750 },
			-- Preparation
			{ spellID = 14185 },
			-- Promptitude au combat
			{ spellID = 74001 },
			-- Bombe fumigene
			{ spellID = 76577 },
			-- Vendetta
			{ spellID = 79140 },
			-- Voile de dissimulation
			{ spellID = 114018 },
			-- Renvoi de l'ombre
			{ spellID = 152151 }
		},
	},
--[[
	["MONK"] = {
		{
			Name = "PLAYER_BUFF",
			Direction = "LEFT",
			Interval = 1,
			Opacity = 0.8,
			Mode = "ICON",
			Merge = true,
			Size = 37,
			Filter = "BUFF",
			UnitId = "player",
			Anchor = { "RIGHT", UIParent, "CENTER", -148, 0 },

			-- Tiger Palm
			{ spellID = 100787, caster = "player" },
			-- Death Note
			{ spellID = 121125, caster = "player" },
			-- Fortifying Brew
			{ spellID = 120954, caster = "player" },
			-- Tiger Power
			{ spellID = 125359, caster = "player" },
			-- Path of Blossoms
			{ spellID = 124336, caster = "player" },
			-- Spinning Crane Kick
			{ spellID = 101546, caster = "player" },
			-- Zen Meditation
			{ spellID = 131523, caster = "player" },
			-- Energizing Brew
			{ spellID = 115288, caster = "player" },
			-- Tigereye Brew
			{ spellID = 125195, caster = "player" },
			-- Tiger Strikes
			{ spellID = 120273, caster = "player" },
			
		},
		{
			Name = "TARGET_DEBUFF",
			Direction = "RIGHT",
			Interval = 1,
			Mode = "ICON",
			Size = 38,
			Filter = "DEBUFF",
			UnitId = "target",
			Anchor = { "LEFT", UIParent, "CENTER", 37, -88 },

			-- Leg Sweep
			{ spellID = 119381, caster = "player" },
			-- Paralysis
			{ spellID = 115078, caster = "player" },
			-- Disable
			{ spellID = 116095, caster = "player" },
		},
		{
			Name = "FOCUS_DEBUFF",
			Direction = "UP",
			IconSide = "LEFT",
			Interval = 1,
			Mode = "ICON",
			Anchor = { "LEFT", UIParent, "CENTER", 148, 100 },

			-- Paralysis
			{ spellID = 115078, caster = "player" },
		},
		{
			Name = "SHORT_COOLDOWN",
			Direction = "HORIZONTAL",
			Interval = 1,
			Mode = "ICON",
			Opacity = 0.5,
			Merge = true,
			Filter = "CD",
			Size = 37,
			Anchor = { "LEFT", UIParent, "CENTER", 0, -40 },

			-- Elusive Brew
			{ spellID = 115308 },
			-- Keg Smash
			{ spellID = 121253 },
			-- Rising Sun Kick
			{ spellID = 107428 },
			-- Detox
			{ spellID = 115450 },
			-- Expel Harm (15 sec)
			{ spellID = 115072 },
			-- Paralysis (15 sec)
			{ spellID = 115078 },
			-- Spear Hand Strike (15 sec)
			{ spellID = 116705 },
		},
		{
			Name = "COOLDOWN",
			Direction = "UP",
			Interval = 1,
			Mode = "ICON",
			Opacity = 1.0,
			Merge = true,
			Filter = "CD",
			Size = 47,
			--ForceSize = true,
			Anchor = { "LEFT", UIParent, "CENTER", 198, -88 },

			-- Fortifying Brew
			{ spellID = 115203 },
			-- Grapple Weapon
			{ spellID = 117368 },
			-- Touch of Death
			{ spellID = 115080 },
			-- Zen Meditation
			{ spellID = 115176 },
			-- Energizing Brew
			{ spellID = 115288 },
			-- Touch of Karma
			{ spellID = 122470 },
			-- Summon Black Ox
			{ spellID = 115315 },
			-- Avert Harm
			{ spellID = 115213 },
			-- Guard
			{ spellID = 115295 },
			-- Clash
			{ spellID = 122057 },
			-- Revival
			{ spellID = 115310 },
			-- Summon Jade Serpent Statue
			{ spellID = 115313 },
			-- Fists of Fury (25 sec)
			{ spellID = 113656 },
			-- Flying Serpent Kick (25 sec)
			{ spellID = 101545 },
			-- Thunder Focus Tea
			{ spellID = 116680 },
			-- Life Cocoon
			{ spellID = 116849 },
			-- Diffuse Magic
			{ spellID = 122783 },
			-- Dampen Harm
			{ spellID = 122278 },
			-- Leg Sweep
			{ spellID = 119381 },
		},
	},
--]]
	["ALL"] = {
		{
			Name = "MISTSOFPANDARIA", -- list compiled by Ryn
			Enable = false,
			Direction = "LEFT",
			Interval = 4,
			Mode = "ICON",
			Opacity = 1,
			Size = 47,
			Anchor = { "RIGHT", UIParent, "CENTER", -240, -80 },

			-- [[ OUTDOOR BOSSES ]] --
			--Sha of Anger
			-- Seethe
			{ spellID = 119487, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Aggressive Behavior
			{ spellID = 119626, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Unleashed Wrath
			{ spellID = 119488, unitId = "player", caster = "all", filter = "DEBUFF" },
			
			--Salys's Warband
			-- Stomp
			{ spellID = 121787, unitId = "player", caster = "all", filter = "DEBUFF" },
			
			
			-- [[ HEART OF FEAR ]] --
			-- Imperial Vizier Zor'lok
			-- Exhale
			{ spellID = 122761, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Convert
			{ spellID = 122740, unitId = "player", caster = "all", filter = "DEBUFF" },
			
			-- Blade Lord Ta'yak
			-- Overwhelming Assault
			{ spellID = 123474, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Windstep
			{ spellID = 123175, unitId = "player", caster = "all", filter = "DEBUFF" },
			
			-- Garalon
			-- Pheromones
			{ spellID = 123092, unitId = "player", caster = "all", filter = "DEBUFF" },
			
			-- Wind Lord Mel'Jarak
			-- Wind Bomb
			{ spellID = 131813, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Amber Prison
			{ spellID = 121876, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Corrosive Resin
			{ spellID = 122064, unitId = "player", caster = "all", filter = "DEBUFF" },
			
			-- Amber-Shaper Un'sok
			-- Burning Amber
			{ spellID = 122504, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Parasitic Growth
			{ spellID = 121949, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Mutated Construct -- Need to get an ID when MoP is live
			-- Amber Strike
			{ spellID = 122389, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Fling
			{ spellID = 122413, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Amber Globule
			{ spellID = 125498, unitId = "player", caster = "all", filter = "DEBUFF" },
			
			-- Grand Empress Shek'zeer
			-- Eyes of the Empress
			{ spellID = 123707, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Fixate -- Need to get an ID when MoP is live
			-- Sticky Resin
			{ spellID = 124097, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Poison-Drenched Armor
			{ spellID = 124821, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Consuming Terror
			{ spellID = 124849, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Visions of Demise
			{ spellID = 124862, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Heart of Fear
			{ spellID = 123845, unitId = "player", caster = "all", filter = "DEBUFF" },
			
			-- [[ MOGU'SHAN VAULTS ]] --
			-- The Stone Guard
			-- Amethyst Pool
			{ spellID = 116235, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Jasper Chains
			{ spellID = 130395, unitId = "player", caster = "all", filter = "DEBUFF" },
			
			-- Feng the Accursed
			-- Lightning Last
			{ spellID = 131788, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Arcane Shock
			{ spellID = 131790, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Shadowburn
			{ spellID = 131792, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Wildfire Spark
			{ spellID = 116583, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Arcane Resonance
			{ spellID = 116417, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Chains of Shadow
			{ spellID = 118783, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Nullification Barrier
			{ spellID = 115856, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Shroud of Reversal
			{ spellID = 115911, unitId = "player", caster = "all", filter = "DEBUFF" },
			
			-- Garajal the Spiritbinder
			-- Cross Over
			{ spellID = 116166, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Voodoo Dolls
			{ spellID = 116000, unitId = "player", caster = "all", filter = "DEBUFF" },
			
			-- Elegon
			-- Overcharged
			{ spellID = 117878, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Closed Circuit
			{ spellID = 117949, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Energy Cascade
			{ spellID = 119722, unitId = "player", caster = "all", filter = "DEBUFF" },
			
			-- Will of the Emperor
			-- Focused Assault
			{ spellID = 116525, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Focused Defense
			{ spellID = 116778, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Focused Energy
			{ spellID = 116829, unitId = "player", caster = "all", filter = "DEBUFF" },
			
			-- [[ TERRACE OF ENDLESS SPRING ]] --
			-- Protector of the Endless
			-- Defiled Ground
			{ spellID = 117986, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Lightning Prison
			{ spellID = 117398, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Corrupted Essence
			{ spellID = 117905, unitId = "player", caster = "all", filter = "DEBUFF" },
			
			-- Tsulong
			-- Dread Shadows
			{ spellID = 122768, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Shadow Breath
			{ spellID = 122752, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Terrorize
			{ spellID = 123011, unitId = "player", caster = "all", filter = "DEBUFF" },
			
			-- Lei Shi
			-- Spray
			{ spellID = 123121, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Scary Fog
			{ spellID = 123705, unitId = "player", caster = "all", filter = "DEBUFF" },
		},
		{
			Name = "CATACLYSM", -- list by jasje, taken from aurawatch.lua
			Enable = false,
			Direction = "LEFT",
			Interval = 4,
			Mode = "ICON",
			Opacity = 1,
			Size = 47,
			Anchor = { "RIGHT", UIParent, "CENTER", -240, -80 },

-- Baradin Hold
			-- Consuming Darkness
--DELETED			{ spellID = 95173, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Meteor Slash / Meteorschlag (Argaloth)
			{ spellID = 88942, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Gaze of Occu'thar
			{ spellID = 97028, unitId = "player", caster = "all", filter = "DEBUFF" },
-- Blackwing Descent
		-- Magmaw
			-- Constricting Chains
--DELETED			{ spellID = 91911, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Parasitic Infection
--DELETED			{ spellID = 94679, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Mangle
--			{ spellID = 94617, unitId = "player", caster = "all", filter = "DEBUFF" },
		-- Omintron Defense System	
			-- Poison Soaked Shell	
			{ spellID = 79835, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Lightning Conductor
--DELETED			{ spellID = 91433, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Incineration Security Measure
--DELETED			{ spellID = 91521, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Power Conversion - Arcanotron
			{ spellID = 79729, unitId = "focus", caster = "all", filter = "BUFF" },
			-- Power Conversion - Arcanotron
--DELETED			{ spellID = 91547, unitId = "player", caster = "all", filter = "BUFF" },
		-- Maloriak	
			-- Flash Freeze
			{ spellID = 77699, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Biting Chill
			{ spellID = 77760, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Dark Sludge
--DELETED			{ spellID = 92988, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- remedy -- for spellsteal 
			{ spellID = 77912, unitId = "target", caster = "all", filter = "BUFF" },
			-- remedy -- for spellsteal  - focus
			{ spellID = 77912, unitId = "focus", caster = "all", filter = "BUFF" },
		-- Atramedes
			-- Searing Flame
--DELETED			{ spellID = 92423, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Roaring Flame
--DELETED			{ spellID = 92485, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Sonic Breath
--DELETED			{ spellID = 92407, unitId = "player", caster = "all", filter = "DEBUFF" },
		-- Chimaeron	
			-- Break
			{ spellID = 82881, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Low Health
			{ spellID = 89084, unitId = "player", caster = "all", filter = "DEBUFF" },
		-- Nefarian	
			-- Shadow Conductor
			{ spellID = 92053, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Stolen Power
			{ spellID = 80627, unitId = "player", caster = "all", filter = "BUFF" },
-- The Bastion of Twilight
		--Valiona & Theralion
			-- Blackout
--DELETED			{ spellID = 92878, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Devouring Flames
			{ spellID = 86840, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Engulfing Magic
			{ spellID = 86622, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Twilight Meteorite
			{ spellID = 86013, unitId = "player", caster = "all", filter = "DEBUFF" },
		-- Halfus Wyrmbreaker	
			-- Malevolent Strikes
			{ spellID = 39171, unitId = "player", caster = "all", filter = "DEBUFF" },
		-- Twilight Ascendant Council
			-- Burning Blood
			{ spellID = 82662, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Hydro Lance
--DELETED			{ spellID = 92511, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Waterlogged
			{ spellID = 82762, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Frozen
--DELETED			{ spellID = 92505, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Flame Torrent
--DELETED			{ spellID = 92518, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Lightning Rod
			{ spellID = 83099, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Gravity Core
			{ spellID = 92075, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Gravity Crush
--DELETED			{ spellID = 92488, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Static Overload
			{ spellID = 92067, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Frost Beacon
			{ spellID = 92307, unitId = "player", caster = "all", filter = "DEBUFF" },
		-- Cho'gall	
			-- Corruption: Accelerated
			{ spellID = 81836, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Corruption: Malformation
			{ spellID = 82125, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Corruption: Absolute
			{ spellID = 82170, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Corruption: Sickness
--DELETED			{ spellID = 93200, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Cho's Blast
			{ spellID = 86028, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Gall's Blast
			{ spellID = 86029, unitId = "player", caster = "all", filter = "DEBUFF" },
		-- Sinestra
			-- Wrack
			{ spellID = 89435, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Essence of the Red
			{ spellID = 87946, unitId = "player", caster = "all", filter = "BUFF" },
			
-- Throne of the Four Winds
	-- Conclave of Wind
		-- Nezir <Lord of the North Wind>
			-- Wind Chill
--DELETED			{ spellID = 93123, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Ice Patch
--DELETED			{ spellID = 93131, unitId = "player", caster = "all", filter = "DEBUFF" },
		-- Anshal <Lord of the West Wind>
			-- Soothing Breeze
			{ spellID = 86206, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Toxic Spores
--DELETED			{ spellID = 93122, unitId = "player", caster = "all", filter = "DEBUFF" },
		-- Rohash <Lord of the East Wind>
			-- Slicing Gale
--DELETED			{ spellID = 93058, unitId = "player", caster = "all", filter = "DEBUFF" },
		-- Al'Akir
			-- Ice Storm
--DELETED			{ spellID = 93260, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Ice Storm
--DELETED			{ spellID = 93271, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Lightning Rod
--DELETED			{ spellID = 93295, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Static Shock / Statischer Schock (Al'Akir)
			{ spellID = 87873, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Acid Rain / Säureregen (Al'Akir)
--DELETED			{ spellID = 93279, unitId = "player", caster = "all", filter = "DEBUFF" },
-- Firelands
		--Trash
			-- Melt Armor
			{ spellID = 99532, unitId = "player", caster = "all", filter = "DEBUFF" },		
		--Shannox
			-- Magma Rupture
			{ spellID = 99840, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Crystal Prison Trap 
			{ spellID = 99837, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Jagged Tear
			{ spellID = 99936, unitId = "player", caster = "all", filter = "DEBUFF" },
		-- Lord Rhyolith	
			-- Eruption
			{ spellID = 98492, unitId = "player", caster = "all", filter = "DEBUFF" },
		-- Alysrazor	
			-- Molten Feather
			{ spellID = 97128, unitId = "player", caster = "all", filter = "BUFF" },
			-- Wings of Flame
			{ spellID = 98619, unitId = "player", caster = "all", filter = "BUFF" },
			-- Blazing Power
			{ spellID = 99461, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Alysra's Razor
			{ spellID = 100029, unitId = "player", caster = "all", filter = "DEBUFF" },
		-- Beth'tilac	
			-- The Widow's Kiss
			{ spellID = 99476, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Fixate (Heroic)
			{ spellID = 99526, unitId = "player", caster = "all", filter = "DEBUFF", absID = true },
			-- Volatile Poison (Heroic)
			{ spellID = 99278, unitId = "player", caster = "all", filter = "DEBUFF" },
		-- Baleroc	
			-- Torment
			{ spellID = 99256, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Tormented
			{ spellID = 99257, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Blaze of Glory
			{ spellID = 99252, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Vital Flame
			{ spellID = 99262, unitId = "player", caster = "all", filter = "BUFF" },
			-- Vital Spark
			{ spellID = 99263, unitId = "player", caster = "all", filter = "BUFF" },
			-- Countdown
			{ spellID = 99516, unitId = "player", caster = "all", filter = "BUFF" },
		-- Majordomo Staghelm	
			-- Searing Seeds
			{ spellID = 98450, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Burning Orbs
			{ spellID = 98451, unitId = "player", caster = "all", filter = "DEBUFF" },
		-- Ragnaros	
			-- Blazing Heat
			{ spellID = 100460, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Burning Wound 
--DELETED			{ spellID = 101239, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Fixate
			{ spellID = 99849, unitId = "player", caster = "all", filter = "DEBUFF", absID = true },
			-- Magma Trap Vulnerability
			{ spellID = 100238, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Superheated
			{ spellID = 100594, unitId = "player", caster = "all", filter = "DEBUFF" },

-- Dragon Soul
		--Morchok
			-- Safe
			{ spellID = 103541, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Warning
			{ spellID = 103536, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Danger
			{ spellID = 103534, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Black Blood of the Earth
--DELETED			{ spellID = 108570, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Crush Armor
			{ spellID = 33661, unitId = "player", caster = "all", filter = "DEBUFF" },
		--Warlord Zon'ozz
			-- Disrupting Shadows
			{ spellID = 103434, unitId = "player", caster = "all", filter = "DEBUFF" },
		--Yor'sahj the Unsleeping
			-- Deep Corruption
			{ spellID = 103628, unitId = "player", caster = "all", filter = "DEBUFF" },
		--Hagara the Stormbinder
			-- Frostflake
			{ spellID = 109325, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Target
			{ spellID = 105285, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Shattered Ice
			{ spellID = 105289, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Ice Tomb
			{ spellID = 104451, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Ice Lance
--DELETED			{ spellID = 107061, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Lightning Storm
			{ spellID = 105465, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Watery Entrenchment
			{ spellID = 105259, unitId = "player", caster = "all", filter = "DEBUFF" },
		--Ultraxion
			-- Looming Darkness
			{ spellID = 106498, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Twilight Burst
			{ spellID = 106415, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Fading Light
			{ spellID = 109075, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Gift of Life
			{ spellID = 105896, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Essence of Dreams
			{ spellID = 105900, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Source of Magic
			{ spellID = 105903, unitId = "player", caster = "all", filter = "DEBUFF" },
		--Warmaster Blackhorn
			-- Twilight Barrage
--DELETED			{ spellID = 109204, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Sunder Armor
			{ spellID = 108043, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Shockwave
			{ spellID = 108046, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Brutal Strike
			{ spellID = 107567, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Degeneration
			{ spellID = 107558, unitId = "player", caster = "all", filter = "DEBUFF" },
		--Spine of Deathwing
			-- Searing Plasma
			{ spellID = 105479, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Fiery Grip
			{ spellID = 105490, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Grasping Tendrils
			{ spellID = 105563, unitId = "player", caster = "all", filter = "DEBUFF" },
		--Madness of Deathwing
			-- Shrapnel
--DELETED			{ spellID = 109597, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Degenerative Bite
			{ spellID = 105841, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Blistering heat
			{ spellID = 105445, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Tetanus
--DELETED			{ spellID = 109603, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Corrupting Parasite -- HM
			{ spellID = 108649, unitId = "player", caster = "all", filter = "DEBUFF" },
		},
		{
			Name = "WRATHOFTHELICHKING",
			Enable = false,
			Direction = "LEFT",
			Interval = 4,
			Mode = "ICON",
			Opacity = 1,
			Size = 47,
			Anchor = { "RIGHT", UIParent, "CENTER", -240, -80 },

	-- ICC
		-- Deathbringer Saurfang
			-- Mark of the Fallen Champion
			{ spellID = 72293, size = 68, unitId = "player", caster = "all", filter = "DEBUFF" },
		-- Festergut
			-- Inoculated
--DELETED			{ spellID = 72103, size = 68, unitId = "player", caster = "all", filter = "DEBUFF" },
		-- Rotface
			-- Mutated Infection
--DELETED			{ spellID = 71224, size = 68, unitId = "player", caster = "all", filter = "DEBUFF" },
		-- Professor Putricide
			-- Unbound Plague
--DELETED			{ spellID = 72856, size = 68, unitId = "player", caster = "all", filter = "DEBUFF" },
			--Plague Sickness
--DELETED			{ spellID = 73117, size = 68, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Gas Variable
			{ spellID = 70353, size = 68, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Ooze Variable
			{ spellID = 70352, size = 68, unitId = "player", caster = "all", filter = "DEBUFF" },
		-- Bloodqueen Lana'thel
			-- Pact of the Darkfallen
			{ spellID = 71340, size = 68, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Swarming Shadows
			{ spellID = 71861, size = 68, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Essence of the Blood Queen
--DELETED			{ spellID = 71473, size = 68, unitId = "player", caster = "all", filter = "DEBUFF" },
		-- Sindragosa
			-- Frost Bomb
--DELETED			{ spellID = 71053, size = 68, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Instability
			{ spellID = 69766, size = 68, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Unchained Magic
			{ spellID = 69762, size = 68, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Mystic Buffet
			{ spellID = 70128, size = 68, unitId = "player", caster = "all", filter = "DEBUFF" },
		-- Arthas - The Lich King
			-- Necrotic Plague
--DELETED			{ spellID = 73912, size = 68, unitId = "player", caster = "all", filter = "DEBUFF" },
		-- Halion
			--Fiery Combustion/Feurige Einäscherung (Halion)
			{ spellID = 74562, size = 68, unitId = "player", caster = "all", filter = "DEBUFF" },
			--Soul Consumption/Seelenverzehrung (Halion)
			{ spellID = 74792, size = 68, unitId = "player", caster = "all", filter = "DEBUFF" },
		},
	},
}