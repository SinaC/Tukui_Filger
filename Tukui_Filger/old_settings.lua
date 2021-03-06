local _, ns = ...

ns.Filger_Settings = {
	configMode = false,
	flash = true,
	flashDuration = 0.5,
	flashThreshold = 5,
}

--[[ CD-Example
		{
			Name = "COOLDOWN",
			Direction = "RIGHT",
			Interval = 4,
			Mode = "ICON",
			setPoint = { "CENTER", UIParent, "CENTER", 0, -100 },

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
			setPoint = { "LEFT", UIParent, "CENTER", 0, -40 },

			-- Skull Bash
			{ spellID = 106839 },
			-- Mangle (Bear)
			{ spellID = 33878 },
			-- Growl
			{ spellID = 6795 },
			-- Trash
			{ spellID = 77758 },
			-- Swipe (Bear)
			{ spellID = 779 },
			-- Wild Charge
			{ spellID = 102401 },
			-- Maul
			{ spellID = 6807 },
			-- Nature's Cure
			{ spellID = 88423 },
			-- Starsurge
			{ spellID = 78674 },
			-- Wild Mushroom: Bloom
			{ spellID = 102791 },
			-- Wild Mushroom: Detonate
			{ spellID = 88751 },
			-- Typhoon
			{ spellID = 132469 },
			-- Lacerate
			{ spellID = 33745 },
			-- Maim
			{ spellID = 22570 },
		},
--[[
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
			setPoint = { "LEFT", UIParent, "CENTER", 198, -88 },

			-- Nature's Swiftness
			{ spellID = 132158 },
			-- Innervate
			{ spellID = 29166 },
			-- Barkskin
			{ spellID = 22812 },
			-- Incarnation
			{ spellID = 106731 },
			-- Tranquility
			{ spellID = 740 },
			-- Berserk
			{ spellID = 106952 },
			-- Tiger Fury
			{ spellID = 5217 },
			-- Survival Instincts
			{ spellID = 61336 },
			-- Enrage
			{ spellID = 5229 },
			-- Dash
			{ spellID = 1850 },
			-- Stampeding Roar
			{ spellID = 77764 },
			-- Stampeding Roar
			{ spellID = 77761 },
			-- Stampeding Roar
			{ spellID = 106898 },
			---- Challenging Roar
			--{ spellID = 5209 },
			-- Mighty Bash
			{ spellID = 5211 },
			-- Bear Hug
			{ spellID = 102795 },

			-- Nature's Grace
			{ spellID = 16886, filter = "ICD", trigger = "BUFF", duration = 60 },
		},
		{
			Name = "P_PROC_ICON",
			Direction = "HORIZONTAL",
			Interval = 1,
			Mode = "ICON",
			Opacity = 0.5,
			Merge = true,
			setPoint = { "LEFT", UIParent, "CENTER", 0, 210 },

			-- Eclipse (Lunar)/Mondfinsternis
			{ spellID = 48518, size = 47, unitId = "player", caster = "player", filter = "BUFF" },
			-- Eclipse (Solar)/Sonnenfinsternis
			{ spellID = 48517, size = 47, unitId = "player", caster = "player", filter = "BUFF" },
			-- Shooting Stars/Sternschnuppen
			{ spellID = 93400, size = 47, unitId = "player", caster = "player", filter = "BUFF" },
			-- Clearcasting/Freizaubern
			{ spellID = 16870, size = 47, unitId = "player", caster = "player", filter = "BUFF" },
			-- -- Berserk lacerate/mangle proc
			-- { spellID = 93622, size = 47, unitId = "player", caster = "player", filter = "BUFF" },
			-- Harmony (Healer Mastery Buff)
			{ spellID = 100977, size = 60, unitId = "player", filter = "IBUFF", spec = 3, incombat = true },
		},
		{
			Name = "P_BUFF_ICON",
			Direction = "LEFT",
			Interval = 1,
			Opacity = 0.8,
			Mode = "ICON",
			Merge = true,
			Size = 37,
			Filter = "BUFF",
			UnitId = "player",
			setPoint = { "RIGHT", UIParent, "CENTER", -148, 0 },

			-- Barkskin/Baumrinde
			{ spellID = 22812, caster = "player" },
			-- Innervate/Anregen
			{ spellID = 29166, caster = "all" },
			-- Tree of Life/Baum des Lebens
			{ spellID = 33891, caster = "player" },
			-- Nature's Grace
			{ spellID = 16886, caster = "player" },
			-- Dash
			{ spellID = 1850, caster = "player" },
			-- Stampeding Roar
			{ spellID = 77761, caster = "all" },
		},
		{
			Name = "P_BUFF_ICON_FERAL",
			Direction = "LEFT",
			Interval = 1,
			Opacity = 0.8,
			Mode = "ICON",
			Size = 37,
			Filter = "BUFF",
			UnitId = "player",
			setPoint = { "RIGHT", UIParent, "CENTER", -37, -88 },

			-- Pulverize
			{ spellID = 80313, caster = "player" },
			-- Savage Roar/Wildes Br�llen
			{ spellID = 52610, caster = "player" },
			-- Tiger Fury
			{ spellID = 5217, caster = "player" },
			-- Survival Instincts/�berlebensinstinkte
			{ spellID = 61336, caster = "player" },
			-- Berserk
			{ spellID = 50334, caster = "player" },
		},
		{
			Name = "T_DEBUFF_ICON",
			Direction = "RIGHT",
			Interval = 1,
			Mode = "ICON",
			Size = 38,
			Filter = "DEBUFF",
			UnitId = "target",
			setPoint = { "LEFT", UIParent, "CENTER", 37, -88 },
 
			-- Rake/Krallenhieb
			{ spellID = 1822, caster = "player" },
			-- Rip/Zerfetzen
			{ spellID = 1079, caster = "player" },
			-- Lacerate/Aufschlitzen
			{ spellID = 33745, caster = "player" },
			-- Trash
			{ spellID = 77758, caster = "player" },
			-- Pounce Bleed/Anspringblutung
			{ spellID = 9007, caster = "player" },
			-- Demoralizing Roar
			{ spellID = 99, caster = "player" },
			-- Mangle/Zerfleischen
			{ spellID = 33876, caster = "all", spec = 2 },
			-- Faerie Fire/Feenfeuer
			{ spellID = 91565, caster = "all" },
			-- Bear Hug
			{ spellID = 102795, caster = "player" },
			-- Skull Bash
			{ spellID = 106839, caster = "player" },
		},
		{
			Name = "F/DEBUFF_BAR",
			Direction = "UP",
			IconSide = "LEFT",
			Interval = 1,
			Mode = "ICON",
			setPoint = { "LEFT", UIParent, "CENTER", 148, 100 },

			-- Hibernate/Winterschlaf
			{ spellID = 2637, size = 32, unitId = "focus", caster = "all", filter = "DEBUFF" },
			-- Entangling Roots/Wucherwurzeln
			{ spellID = 339, size = 32, unitId = "focus", caster = "all", filter = "DEBUFF" },
			-- Cyclone/Wirbelsturm
			{ spellID = 33786, size = 32, unitId = "focus", caster = "all", filter = "DEBUFF" },
		},
		-- {
			-- Name = "COOLDOWN",
			-- Direction = "UP",
			-- IconSide = "RIGHT",
			-- Interval = 0,
			-- Mode = "BAR",
			-- setPoint = { "RIGHT", UIParent, "CENTER", -294, 315 },

			-- -- Swiftmend/Rasche Heilung
			-- --{ spellID = 18562, size = 32, barWidth = 200, filter = "CD" },
			-- -- Wild Growth/Wildwuchs
			-- --{ spellID = 48438, size = 32, barWidth = 200, filter = "CD" },
			-- -- Nature Swiftness
			-- { spellID = 17116, size = 32, barWidth = 200, filter = "CD" },
			-- -- Innervate
			-- { spellID = 29166, size = 32, barWidth = 200, filter = "CD" },
			-- -- Barkskin
			-- { spellID = 22812, size = 32, barWidth = 200, filter = "CD" },
			-- -- Tree of Life
			-- { spellID = 33891, size = 32, barWidth = 200, filter = "CD" },
			-- -- Tranquility
			-- { spellID = 740, size = 32, barWidth = 200, filter = "CD" },
			-- -- Berserk
			-- { spellID = 50334, size = 32, barWidth = 200, filter = "CD" },
			-- -- Tiger Fury
			-- { spellID = 5217, size = 32, barWidth = 200, filter = "CD" },
			-- -- Survival Instincts/�berlebensinstinkte
			-- { spellID = 61336, size = 32, barWidth = 200, filter = "CD" },
		-- },
--]]
	},
--[[
--
--	["HUNTER"] = {
--		{
--			Name = "P_PROC_ICON",
--			Direction = "LEFT",
--			Interval = 4,
--			Mode = "ICON",
--			setPoint = { "RIGHT", UIParent, "CENTER", -198, -190 },
--
--			-- Lock and Load
--			{ spellID = 56342, size = 47, unitId = "player", caster = "player", filter = "BUFF" },
--			-- Fury of the Five Flights
--			{ spellID = 60314, size = 47, unitId = "player", caster = "player", filter = "BUFF" },
--			-- Quick Shots
--			--{ spellID = 6150, size = 47, unitId = "player", caster = "player", filter = "BUFF" },
--			-- Master Tactician
--			{ spellID = 34837, size = 47, unitId = "player", caster = "player", filter = "BUFF" },
--			-- Improved Steady Shot/Verbesserter zuverl�ssiger Schuss
--			{ spellID = 53224, size = 47, unitId = "player", caster = "player", filter = "BUFF" },
--			-- Expose Weakness
--			--{ spellID = 34503, size = 47, unitId = "player", caster = "player", filter = "BUFF" },
--			-- Rapid Fire
--			{ spellID = 3045, size = 47, unitId = "player", caster = "player", filter = "BUFF" },
--			-- Call of the Wild
--			{ spellID = 53434, size = 47, unitId = "player", caster = "player", filter = "BUFF" },
--			-- Mend Pet/Tier heilen
--			{ spellID = 136, size = 47, unitId = "pet", caster = "player", filter = "BUFF" },
--			-- Feed Pet/Tier f�ttern
--			{ spellID = 6991, size = 47, unitId = "pet", caster = "player", filter = "BUFF" },
--		},
--		{
--			Name = "T_DEBUFF_ICON",
--			Direction = "RIGHT",
--			Interval = 4,
--			Mode = "ICON",
--			setPoint = { "LEFT", UIParent, "CENTER", 198, -190 },
--  
--			-- Wyvern Sting
--			{ spellID = 19386, size = 47, unitId = "target", caster = "all", filter = "DEBUFF" },
--			-- Silencing Shot
--			{ spellID = 34490, size = 47, unitId = "target", caster = "all", filter = "DEBUFF" },
--			-- Serpent Sting
--			{ spellID = 1978, size = 47, unitId = "target", caster = "player", filter = "DEBUFF" },
--			-- Widow Venom/Witwentoxin
--			{ spellID = 82654, size = 47, unitId = "target", caster = "all", filter = "DEBUFF" },
--			-- Black Arrow
--			{ spellID = 3674, size = 47, unitId = "target", caster = "player", filter = "DEBUFF" },
--			-- Explosive Shot
--			{ spellID = 53301, size = 47, unitId = "target", caster = "player", filter = "DEBUFF" },
--			-- Hunter's Mark
--			{ spellID = 1130, size = 47, unitId = "target", caster = "all", filter = "DEBUFF" },
--
--		},
--		{
--			Name = "F/DEBUFF_BAR",
--			Direction = "UP",
--			IconSide = "LEFT",
--			Interval = 4,
--			Mode = "BAR",
--			setPoint = { "LEFT", UIParent, "CENTER", 198, 100 },
--
--			-- Wyvern Sting
--			{ spellID = 19386, size = 32, barWidth = 200, unitId = "focus", caster = "all", filter = "DEBUFF" },
--			-- Silencing Shot
--			{ spellID = 34490, size = 32, barWidth = 200, unitId = "focus", caster = "all", filter = "DEBUFF" },
--		},
--	},
--	["MAGE"] = {
--		{
--			Name = "P_PROC_ICON",
--			Direction = "LEFT",
--			Interval = 4,
--			Mode = "ICON",
--			setPoint = { "RIGHT", UIParent, "CENTER", -198, -190 },
--
--			-- Frostbite
--			--{ spellID = 11071, size = 47, unitId = "target", caster = "all", filter = "DEBUFF" },
--			-- Winter's Chill
--			{ spellID = 28593, size = 47, unitId = "target", caster = "player", filter = "DEBUFF" },
--			-- Fingers of Frost
--			{ spellID = 44544, size = 47, unitId = "player", caster = "player", filter = "BUFF" },
--			-- Fireball!
--			{ spellID = 57761, size = 47, unitId = "player", caster = "player", filter = "BUFF" },
--			-- Hot Streak
--			{ spellID = 44445, size = 47, unitId = "player", caster = "player", filter = "BUFF" },
--			-- Missile Barrage
--			{ spellID = 54486, size = 47, unitId = "player", caster = "player", filter = "BUFF" },
--			-- Clearcasting
--			{ spellID = 12536, size = 47, unitId = "player", caster = "player", filter = "BUFF" },
--			-- Impact
--			{ spellID = 12358, size = 47, unitId = "player", caster = "player", filter = "BUFF" },
--		},
--		{
--			Name = "T_DEBUFF_ICON",
--			Direction = "RIGHT",
--			Interval = 4,
--			Mode = "ICON",
--			setPoint = { "LEFT", UIParent, "CENTER", 198, -190 },
--
--			-- Polymorph
--			{ spellID = 118, size = 47, unitId = "target", caster = "all", filter = "DEBUFF" },
--			-- Arcane Blast
--			{ spellID = 36032, size = 47, unitId = "player", caster = "player", filter = "DEBUFF" },
--			-- Improved Scorch
--			{ spellID = 11367, size = 47, unitId = "target", caster = "all", filter = "DEBUFF" },
--			-- Scorch
--			{ spellID = 2948, size = 47, unitId = "target", caster = "all", filter = "DEBUFF" },
--			-- Slow
--			{ spellID = 31589, size = 47, unitId = "target", caster = "player", filter = "DEBUFF" },
--			-- Ignite
--			{ spellID = 11119, size = 47, unitId = "target", caster = "player", filter = "DEBUFF" },
--			-- Living Bomb
--			{ spellID = 44457, size = 47, unitId = "target", caster = "player", filter = "DEBUFF" },
--			-- Pyroblast!
--			{ spellID = 92315, size = 47, unitId = "player", caster = "player", filter = "DEBUFF" },
--		},
--		{
--			Name = "F/DEBUFF_BAR",
--			Direction = "UP",
--			IconSide = "LEFT",
--			Interval = 4,
--			Mode = "BAR",
--			setPoint = { "LEFT", UIParent, "CENTER", 198, 100 },
--
--			-- Polymorph
--			{ spellID = 118, size = 32, barWidth = 191, unitId = "focus", caster = "all", filter = "DEBUFF" },
--		},
--	},
--	["WARRIOR"] = {
--		{
--			Name = "P_PROC_ICON",
--			Direction = "LEFT",
--			Interval = 4,
--			Mode = "ICON",
--			setPoint = { "RIGHT", UIParent, "CENTER", -198, -190 },
--
--			-- Sudden Death
--			{ spellID = 52437, size = 47, unitId = "player", caster = "player", filter = "BUFF" },
--			-- Slam!
--			{ spellID = 46916, size = 47, unitId = "player", caster = "all", filter = "BUFF" },
--			-- Sword and Board
--			{ spellID = 50227, size = 47, unitId = "player", caster = "player", filter = "BUFF" },
--			-- Blood Reserve
--			{ spellID = 64568, size = 47, unitId = "player", caster = "player", filter = "BUFF" },
--			-- Spell Reflection/Zauberreflexion
--			{ spellID = 23920, size = 47, unitId = "player", caster = "player", filter = "BUFF" },
--			-- Victory Rush/Siegesrausch
--			{ spellID = 34428, size = 47, unitId = "player", caster = "player", filter = "BUFF" },
--			-- Shield Block/Schildblock
--			{ spellID = 2565, size = 47, unitId = "player", caster = "player", filter = "BUFF" },
--			-- Last Stand
--			{ spellID = 12975, size = 47, unitId = "player", caster = "player", filter = "BUFF" },
--			-- Shield Wall
--			{ spellID = 871, size = 47, unitId = "player", caster = "player", filter = "BUFF" },
--		},
--		{
--			Name = "T_DEBUFF_ICON",
--			Direction = "RIGHT",
--			Interval = 4,
--			Mode = "ICON",
--			setPoint = { "LEFT", UIParent, "CENTER", 198, -190 },
--
--			-- Charge Stun/Sturmangriffsbet�ubung
--			{ spellID = 7922, size = 47, unitId = "target", caster = "all", filter = "DEBUFF" },
--			-- Shockwave
--			{ spellID = 46968, size = 47, unitId = "target", caster = "all", filter = "DEBUFF" },
--			-- Hamstring
--			{ spellID = 1715, size = 47, unitId = "target", caster = "all", filter = "DEBUFF" },
--			-- Rend
--			{ spellID = 94009, size = 47, unitId = "target", caster = "player", filter = "DEBUFF" },
--			-- Sunder Armor
--			{ spellID = 7386, size = 47, unitId = "target", caster = "all", filter = "DEBUFF" },
--			-- Expose Armor
--			--{ spellID = 48669, size = 47, unitId = "target", caster = "player", filter = "DEBUFF" },
--			-- Thunder Clap
--			{ spellID = 6343, size = 47, unitId = "target", caster = "player", filter = "DEBUFF" },
--			-- Infected Wounds
--			{ spellID = 48484, size = 47, unitId = "target", caster = "all", filter = "DEBUFF" },
--			-- Frost Fever
--			{ spellID = 55095, size = 47, unitId = "target", caster = "all", filter = "DEBUFF" },
--			-- Demoralizing Shout
--			{ spellID = 1160, size = 47, unitId = "target", caster = "player", filter = "DEBUFF" },
--			-- Demoralizing Roar
--			{ spellID = 99, size = 47, unitId = "target", caster = "all", filter = "DEBUFF" },
--			-- Curse of Weakness
--			{ spellID = 702, size = 47, unitId = "target", caster = "all", filter = "DEBUFF" },
--		},
--	},
	["SHAMAN"] = {
	{
			Name = "SHORT_COOLDOWN",
			Direction = "HORIZONTAL",
			Interval = 1,
			Mode = "ICON",
			Opacity = 0.5,
			Merge = true,
			Filter = "CD",
			Size = 37,
			setPoint = { "LEFT", UIParent, "CENTER", 0, -40 },

			-- Primal Strike
			{ spellID = 73899 },
			-- Shock (Earth: 8042, Flame: 8050, Frost: 8056)
			{ spellID = 8050 },
			-- Wind Shear
			{ spellID = 57994 },
			-- Chain Lightning
			{ spellID = 421 },
			-- Fire Nova
			{ spellID = 1535 },
			-- Lava Burst
			{ spellID = 51505 },
			-- Grounding Totem
			{ spellID = 8177 },
			-- Healing Rain
			{ spellID = 73920 },
			-- Unleash Elements
			{ spellID = 73680 },
			-- Stormstrike
			{ spellID = 17364 },
			-- Earthquake
			{ spellID = 61882 },
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
			setPoint = { "LEFT", UIParent, "CENTER", 198, -88 },

			-- Nature's Swiftness
			{ spellID = 16188 },
			-- Tremor Totem
			{ spellID = 8143 },
			-- Earth Elemental Totem
			{ spellID = 2062 },
			-- Fire Elemental Totem
			{ spellID = 2894 },
			-- Spiritwalker's Grace
			{ spellID = 79206 },
			-- Mana Tide Totem
			{ spellID = 16190 },
			-- Spirit Link Totem
			{ spellID = 98008 },
			-- Feral Spirit
			{ spellID = 51533 },
			-- Shamanistic Rage
			{ spellID = 30823 },
			-- Elemental Mastery
			{ spellID = 16166 },
		},
		{
			-- Name = "P_PROC_ICON",
			-- Direction = "LEFT",
			-- Interval = 0,
			-- Mode = "ICON",
			-- setPoint = { "RIGHT", UIParent, "CENTER", 23, 180 },
			Name = "P_PROC_ICON",
			Direction = "HORIZONTAL",
			Interval = 1,
			Mode = "ICON",
			Opacity = 0.5,
			Merge = true,
			setPoint = { "LEFT", UIParent, "CENTER", 0, 210 },

			-- Spells/Talents
			-- Maelstorm Weapon
			{ spellID = 53817, size = 47, unitId = "player", caster = "player", filter = "BUFF" },
			-- Shamanistic Rage
			{ spellID = 30823, size = 47, unitId = "player", caster = "player", filter = "BUFF" },
			-- Clearcasting
			{ spellID = 16246, size = 47, unitId = "player", caster = "player", filter = "BUFF" },
			-- Tidal Waves
			{ spellID = 51562, size = 47, unitId = "player", caster = "player", filter = "BUFF" },
			-- Elemental Mastery
			{ spellID = 16166, size = 47, unitId = "player", caster = "player", filter = "BUFF" },

			-- -- Sated
			-- { spellID = 57724, size = 47, unitId = "player", caster = "player", filter = "DEBUFF" },
		},
		{
			-- Name = "P_BUFF_ICON",
			-- Direction = "LEFT",
			-- Interval = 4,
			-- Mode = "ICON",
			-- setPoint = { "RIGHT", UIParent, "CENTER", -198, -146 },
			Name = "P_BUFF_ICON",
			Direction = "LEFT",
			Interval = 1,
			Opacity = 0.8,
			Mode = "ICON",
			Merge = true,
			Size = 37,
			Filter = "BUFF",
			UnitId = "player",
			setPoint = { "RIGHT", UIParent, "CENTER", -148, 0 },

			-- -- Earth Shield/Erdschild
			-- { spellID = 974, size = 32, unitId = "player", caster = "player", filter = "BUFF" },
			-- -- Riptide/Springflut
			-- { spellID = 61295, size = 32, unitId = "player", caster = "player", filter = "BUFF" },
			-- -- Lightning Shield/Blitzschlagschild
			-- { spellID = 324, size = 32, unitId = "player", caster = "player", filter = "BUFF" },
			-- -- Water Shield/Wasserschild
			-- { spellID = 52127, size = 32, unitId = "player", caster = "player", filter = "BUFF" },
			-- Maelstrom Weapon
			{ spellID = 51528, caster = "player" },
			-- Spiritwalker's Grace
			{ spellID = 79206, caster = "player" },
		},
--		{
--			Name = "T_BUFF_ICON",
--			Direction = "RIGHT",
--			Interval = 4,
--			Mode = "ICON",
--			setPoint = { "LEFT", UIParent, "CENTER", 198, -146 },
--
--			-- Earth Shield/Erdschild
--			{ spellID = 974, size = 32, unitId = "target", caster = "player", filter = "BUFF" },
--			-- Riptide/Springflut
--			{ spellID = 61295, size = 32, unitId = "target", caster = "player", filter = "BUFF" },
--			-- Ancestral Fortitude
--			{ spellID = 16236, size = 47, barWidth = 187, unitId = "target", caster = "player", filter = "BUFF" },
--		},
--		{
--			Name = "T_DEBUFF_ICON",
--			Direction = "RIGHT",
--			Interval = 4,
--			Mode = "ICON",
--			setPoint = { "LEFT", UIParent, "CENTER", 198, -190 },
--
--			-- Hex
--			{ spellID = 51514, size = 47, unitId = "target", caster = "all", filter = "DEBUFF" },
--			-- Storm Strike
--			{ spellID = 17364, size = 47, unitId = "target", caster = "player", filter = "DEBUFF" },
--			-- Earth Shock
--			{ spellID = 8042, size = 47, unitId = "target", caster = "player", filter = "DEBUFF" },
--			-- Frost Shock
--			{ spellID = 8056, size = 47, unitId = "target", caster = "player", filter = "DEBUFF" },
--			-- Flame Shock
--			{ spellID = 8050, size = 47, unitId = "target", caster = "player", filter = "DEBUFF" },
--		},
		{
			Name = "F/DEBUFF_BAR",
			Direction = "UP",
			IconSide = "LEFT",
			Interval = 1,
			Mode = "ICON",
			setPoint = { "LEFT", UIParent, "CENTER", 148, 100 },

			-- Hex
			{ spellID = 51514, size = 32, unitId = "focus", caster = "all", filter = "DEBUFF" },
		},
	},
	["PALADIN"] = {
--		{
--			Name = "P_BUFF_ICON",
--			Direction = "LEFT",
--			Interval = 4,
--			Opacity = 1,
--			Mode = "ICON",
--			setPoint = { "RIGHT", UIParent, "CENTER", -198, -146 },
--
--			-- Beacon of Light/Flamme des Glaubens
--			{ spellID = 53563, size = 32, unitId = "player", caster = "player", filter = "BUFF" },
--		},
--		{
--			Name = "T_BUFF_ICON",
--			Direction = "RIGHT",
--			Interval = 4,
--			Opacity = 1,
--			Mode = "ICON",
--			setPoint = { "LEFT", UIParent, "CENTER", 198, -146 },
--
--			-- Beacon of Light/Flamme des Glaubens
--			{ spellID = 53563, size = 32, unitId = "target", caster = "player", filter = "BUFF" },
--		},
--		{
--			Name = "F_BUFF_ICON",
--	      Direction = "RIGHT",
--			Interval = 4,
--			Opacity = 1,
--			Mode = "ICON",
--			setPoint = { "LEFT", UIParent, "CENTER", 198, -146 },
-- 
--			-- Beacon of Light/Flamme des Glaubens
--			{ spellID = 53563, size = 32, unitId = "focus", caster = "player", filter = "BUFF" },
--		},
		{
			-- Name = "P_PROC_ICON",
			-- Direction = "HORIZONTAL",
			-- Interval = 4,
			-- Opacity = 0.5,
			-- Mode = "ICON",
			-- Merge = true,
			-- setPoint = { "RIGHT", UIParent, "CENTER", 23, 180 },
			-- Name = "P_PROC_ICON",
			-- Direction = "HORIZONTAL",
			-- Interval = 1,
			-- Mode = "ICON",
			-- Opacity = 0.5,
			-- Merge = true,
			-- setPoint = { "LEFT", UIParent, "CENTER", 0, 210 },
			Name = "P_PROC_ICON",
			Direction = "UP",
			Interval = 1,
			Mode = "ICON",
			Opacity = 0.5,
			Merge = true,
			setPoint = { "RIGHT", UIParent, "CENTER", -198, -88 },

			-- Divine Favor
			{ spellID = 31842, size = 47, unitId = "player", caster = "player", filter = "BUFF" },
			-- Day break    
			{ spellID = 88819, size = 47, unitId = "player", caster = "player", filter = "BUFF" },
			-- Infusion of Light
			{ spellID = 54149, size = 47, unitId = "player", caster = "player", filter = "BUFF" },
			-- Divine Plea
			{ spellID = 54428, size = 47, unitId = "player", caster = "player", filter = "BUFF" },
			-- Aura Mastery
			{ spellID = 31821, size = 47, unitId = "player", caster = "player", filter = "BUFF" },
			-- Avenging Wrath
			{ spellID = 31884, size = 47, unitId = "player", caster = "player", filter = "BUFF" },
		},
--		{
--			Name = "T_DEBUFF_ICON",
--			Direction = "RIGHT",
--			Interval = 4,
--			Mode = "ICON",
--			setPoint = { "LEFT", UIParent, "CENTER", 198, -190 },
--
--			-- Hammer of Justice/Hammer der Gerechtigkeit
--			{ spellID = 853, size = 47, unitId = "target", caster = "all", filter = "DEBUFF" },
--			-- Judgement of Light
--			{ spellID = 20271, size = 47, unitId = "target", caster = "player", filter = "DEBUFF" },
--			-- Judgement of Justice
--			--{ spellID = 53407, size = 47, unitId = "target", caster = "player", filter = "DEBUFF" },
--			-- Judgement of Wisdom
--			--{ spellID = 20186, size = 47, unitId = "target", caster = "player", filter = "DEBUFF" },
--			-- Heart of the Crusader
--			--{ spellID = 54499, size = 47, unitId = "target", caster = "player", filter = "DEBUFF" },
--			-- Blood Corruption
--			--{ spellID = 53742, size = 47, unitId = "target", caster = "player", filter = "DEBUFF" },
--		},
--		{
--			Name = "F/DEBUFF_BAR",
--			Direction = "UP",
--			IconSide = "LEFT",
--			Interval = 4,
--			Mode = "BAR",
--			setPoint = { "LEFT", UIParent, "CENTER", 198, 100 },
--
--			-- Hammer of Justice/Hammer der Gerechtigkeit
--			{ spellID = 853, size = 32, barWidth = 200, unitId = "focus", caster = "all", filter = "DEBUFF" },
--		},

		{
			-- Name = "COOLDOWN",
			-- Direction = "HORIZONTAL",
			-- Interval = 1,
			-- Mode = "ICON",
			-- Merge = true,
			-- Opacity = 0.5,
			-- setPoint = { "LEFT", UIParent, "CENTER", 0, -40 },
			Name = "COOLDOWN",
			Direction = "UP",
			Interval = 1,
			Mode = "ICON",
			Opacity = 1.0,
			Merge = true,
			Filter = "CD",
			Size = 47,
			--ForceSize = true,
			setPoint = { "LEFT", UIParent, "CENTER", 198, -88 },

			-- Divine Favor
			{ spellID = 31842, size = 47, filter = "CD" },
			-- Aura Mastery
			{ spellID = 31821, size = 47, filter = "CD" },
			-- Divine Plea
			{ spellID = 54428, size = 47, filter = "CD" },
			-- Holy Radiance
			{ spellID = 82327, size = 47, filter = "CD" },
			-- Divine Protection
			{ spellID = 498, size = 47, filter = "CD" },
			-- Divine Shield
			{ spellID = 642, size = 47, filter = "CD" },
			-- Guardian of Ancient Kings
			{ spellID = 86150, size = 47, filter = "CD" },
			-- Avenging Wrath
			{ spellID = 31884, size = 47, filter = "CD" },
		},
		-- {
			-- Name = "CD/HEAL",
			-- Direction = "UP",
			-- IconSide = "RIGHT",
			-- Interval = 0,
			-- Mode = "BAR",
			-- setPoint = { "RIGHT", UIParent, "CENTER",  -436, 332 },

			-- -- Divine Favor
			-- { spellID = 31842, size = 32, barWidth = 200, filter = "CD" },
			-- -- Aura Mastery
			-- { spellID = 31821, size = 32, barWidth = 200, filter = "CD" },
			-- -- Divine Plea
			-- { spellID = 54428, size = 32, barWidth = 200, filter = "CD" },
			-- -- Holy Radiance
			-- { spellID = 82327, size = 32, barWidth = 200, filter = "CD" },
			-- -- Divine Protection
			-- { spellID = 498, size = 32, barWidth = 200, filter = "CD" },
			-- -- Divine Shield
			-- { spellID = 642, size = 32, barWidth = 200, filter = "CD" },
			-- -- Guardian of Ancient Kings
			-- { spellID = 86150, size = 32, barWidth = 200, filter = "CD" },
			-- -- Avenging Wrath
			-- { spellID = 31884, size = 32, barWidth = 200, filter = "CD" },
		-- },
	},
	["PRIEST"] = {
		{
			Name = "SHORT_COOLDOWN",
			Direction = "HORIZONTAL",
			Interval = 1,
			Mode = "ICON",
			Opacity = 0.5,
			Merge = true,
			Filter = "CD",
			Size = 37,
			setPoint = { "LEFT", UIParent, "CENTER", 0, -40 },

			-- Holy Fire
			{ spellID = 14914 },
			-- Mind Blast
			{ spellID = 8092 },
			-- Shadow Word: Death
			{ spellID = 32379 },
			-- Penance
			{ spellID = 47540 },
			-- Archangel/Erzengel
			{ spellID = 81700 },
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
			setPoint = { "LEFT", UIParent, "CENTER", 198, -88 },

			-- Psychic Scream
			{ spellID = 8122 },
			-- Fade
			{ spellID = 586 },
			-- Fear Ward
			{ spellID = 6346 },
			-- Hymn of Hope
			{ spellID = 64901 },
			-- Shadow Fiend
			{ spellID = 34433 },
			-- Divine Hymn
			{ spellID = 64843 },
			-- Leap of Faith
			{ spellID = 73325 },
			-- Power Word: Barrier
			{ spellID = 62618 },
			-- Inner Focus
			{ spellID = 89485 },
			-- Power Infusion
			{ spellID = 10060 },
			-- Light Well
			{ spellID = 724 },
			-- Desperate Prayer
			{ spellID = 19236 },
			-- Silence
			{ spellID = 15487 },
			-- Dispersion
			{ spellID = 47585 },
			-- Psychic Horror
			{ spellID = 64044 },
		},
		{
			-- Name = "P_BUFF_ICON",
			-- Direction = "LEFT",
			-- Interval = 4,
			-- Mode = "ICON",
			-- setPoint = { "RIGHT", UIParent, "CENTER", -198, -146 },
			Name = "P_BUFF_ICON",
			Direction = "LEFT",
			Interval = 1,
			Opacity = 0.8,
			Mode = "ICON",
			Merge = true,
			Size = 37,
			Filter = "BUFF",
			UnitId = "player",
			setPoint = { "RIGHT", UIParent, "CENTER", -148, 0 },

			-- Archangel/Erzengel
			{ spellID = 81700 },
		},
		-- {
			-- Name = "T_BUFF_ICON",
			-- Direction = "RIGHT",
			-- Interval = 4,
			-- Mode = "ICON",
			-- setPoint = { "LEFT", UIParent, "CENTER", 198, -146 },

			-- -- Prayer of Mending/Gebet der Besserung
			-- { spellID = 41635, size = 32, unitId = "target", caster = "player", filter = "BUFF" },
			-- -- Guardian Spirit/Schutzgeist
			-- { spellID = 47788, size = 32, unitId = "target", caster = "player", filter = "BUFF" },
			-- -- Pain Suppression/Schmerzunterdr�ckung
			-- { spellID = 33206, size = 32, unitId = "target", caster = "player", filter = "BUFF" },
			-- -- Power Word: Shield/Machtwort: Schild
			-- { spellID = 17, size = 32, unitId = "target", caster = "player", filter = "BUFF" },
			-- -- Renew/Erneuerung
			-- { spellID = 139, size = 32, unitId = "target", caster = "player", filter = "BUFF" },
			-- -- Fear Ward/Furchtzauberschutz
			-- { spellID = 6346, size = 32, unitId = "target", caster = "player", filter = "BUFF" },
			-- -- Echo des lichts
			-- { spellID = 77489, size = 32, unitId = "target", caster = "player", filter = "BUFF" },
			-- -- Inspiration
			-- { spellID = 15357, size = 32, unitId = "target", caster = "player", filter = "BUFF" },
			-- -- Barmherzigkeit
			-- { spellID = 77613, size = 32, unitId = "target", caster = "player", filter = "BUFF" },
		-- },
		{
			-- Name = "P_PROC_ICON",
			-- Direction = "LEFT",
			-- Interval = 4,
			-- Mode = "ICON",
			-- setPoint = { "RIGHT", UIParent, "CENTER", -198, -190 },
			Name = "P_PROC_ICON",
			--Direction = "HORIZONTAL",
			Direction = "UP",
			Interval = 1,
			Mode = "ICON",
			Opacity = 0.5,
			Merge = true,
			--setPoint = { "LEFT", UIParent, "CENTER", 0, 210 },
			setPoint = { "RIGHT", UIParent, "CENTER", -148, 48 },

			-- Surge of Light / Woge des Lichts
			{ spellID = 88688, size = 47, unitId = "player", caster = "all", filter = "BUFF" },
			-- Serendipity / Gl�cksfall
			{ spellID = 63735, size = 47, unitId = "player", caster = "player", filter = "BUFF" },
			-- Shadow Orb
			{ spellID = 77487, size = 47, unitId = "player", caster = "player", filter = "BUFF" },
			-- Dark Evangelism / dunkler prediger
			{ spellID = 87118, size = 47, unitId = "player", caster = "player", filter = "BUFF" },
			-- Evangelism / Prediger
			{ spellID = 81661, size = 47, unitId = "player", caster = "player", filter = "BUFF" },
			-- Dispersion
			{ spellID = 47585, size = 47, unitId = "player", caster = "player", filter = "BUFF" },
			-- Chakra: Epiphani
			{ spellID = 81208, size = 47, unitId = "player", caster = "player", filter = "BUFF" },
			-- Chakra: Refugium
			{ spellID = 81206, size = 47, unitId = "player", caster = "player", filter = "BUFF" },
		},
		{
			-- Name = "T_DEBUFF_ICON",
			-- Direction = "RIGHT",
			-- Interval = 4,
			-- Mode = "ICON",
			-- setPoint = { "LEFT", UIParent, "CENTER", 198, -190 },
			Name = "T_DEBUFF_ICON",
			Direction = "RIGHT",
			Interval = 1,
			Mode = "ICON",
			setPoint = { "LEFT", UIParent, "CENTER", 37, -88 },

			-- Shackle undead
			{ spellID = 9484, size = 47, unitId = "target", caster = "all", filter = "DEBUFF" },
			-- Psychic Scream
			{ spellID = 8122, size = 47, unitId = "target", caster = "all", filter = "DEBUFF" },
			-- Shadow Word: Pain
			{ spellID = 589, size = 47, unitId = "target", caster = "player", spec = 3, filter = "DEBUFF" },
			-- Devouring Plague
			{ spellID = 2944, size = 47, unitId = "target", caster = "player", spec = 3, filter = "DEBUFF" },
			-- Vampiric Touch
			{ spellID = 34914, size = 47, unitId = "target", caster = "player", spec = 3, filter = "DEBUFF" },
		},
		{
			-- Name = "F/DEBUFF_BAR",
			-- Direction = "UP",
			-- IconSide = "LEFT",
			-- Interval = 4,
			-- Mode = "BAR",
			-- setPoint = { "LEFT", UIParent, "CENTER", 198, 100 },
			Name = "F/DEBUFF_BAR",
			Direction = "UP",
			IconSide = "LEFT",
			Interval = 1,
			Mode = "ICON",
			setPoint = { "LEFT", UIParent, "CENTER", 148, 100 },

			-- Shackle undead
			{ spellID = 9484, size = 32, barWidth = 200, unitId = "focus", caster = "all", filter = "DEBUFF" },
			-- Psychic Scream
			{ spellID = 8122, size = 32, barWidth = 200, unitId = "focus", caster = "all", filter = "DEBUFF" },
		},
	},
   ["WARLOCK"] = {
		{
			Name = "P_PROC_ICON",
			Direction = "LEFT",
			Interval = 4,
			Mode = "ICON",
			setPoint = { "RIGHT", UIParent, "CENTER", -198, 200 },

			-- Devious Minds/Teuflische Absichten
			{ spellID = 70840, size = 47, unitId = "player", caster = "player", filter = "BUFF" },
			-- Improved Soul Fire
			{ spellID = 85114, size = 47, unitId = "player", caster = "player", filter = "BUFF" },
			-- Molten Core
			{ spellID = 47383, size = 47, unitId = "player", caster = "player", filter = "BUFF" },
			-- Decimation
			{ spellID = 63158, size = 47, unitId = "player", caster = "player", filter = "BUFF" },
			-- Backdraft
			{ spellID = 54277, size = 47, unitId = "player", caster = "player", filter = "BUFF" },
			-- Backlash
			{ spellID = 34939, size = 47, unitId = "player", caster = "player", filter = "BUFF" },
			-- Nether Protection
			{ spellID = 30301, size = 47, unitId = "player", caster = "player", filter = "BUFF" },
			-- Nightfall
			{ spellID = 18095, size = 47, unitId = "player", caster = "player", filter = "BUFF" },
			-- Burning Soul
			{ spellID = 74434, size = 47, unitId = "player", caster = "player", filter = "BUFF" },
			-- Improved Soul Fire
			{ spellID = 18120, size = 47, unitId = "player", caster = "player", filter = "BUFF" },
			-- Empowered Imp  
			{ spellID = 47221, size = 47, unitId = "player", caster = "player", filter = "BUFF" },
		},
		{
			Name = "T_DEBUFF_ICON",
			Direction = "RIGHT",
			Interval = 4,
			Mode = "ICON",
			setPoint = { "LEFT", UIParent, "CENTER", 198, 200 },

			-- Fear
			{ spellID = 5782, size = 47, unitId = "target", caster = "all", filter = "DEBUFF" },
			-- Banish
			{ spellID = 710, size = 47, unitId = "target", caster = "all", filter = "DEBUFF" },
			-- Curse of the Elements
			{ spellID = 1490, size = 47, unitId = "target", caster = "all", filter = "DEBUFF" },
			-- Curse of Tongues
			{ spellID = 1714, size = 47, unitId = "target", caster = "all", filter = "DEBUFF" },
			-- Curse of Exhaustion
			{ spellID = 18223, size = 47, unitId = "target", caster = "all", filter = "DEBUFF" },
			-- Curse of Weakness
			{ spellID = 702, size = 47, unitId = "target", caster = "all", filter = "DEBUFF" },
			-- Shadow Embrace
			{ spellID = 32385, size = 47, unitId = "target", caster = "player", filter = "BUFF" },
			-- Corruption
			{ spellID = 172, size = 47, unitId = "target", caster = "player", filter = "DEBUFF" },
			-- Immolate
			{ spellID = 348, size = 47, unitId = "target", caster = "player", filter = "DEBUFF" },
			-- Curse of Agony
			{ spellID = 980, size = 47, unitId = "target", caster = "player", filter = "DEBUFF" },
			-- Bane of Doom
			{ spellID = 603, size = 47, unitId = "target", caster = "player", filter = "DEBUFF" },
			-- Unstable Affliction
			{ spellID = 30108, size = 47, unitId = "target", caster = "player", filter = "DEBUFF" },
			-- Haunt
			{ spellID = 48181, size = 47, unitId = "target", caster = "player", filter = "DEBUFF" },
			-- Seed of Corruption
			{ spellID = 27243, size = 47, unitId = "target", caster = "player", filter = "DEBUFF" },
			-- Howl of Terror
			{ spellID = 5484, size = 47, unitId = "target", caster = "player", filter = "DEBUFF" },
			-- Death Coil
			{ spellID = 6789, size = 47, unitId = "target", caster = "player", filter = "DEBUFF" },
			-- Enslave Demon
			{ spellID = 1098, size = 47, unitId = "target", caster = "player", filter = "DEBUFF" },
			-- Demon Charge
			{ spellID = 54785, size = 47, unitId = "target", caster = "player", filter = "DEBUFF" },
		},
		{
			Name = "F_DEBUFF_ICON",
			Direction = "RIGHT",
			Interval = 4,
			Mode = "ICON",
			setPoint = { "LEFT", UIParent, "CENTER", 198, 153 },
 
			-- Fear
			{ spellID = 5782, size = 47, unitId = "focus", caster = "all", filter = "DEBUFF" },
			-- Banish
			{ spellID = 710, size = 47, unitId = "focus", caster = "all", filter = "DEBUFF" },
		},
--		{
--			Name = "CD/DPS",
--			Direction = "UP",
--			IconSide = "RIGHT",
--			Interval = 0,
--			Mode = "BAR",
--			setPoint = { "RIGHT", UIParent, "CENTER", 100, 200 },
--    
--			-- Shadowburn
--			{ spellID = 17877, size = 32, barWidth = 200, filter = "CD" },
--			-- Conflagrate
--			{ spellID = 17962, size = 32, barWidth = 200, filter = "CD" },
--			-- Shadowfury
--			{ spellID = 30283, size = 32, barWidth = 200, filter = "CD" },
--			-- Soulburn
--			{ spellID = 74434, size = 32, barWidth = 200, filter = "CD" },
--			-- Chaos Bolt
--			{ spellID = 50796, size = 32, barWidth = 200, filter = "CD" },
--		},
	},
	["ROGUE"] = {
		{
			Name = "SHORT_COOLDOWN",
			Direction = "HORIZONTAL",
			Interval = 1,
			Mode = "ICON",
			Opacity = 0.5,
			Merge = true,
			setPoint = { "LEFT", UIParent, "CENTER", 0, -40 },

			-- Kick
			{ spellID = 1766, size = 37, filter = "CD" },
			-- Kidney Shot
			{ spellID = 408, size = 37, filter = "CD" },
			-- Stealth
			{ spellID = 1784, size = 37, filter = "CD" },
			-- Shadowstep
			{ spellID = 36554, size = 37, filter = "CD" },
		},
		{
			Name = "COOLDOWN",
			Direction = "UP",
			Interval = 1,
			Mode = "ICON",
			Opacity = 1.0,
			Merge = true,
			Size = 37,
			setPoint = { "LEFT", UIParent, "CENTER", 198, -88 },

			-- Premeditation
			{ spellID = 14183, size = 37, filter = "CD" },
			-- Shadow Dance
			{ spellID = 51713, size = 37, filter = "CD" },
			-- Vendetta
			{ spellID = 14177, size = 37, filter = "CD" },
			-- Cold Blood
			{ spellID = 51713, size = 37, filter = "CD" },
			-- Adrenaline Rush
			{ spellID = 13750, size = 37, filter = "CD" },
			-- Killing Spree
			{ spellID = 51690, size = 37, filter = "CD" },
			-- Vanish
			{ spellID = 1856, size = 37, filter = "CD" },
			-- Cloak of Shadows
			{ spellID = 31224, size = 37, filter = "CD" },
			-- Tricks of the Trade
			{ spellID = 57934, size = 37, filter = "CD" },
			-- Redirect
			{ spellID = 73981, size = 37, filter = "CD" },
			-- Sprint
			{ spellID = 2983, size = 37, filter = "CD" },
		},
		{
			Name = "P_BUFF_ICON",
			Direction = "LEFT",
			Interval = 1,
			Size = 37,
			Mode = "ICON",
			setPoint = { "RIGHT", UIParent, "CENTER", -40, -88 },

			-- T13-2P Bonus
			{ spellID = 105849, size = 37, unitId = "player", caster = "all", filter = "BUFF" },
			-- Sprint
			{ spellID = 2983, size = 37, unitId = "player", caster = "player", filter = "BUFF" },
			-- Cloak of Shadows
			{ spellID = 31224, size = 37, unitId = "player", caster = "player", filter = "BUFF" },
			-- Adrenaline Rush
			{ spellID = 13750, size = 37, unitId = "player", caster = "player", filter = "BUFF" },
			-- Evasion
			{ spellID = 5277, size = 37, unitId = "player", caster = "player", filter = "BUFF" },
			-- Envenom
			{ spellID = 32645, size = 37, unitId = "player", caster = "player", filter = "BUFF" },
			-- Overkill
			{ spellID = 58426, size = 37, unitId = "player", caster = "player", filter = "BUFF" },
			-- Slice and Dice
			{ spellID = 5171, size = 37, unitId = "player", caster = "player", filter = "BUFF" },
			-- Recuperate
			{ spellID = 73651, size = 37, unitId = "player", caster = "player", filter = "BUFF" },
			-- Tricks of the Trade
			{ spellID = 57934, size = 37, unitId = "player", caster = "player", filter = "BUFF" },
			-- Turn the Tables
			{ spellID = 51627, size = 37, unitId = "player", caster = "player", filter = "BUFF" },
			-- Shadow Dance
			{ spellID = 51713, size = 37, unitId = "player", caster = "player", filter = "BUFF" },
			-- Killing Spree
			{ spellID = 51690, size = 37, unitId = "player", caster = "player", filter = "BUFF" },
			-- Shallow Insight
			{ spellID = 84745, size = 37, unitId = "player", caster = "player", filter = "BUFF" },
			-- Moderate Insight
			{ spellID = 84746, size = 37, unitId = "player", caster = "player", filter = "BUFF" },
			-- Deep Insight
			{ spellID = 84747, size = 37, unitId = "player", caster = "player", filter = "BUFF" },
			-- Suffering -- Legendary buff
			{ spellID = 109959, size = 37, unitId = "player", caster = "player", filter = "BUFF" },
			-- Nightmare -- Legendary buff
			{ spellID = 109955, size = 37, unitId = "player", caster = "player", filter = "BUFF" },
			-- Shadows of the Destroyer -- Legendary buff
			{ spellID = 109941, size = 37, unitId = "player", caster = "player", filter = "BUFF" },
			-- Blade Fury
			{ spellID = 13877, size = 37, unitId = "player", caster = "player", filter = "BUFF" },
		},
		{
			Name = "T_DEBUFF_ICON",
			Direction = "RIGHT",
			Interval = 1,
			Mode = "ICON",
			Size = 37,
			setPoint = { "LEFT", UIParent, "CENTER", 40, -88 },

			-- Cheap shot
			{ spellID = 1833, size = 37, unitId = "target", caster = "all", filter = "DEBUFF" },
			-- Kidney shot
			{ spellID = 408, size = 37, unitId = "target", caster = "all", filter = "DEBUFF" },
			-- Blind
			{ spellID = 2094, size = 37, unitId = "target", caster = "all", filter = "DEBUFF" },
			-- Sap
			{ spellID = 6770, size = 37, unitId = "target", caster = "all", filter = "DEBUFF" },
			-- Rupture
			{ spellID = 1943, size = 37, unitId = "target", caster = "player", filter = "DEBUFF" },
			-- Garrote
			{ spellID = 703, size = 37, unitId = "target", caster = "player", filter = "DEBUFF" },
			-- Gouge
			{ spellID = 1776, size = 37, unitId = "target", caster = "player", filter = "DEBUFF" },
			-- Expose Armor
			{ spellID = 8647, size = 37, unitId = "target", caster = "player", filter = "DEBUFF" },
			-- Dismantle
			{ spellID = 51722, size = 37, unitId = "target", caster = "player", filter = "DEBUFF" },
			-- Deadly Poison / T�dliches Gift
			{ spellID = 2818, size = 37, unitId = "target", caster = "player", filter = "DEBUFF" },
			-- Mind-numbing Poison / Gedankenbenebelndes Gift
			{ spellID = 5760, size = 37, unitId = "target", caster = "player", filter = "DEBUFF" },
			-- Crippling Poison / Verkr�ppelndes Gift
			{ spellID = 3409, size = 37, unitId = "target", caster = "player", filter = "DEBUFF" },
			-- Wound Poison / Wundgift
			{ spellID = 13218, size = 37, unitId = "target", caster = "player", filter = "DEBUFF" },
			-- Find Weakness
			{ spellID = 91023, size = 37, unitId = "target", caster = "player", filter = "DEBUFF" },
			-- Hemorrhage
			{ spellID = 16511, size = 37, unitId = "target", caster = "player", filter = "DEBUFF", absID = true  },
			-- Glyph of Hemorrhage 
			{ spellID = 89775, size = 37, unitId = "target", caster = "player", filter = "DEBUFF", absID = true  },
			-- Vendetta
			{ spellID = 79140, size = 37, unitId = "target", caster = "player", filter = "DEBUFF" },
		},
		{
			Name = "F/DEBUFF_BAR",
			Direction = "UP",
			Interval = 1,
			Mode = "ICON",
			setPoint = { "LEFT", UIParent, "CENTER", 198, 100 },

			-- Blind
			{ spellID = 2094, size = 32, unitId = "focus", caster = "all", filter = "DEBUFF" },
			-- Sap
			{ spellID = 6770, size = 32, unitId = "focus", caster = "all", filter = "DEBUFF" },
			-- Gouge
			{ spellID = 1776, size = 32, unitId = "focus", caster = "all", filter = "DEBUFF" },
		},
		{
			Name = "P_PROC_ICON",
			Direction = "HORIZONTAL",
			Interval = 1,
			Mode = "ICON",
			Opacity = 0.5,
			Merge = true,
			Enabled = false,
			setPoint = { "LEFT", UIParent, "CENTER", 0, 210 },

			-- Fury of the Destroyer -- Legendary buff
			{ spellID = 109949, size = 37, unitId = "player", caster = "player", filter = "BUFF" },
		},
	},
--	["DEATHKNIGHT"] = {
--		{
--			Name = "P_PROC_ICON",
--			Direction = "LEFT",
--			Interval = 4,
--			Mode = "ICON",
--			setPoint = { "RIGHT", UIParent, "CENTER", -198, -190 },
--
--			-- Blood Shield/Blutschild
--			{ spellID = 77513, size = 47, unitId = "player", caster = "player", filter = "BUFF" },
--			-- Unholy Force/Unheilige Kraft
--			{ spellID = 67383, size = 47, unitId = "player", caster = "player", filter = "BUFF" },
--			-- Unholy Strength/Unheilige St�rke
--			{ spellID = 53365, size = 47, unitId = "player", caster = "player", filter = "BUFF" },
--			-- Unholy Might/Unheilige Macht
--			{ spellID = 67117, size = 47, unitId = "player", caster = "player", filter = "BUFF" },
--			-- Dancing Rune Weapon/Tanzende Runenwaffe
--			{ spellID = 49028, size = 47, unitId = "player", caster = "player", filter = "BUFF" },
--			-- Icebound Fortitude/Eisige Gegenwehr
--			{ spellID = 48792, size = 47, unitId = "player", caster = "player", filter = "BUFF" },
--			-- Anti-Magic Shell/Antimagische H�lle
--			{ spellID = 48707, size = 47, unitId = "player", caster = "player", filter = "BUFF" },
--			-- Killing machine
--			{ spellID = 51124, size = 47, unitId = "player", caster = "player", filter = "BUFF" },
--			-- Freezing fog
--			{ spellID = 59052, size = 47, unitId = "player", caster = "player", filter = "BUFF" },
--			-- Bone Shield/Knochenschild
--			{ spellID = 49222, size = 47, unitId = "player", caster = "player", filter = "BUFF" },
--		},
--		{
--			Name = "T_DEBUFF_ICON",
--			Direction = "RIGHT",
--			Interval = 4,
--			Mode = "ICON",
--			setPoint = { "LEFT", UIParent, "CENTER", 198, -190 },
--
--			-- Strangulate/Strangulieren
--			{ spellID = 47476, size = 47, unitId = "target", caster = "player", filter = "DEBUFF" },
--			-- Blood Plague/Blutseuche
--			{ spellID = 59879, size = 47, unitId = "target", caster = "player", filter = "DEBUFF" },
--			-- Frost Fever/Frostfieber
--			{ spellID = 59921, size = 47, unitId = "target", caster = "player", filter = "DEBUFF" },
--			-- Unholy Blight/Unheilige Verseuchung
--			{ spellID = 49194, size = 47, unitId = "target", caster = "player", filter = "DEBUFF" },
--			-- Summon Gargoyle/Gargoyle beschw�ren
--			{ spellID = 49206, size = 47, unitId = "target", caster = "player", filter = "DEBUFF" },
--			-- Death and Decay/Tod und Verfall
--			{ spellID = 43265, size = 47, unitId = "target", caster = "player", filter = "DEBUFF" },
--		},
--	},
--]]
	["ALL" = {
		{
			Name = "Mists of Pandaria Debuffs", -- list compiled by Ryn
			Enable = false,
			Direction = "LEFT",
			Interval = 4,
			Mode = "ICON",
			Alpha = 1,
			Size = 47,
			setPoint = { "RIGHT", UIParent, "CENTER", -240, -80 },

			-- [[ OUTDOOR BOSSES ]] --
			-- Sha of Anger
			--Seethe
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
			Name = "Cataclysm debuff", -- list by jasje, taken from aurawatch.lua
			Enable = false,
			Direction = "LEFT",
			Interval = 4,
			Mode = "ICON",
			BarWidth = 150,			
			Alpha = 1,
			Size = 47,
			setPoint = { "BOTTOMRIGHT", "iFilgerPveDeBuffs", 0, 22 },
			
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
			-- Acid Rain / S�ureregen (Al'Akir)
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
			Name = "WotLK debuff",
			Enable = false,
			Direction = "LEFT",
			Interval = 4,
			Mode = "ICON",
			BarWidth = 150,
			Alpha = 1,
			Size = 47,
			setPoint = { "BOTTOMRIGHT", "iFilgerPveDeBuffs", 0, 22 },
			

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
			--Fiery Combustion/Feurige Ein�scherung (Halion)
			{ spellID = 74562, size = 68, unitId = "player", caster = "all", filter = "DEBUFF" },
			--Soul Consumption/Seelenverzehrung (Halion)
			{ spellID = 74792, size = 68, unitId = "player", caster = "all", filter = "DEBUFF" },
		},
	},
--[[
	["ALL"] = {
		{
			Name = "P_PROC_ICON",
			Direction = "LEFT",
			Interval = 1,
			Mode = "ICON",
			Opacity = 1.0,
			setPoint = { "RIGHT", UIParent, "CENTER", 23, 180 },

		-- Enchantments
			-- Power Torrent
			{ spellID = 74241, size = 52, unitId = "player", caster = "all", filter = "BUFF" },
			-- Landside
			{ spellID = 74245, size = 52, unitId = "player", caster = "all", filter = "BUFF" },
			-- Heartsong / Gesang des Herzens
			{ spellID = 74224, size = 52, unitId = "player", caster = "all", filter = "BUFF" },
			-- Avalanche / Lawine
			{ spellID = 74196, size = 52, unitId = "player", caster = "all", filter = "BUFF" },
			-- Hurricane / Hurrikan
			{ spellID = 74221, size = 52, unitId = "player", caster = "all", filter = "BUFF" },
		-- Tailoring
			-- Darkglow
			{ spellID = 55767, size = 52, unitId = "player", caster = "all", filter = "BUFF" },
			-- Lightweave
			{ spellID = 75170, size = 52, unitId = "player", caster = "all", filter = "BUFF" },
			-- Swordguard
			{ spellID = 55775, size = 52, unitId = "player", caster = "all", filter = "BUFF" },

		-- Trinkets
			-- -- Jaws of defeat - Victory
			-- { spellID = 96908, size = 47, unitId = "player", caster = "player", filter = "BUFF" },
			-- -- Jaws of defeat - Victorious
			-- { spellID = 96907, size = 47, unitId = "player", caster = "player", filter = "BUFF" },
			-- -- Core of ripeness - Expansive Soul
			-- { spellID = 91155, size = 47, unitId = "player", caster = "player", filter = "BUFF" },

			-- 333/346
			-- Cleansing Tears (Tear of Blood)
			{ spellID = 91139, size = 52, unitId = "player", caster = "player", filter = "BUFF" },
			-- Witching Hour
			{ spellID = 90887, size = 52, unitId = "player", caster = "player", filter = "BUFF" },

			-- 359/372/379 4.0
			-- Pattern of Light (Mandala of Stirring Patterns)
			{ spellID = 91192, size = 52, unitId = "player", caster = "all", filter = "BUFF" }, 
			-- Image of Immortality (Mirror of Broken Images)
			{ spellID = 92222, size = 52, unitId = "player", caster = "all", filter = "BUFF" }, 
			-- Dire Magic (Bell of Enraging Resonance)
			{ spellID = 91007, size = 52, unitId = "player", caster = "all", filter = "BUFF" }, 
			-- Battle Magic (Stump of Time)
			{ spellID = 91047, size = 52, unitId = "player", caster = "all", filter = "BUFF" }, 
			-- Volcanic Destruction (darkmoon)
			{ spellID = 89091, size = 52, unitId = "player", caster = "player", filter = "BUFF" },
			-- Heart of Rage
			{ spellID = 92345, size = 52, unitId = "player", caster = "player", filter = "BUFF" },
			-- Heart's Revelation
			{ spellID = 91027, size = 52, unitId = "player", caster = "player", filter = "BUFF" },
			-- Heart's Judgement
			{ spellID = 91041, size = 52, unitId = "player", caster = "player", filter = "BUFF" },
			-- Soul Power (Soul Casket)
			{ spellID = 91019, size = 52, unitId = "player", caster = "player", filter = "BUFF" },
			-- Revelation (Theralion Mirror)
			{ spellID = 91024, size = 52, unitId = "player", caster = "player", filter = "BUFF" },
			-- Celerity (Shard of Woe Heroic)
			{ spellID = 91173, size = 52, unitId = "player", caster = "player", filter = "BUFF" },

			-- 365/378/384/391/397 4.2
			-- Soul Fragment (Necromatic Focus)
			{ spellID = 96962, size = 52, unitId = "player", caster = "player", filter = "BUFF" },
			-- Moonwell Phial
			{ spellID = 101156, size = 52, unitId = "player", caster = "player", filter = "BUFF" },
			-- Blessing of the Moonwell (Moonwell Chalice)
			{ spellID = 100403, size = 52, unitId = "player", caster = "player", filter = "BUFF" },
			-- Charged Blows (Ricket's Magnetic Fireball)
			{ spellID = 101515, size = 52, unitId = "player", caster = "player", filter = "BUFF" },
			-- Matrix Restabilizer
			{ spellID = 96976, size = 52, unitId = "player", caster = "player", filter = "BUFF" },
			-- Accelerated
			{ spellID = 96980, size = 52, unitId = "player", caster = "player", filter = "BUFF" },
			-- Ancient Petrified Seed
			{ spellID = 97009, size = 52, unitId = "player", caster = "player", filter = "BUFF" },
			-- Blessing of Khaz'goroth (Apparatus of Khaz'goroth)
			{ spellID = 96934, size = 52, unitId = "player", caster = "player", filter = "BUFF" },
			-- Essence of the Eternal Flame
			{ spellID = 97010, size = 52, unitId = "player", caster = "player", filter = "BUFF" },
			-- Fiery Quintessence
			{ spellID = 97008, size = 52, unitId = "player", caster = "player", filter = "BUFF" },
			-- -- Victorious  (Jaws of Defeat)
			-- { spellID = 96907, size = 52, unitId = "player", caster = "player", filter = "BUFF", absID = true  },
			-- Jaws of defeat - Victory
			{ spellID = 96908, size = 47, unitId = "player", caster = "player", filter = "BUFF" },
			-- Jaws of defeat - Victorious
			{ spellID = 96907, size = 47, unitId = "player", caster = "player", filter = "BUFF" },
			-- Mark of the Firelord  (Rune of Zeth)
			{ spellID = 97007, size = 52, unitId = "player", caster = "player", filter = "BUFF" },
			-- Devour  (The Hungerer)
			{ spellID = 96911, size = 52, unitId = "player", caster = "player", filter = "BUFF" },
			-- Weight of a Feather (Scales of Life)
			{ spellID = 96879, size = 32, unitId = "player", caster = "player", filter = "BUFF" },
			-- Titanic Power (Apparatus of Khaz'goroth)
			{ spellID = 96923, size = 52, unitId = "player", caster = "player", filter = "BUFF" },

			-- Brewfeast
			-- Now is the time! (Mithril Stopwatch)
			{ spellID = 101291, size = 52, unitId = "player", caster = "player", filter = "BUFF" },
			-- Drunken Evasiveness (Brawler's Trophy)
			{ spellID = 101293, size = 52, unitId = "player", caster = "player", filter = "BUFF" },
			-- Essence of Life (Petrified Pickled Egg)
			{ spellID = 101289, size = 52, unitId = "player", caster = "player", filter = "BUFF" },
			-- Loom of Fate (Spidersilk Spindle)
			{ spellID = 96945, size = 52, unitId = "player", caster = "player", filter = "BUFF" },
			-- Stay of Execution (Stay of Execution)
			{ spellID = 96988, size = 52, unitId = "player", caster = "player", filter = "BUFF" },

			-- 378/384/397/401 4.3
			-- Foul Gift (Foul Gift of the Demon Lord)
			{ spellID = 102662, size = 52, unitId = "player", caster = "player", filter = "BUFF", absID = true },
			-- Foul Gift (Foul Gift of the Demon Lord)
			{ spellID = 109908, size = 52, unitId = "player", caster = "player", filter = "DEBUFF", absID = true },
			-- Titanic Strength (Eye of Unmaking/Rotting Skull)
			{ spellID = 109750, size = 52, unitId = "player", caster = "player", filter = "BUFF" },
			-- -- Expansive Mind (Heart of Unliving)
			-- { spellID = 109813, size = 52, unitId = "player", caster = "player", filter = "BUFF" },
			-- Preternatural Evasion (Resolve of Undying)
			{ spellID = 109782, size = 52, unitId = "player", caster = "player", filter = "BUFF" },
			-- Combat Mind (Will of Unbinding)
			{ spellID = 109795, size = 52, unitId = "player", caster = "player", filter = "BUFF" },
			-- Combat Trance (Wrath of Unchaining)
			{ spellID = 109719, size = 52, unitId = "player", caster = "player", filter = "BUFF" },
			-- Find Weakness (Creche of the Final Dragon)
			{ spellID = 109744, size = 52, unitId = "player", caster = "player", filter = "BUFF" },
			-- Ultimate Power (Bottled Wishes/Reflection of the Light)
			{ spellID = 109792, size = 52, unitId = "player", caster = "player", filter = "BUFF" },
			-- Elusive (Fire of the Deep)
			{ spellID = 109779, size = 52, unitId = "player", caster = "player", filter = "BUFF" },
			-- Velocity (Insignia of the Corrupted Mind/Seal of the Seven Signs)
			{ spellID = 109789, size = 52, unitId = "player", caster = "player", filter = "BUFF" },
			-- Agile (Kiroptyric Sigil)
			{ spellID = 109715, size = 52, unitId = "player", caster = "player", filter = "BUFF" },
			-- Master Tactician (Soulshifter Vortex)
			{ spellID = 109776, size = 52, unitId = "player", caster = "player", filter = "BUFF" },
			-- Slowing the Sands - weapon caster DW
			{ spellID = 107804, size = 52, unitId = "player", caster = "all", filter = "BUFF" },
			-- Beast Fury - weapon agi DW
			{ spellID = 109863, size = 52, unitId = "player", caster = "player", filter = "BUFF" },
		},

		{
			Name = "TRINKET_CD_ICON",
			Direction = "HORIZONTAL",
			Interval = 1,
			Mode = "ICON",
			Opacity = 0.5,
			--setPoint = { "LEFT", UIParent, "CENTER", 0, -230 },
			setPoint = { "LEFT", UIParent, "CENTER", 0, -80 },
		-- Trinkets
			-- 1st trinket
			{ slotID = 13, size = 37, filter = "CD" },
			-- 2nd trinket
			{ slotID = 14, size = 37, filter = "CD" },
		},

		{
			Name = "COOLDOWN",
			Direction = "HORIZONTAL",
			Interval = 1,
			Mode = "ICON",
			Opacity = 0.5,
			setPoint = { "LEFT", UIParent, "CENTER", 0, 0 },

			-- Power Torrent
			{ spellID = 74241, trigger = "BUFF", size = 47, duration = 45, filter = "ICD" }, -- if slotID not specified, spellID is used as icon
			--{ spellID = 74241, trigger = "BUFF", size = 47, duration = 45, slotID = 16, filter = "ICD" }, -- if slotID not specified, spellID is used as icon
			-- Lifeblood (Herbalism)
			{ spellID = 55503, size = 32, filter = "CD" },
		},

		{
			Name = "SPECIAL_P_BUFF_ICON",
			--Name = "P_BUFF_ICON",
			Direction = "LEFT",
			Interval = 4,
			Mode = "ICON",
			setPoint = { "RIGHT", UIParent, "CENTER", -148, -233 },

			-- Firelands
			-- Molten Feather (Alysrazor)
			{ spellID = 97128, size = 72, unitId = "player", caster = "all", filter = "BUFF" },
			-- Wings of Flame (Alysrazor)
			{ spellID = 98619, size = 72, unitId = "player", caster = "all", filter = "BUFF" },
			-- Vital Flame (Baleroc)
			{ spellID = 99262, size = 72, unitId = "player", caster = "all", filter = "BUFF" },
			-- Vital Spark (Baleroc)
			{ spellID = 99263, size = 72, unitId = "player", caster = "all", filter = "BUFF" },

			----
			-- Geisterstunde/Witching Hour
			{ spellID = 90887, size = 32, unitId = "player", caster = "player", filter = "BUFF" },
			-- Erkenntnis des Herzens/Heart's Revelation
			{ spellID = 91027, size = 32, unitId = "player", caster = "player", filter = "BUFF" },
			-- Richturteil des Herzens/Heart's Judgement
			{ spellID = 91041, size = 32, unitId = "player", caster = "player", filter = "BUFF" },

			-- Hyperspeed Accelerators/Hypergeschwindigkeitsbeschleuniger
			{ spellID = 54758, size = 32, unitId = "player", caster = "player", filter = "BUFF" },
			-- Synapse Springs/Synapsenfedern
			{ spellID = 82175, size = 32, unitId = "player", caster = "player", filter = "BUFF" },

			-- Lifeblood (Herbalism)
			{ spellID = 55503, size = 32, unitId = "player", caster = "player", filter = "BUFF" },

			-- Speed/Geschwindigkeit
			{ spellID = 53908, size = 32, unitId = "player", caster = "player", filter = "BUFF" },
			-- Wild Magic/Wilde Magie
			{ spellID = 53909, size = 32, unitId = "player", caster = "player", filter = "BUFF" },

			-- Tricks of the Trade/Schurkenhandel
			{ spellID = 57934, size = 32, unitId = "player", caster = "all", filter = "BUFF" },
			-- Power Infusion/Seele der Macht
			{ spellID = 10060, size = 32, unitId = "player", caster = "all", filter = "BUFF" },
			-- Bloodlust/Kampfrausch
			{ spellID = 2825, size = 32, unitId = "player", caster = "all", filter = "BUFF" },
			-- Heroism/Heldentum
			{ spellID = 32182, size = 32, unitId = "player", caster = "all", filter = "BUFF" },
			-- Time Warp
			{ spellID = 80353, size = 32, unitId = "player", caster = "all", filter = "BUFF" },
			-- Ancient Hysteria
			{ spellID = 90355, size = 32, unitId = "player", caster = "all", filter = "BUFF" },
		},
		{
			Name = "PVE/PVP_P_DEBUFF_ICON",
			Direction = "UP",
			Interval = 4,
			Mode = "ICON",
			setPoint = { "RIGHT", UIParent, "CENTER", -240, -80 },

			-- Death Knight
			-- Gnaw (Ghoul)
			{ spellID = 47481, size = 72, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Strangulate
			{ spellID = 47476, size = 72, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Chains of Ice
			{ spellID = 45524, size = 72, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Desecration (no duration, lasts as long as you stand in it)
			{ spellID = 55741, size = 72, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Glyph of Heart Strike
			{ spellID = 58617, size = 72, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Icy Clutch (Chilblains)
			--{ spellID = 50436, size = 72, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Hungering Cold
			{ spellID = 61058, size = 72, unitId = "player", caster = "all", filter = "DEBUFF" },

			-- Druid
			-- Cyclone
			{ spellID = 33786, size = 72, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Hibernate
			{ spellID = 2637, size = 72, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Bash
			{ spellID = 5211, size = 72, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Maim
			{ spellID = 22570, size = 72, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Pounce
			{ spellID = 9005, size = 72, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Entangling Roots
			{ spellID = 339, size = 72, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Feral Charge Effect
			{ spellID = 45334, size = 72, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Infected Wounds
			{ spellID = 58179, size = 72, unitId = "player", caster = "all", filter = "DEBUFF" },

			-- Hunter
			-- Freezing Trap Effect
			--{ spellID = 3355, size = 72, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Freezing Arrow Effect
			--{ spellID = 60210, size = 72, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Scare Beast
			{ spellID = 1513, size = 72, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Scatter Shot
			{ spellID = 19503, size = 72, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Chimera Shot - Scorpid
			--{ spellID = 53359, size = 72, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Snatch (Bird of Prey)
			{ spellID = 50541, size = 72, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Silencing Shot
			{ spellID = 34490, size = 72, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Intimidation
			{ spellID = 24394, size = 72, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Sonic Blast (Bat)
			{ spellID = 50519, size = 72, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Ravage (Ravager)
			{ spellID = 50518, size = 72, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Concussive Barrage
			{ spellID = 35101, size = 72, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Concussive Shot
			{ spellID = 5116, size = 72, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Frost Trap Aura
			{ spellID = 13810, size = 72, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Glyph of Freezing Trap
			{ spellID = 61394, size = 72, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Wing Clip
			{ spellID = 2974, size = 72, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Counterattack
			{ spellID = 19306, size = 72, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Entrapment
			{ spellID = 19185, size = 72, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Pin (Crab)
			{ spellID = 50245, size = 72, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Venom Web Spray (Silithid)
			{ spellID = 54706, size = 72, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Web (Spider)
			{ spellID = 4167, size = 72, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Froststorm Breath (Chimera)
			{ spellID = 95725, size = 72, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Tendon Rip (Hyena)
			--{ spellID = 51209, size = 72, unitId = "player", caster = "all", filter = "DEBUFF" },

			-- Mage
			-- Dragon's Breath
			{ spellID = 31661, size = 72, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Polymorph
			{ spellID = 118, size = 72, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Silenced - Improved Counterspell
			{ spellID = 18469, size = 72, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Deep Freeze
			{ spellID = 44572, size = 72, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Freeze (Water Elemental)
			{ spellID = 33395, size = 72, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Frost Nova
			{ spellID = 122, size = 72, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Shattered Barrier
			{ spellID = 55080, size = 72, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Chilled
			{ spellID = 6136, size = 72, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Cone of Cold
			{ spellID = 120, size = 72, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Slow
			{ spellID = 31589, size = 72, unitId = "player", caster = "all", filter = "DEBUFF" },

			-- Paladin
			-- Repentance
			{ spellID = 20066, size = 72, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Turn Evil
			{ spellID = 10326, size = 72, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Shield of the Templar
			{ spellID = 63529, size = 72, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Hammer of Justice
			{ spellID = 853, size = 72, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Holy Wrath
			{ spellID = 2812, size = 72, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Stun (Seal of Justice proc)
			{ spellID = 20170, size = 72, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Avenger's Shield
			{ spellID = 31935, size = 72, unitId = "player", caster = "all", filter = "DEBUFF" },

			-- Priest
			-- Psychic Horror
			{ spellID = 64058, size = 72, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Mind Control
			{ spellID = 605, size = 72, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Psychic Horror
			{ spellID = 64044, size = 72, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Psychic Scream
			{ spellID = 8122, size = 72, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Silence
			{ spellID = 15487, size = 72, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Mind Flay
			{ spellID = 15407, size = 72, unitId = "player", caster = "all", filter = "DEBUFF" },

			-- Rogue
			-- Dismantle
			{ spellID = 51722, size = 72, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Blind
			{ spellID = 2094, size = 72, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Gouge
			{ spellID = 1776, size = 72, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Sap
			{ spellID = 6770, size = 72, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Garrote - Silence
			{ spellID = 1330, size = 72, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Silenced - Improved Kick
			{ spellID = 18425, size = 72, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Cheap Shot
			{ spellID = 1833, size = 72, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Kidney Shot
			{ spellID = 408, size = 72, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Blade Twisting
			{ spellID = 31125, size = 72, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Crippling Poison
			{ spellID = 3409, size = 72, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Deadly Throw
			{ spellID = 26679, size = 72, unitId = "player", caster = "all", filter = "DEBUFF" },

			-- Shaman
			-- Hex
			{ spellID = 51514, size = 72, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Earthgrab
			{ spellID = 64695, size = 72, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Freeze
			{ spellID = 63685, size = 72, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Stoneclaw Stun
			{ spellID = 39796, size = 72, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Earthbind
			{ spellID = 3600, size = 72, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Frost Shock
			{ spellID = 8056, size = 72, unitId = "player", caster = "all", filter = "DEBUFF" },

			-- Warlock
			-- Banish
			{ spellID = 710, size = 72, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Death Coil
			{ spellID = 6789, size = 72, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Fear
			{ spellID = 5782, size = 72, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Howl of Terror
			{ spellID = 5484, size = 72, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Seduction (Succubus)
			{ spellID = 6358, size = 72, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Spell Lock (Felhunter)
			{ spellID = 24259, size = 72, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Shadowfury
			{ spellID = 30283, size = 72, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Intercept (Felguard)
			{ spellID = 30153, size = 72, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Aftermath
			{ spellID = 18118, size = 72, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Curse of Exhaustion
			{ spellID = 18223, size = 72, unitId = "player", caster = "all", filter = "DEBUFF" },

			-- Warrior
			-- Intimidating Shout
			{ spellID = 20511, size = 72, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Disarm
			{ spellID = 676, size = 72, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Silenced (Gag Order)
			{ spellID = 18498, size = 72, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Charge Stun
			{ spellID = 7922, size = 72, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Concussion Blow
			{ spellID = 12809, size = 72, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Intercept
			{ spellID = 20253, size = 72, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Revenge Stun
			--{ spellID = 12798, size = 72, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Shockwave
			{ spellID = 46968, size = 72, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Glyph of Hamstring
			{ spellID = 58373, size = 72, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Improved Hamstring
			{ spellID = 23694, size = 72, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Hamstring
			{ spellID = 1715, size = 72, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Piercing Howl
			{ spellID = 12323, size = 72, unitId = "player", caster = "all", filter = "DEBUFF" },

			-- Racials
			-- War Stomp
			{ spellID = 20549, size = 72, unitId = "player", caster = "all", filter = "DEBUFF" },

			-- Baradin Hold(PvP)
			-- Meteor Slash/Meteorschlag (Argaloth)
			{ spellID = 88942, size = 72, unitId = "player", caster = "all", filter = "DEBUFF" },

			-- Bastion of Twilight
			-- Blackout/Blackout (Valiona & Theralion)
			{ spellID = 92879, size = 72, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Engulfing Magic/Einh�llende Magie (Valiona & Theralion)
			{ spellID = 86631, size = 72, unitId = "player", caster = "all", filter = "DEBUFF" },
			--Twilight Meteorite
			{ spellID = 74792, size = 72, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Waterlogged/Wasserdurchtr�nkt (Twilight Ascendant Council)
			{ spellID = 82762, size = 72, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Burning Blood/Brennendes Blut (Twilight Ascendant Council)
			{ spellID = 82662, size = 72, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Heart of Ice/Herz aus Eis (Twilight Ascendant Council)
			{ spellID = 82667, size = 72, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Frozen/Gefroren (Twilight Ascendant Council)
			{ spellID = 92503, size = 72, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Swirling Winds/Wirbelnde Winde (Twilight Ascendant Council)
			{ spellID = 83500, size = 72, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Magnetic Pull/Magnetische Anziehung (Twilight Ascendant Council)
			{ spellID = 83587, size = 72, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Corruption: Accelerated/Verderbnis: Beschleunigung (Cho'gall)
			{ spellID = 81836, size = 72, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Corruption: Malformation/Verderbnis: Missbildung (Cho'gall)
			{ spellID = 82125, size = 72, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Corruption: Absolute/Verderbnis: Vollendet (Cho'gall)
			{ spellID = 82170, size = 72, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Corruption: Sickness/Verderbnis: Krankheit (Cho'gall)
			{ spellID = 93200, size = 72, unitId = "player", caster = "all", filter = "DEBUFF" },

			-- Blackwing Descent
			-- Constricting Chains/Fesselnde Ketten (Magmaw)
			{ spellID = 91911, size = 72, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Parasitic Infection/Parasit�re Infektion (Magmaw)
			{ spellID = 94679, size = 72, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Infectious Vomit/Infekti�ses Erbrochenes (Magmaw)
			{ spellID = 91923, size = 72, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Lightning Conductor (Omnitron Defense System)
			{ spellID = 91433, size = 72, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Shadow Infusion/Schattenmacht (Omnitron Defense System)
			{ spellID = 92048, size = 72, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Flash Freeze/Blitzeis (Maloriak)
			{ spellID = 77699, size = 72, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Consuming Flames/Verzehrende Flammen (Maloriak)
			{ spellID = 77786, size = 72, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Finkle's Mixture/Finkels Mixtur (Chimaeron)
			{ spellID = 82705, size = 72, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Shadow Conductor/Schattenleiter (Nefarian)
			{ spellID = 92053, size = 72, unitId = "player", caster = "all", filter = "DEBUFF" },

			-- Throne of Four Winds
			-- Wind Chill/Windk�hle (Conclave of Wind)
			{ spellID = 93123, size = 72, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Slicing Gale/Schneidender Orkan (Conclave of Wind)
			{ spellID = 93058, size = 72, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Static Shock/Statischer Schock (Al'Akir)
			{ spellID = 87873, size = 72, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Acid Rain/S�ureregen (Al'Akir)
			{ spellID = 93279, size = 72, unitId = "player", caster = "all", filter = "DEBUFF" },

			-- Firelands
			-- Magma Rupture (Shannox)
			{ spellID = 99840, size = 72, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Crystal Prison Trap (Shannox)
			{ spellID = 99837, size = 72, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Jagged Tear (Shannox)
			{ spellID = 99936, size = 72, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Eruption (Lord Rhyolith)
			{ spellID = 98492, size = 72, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Blazing Power (Alysrazor)
			{ spellID = 99461, size = 72, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Alysra's Razor (Alysrazor)
			{ spellID = 100029, size = 72, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- The Widow's Kiss (Beth'tilac)
			{ spellID = 99506, size = 72, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Torment (Baleroc)
			{ spellID = 99256, size = 72, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Tormented (Baleroc)
			{ spellID = 99257, size = 72, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Blaze of Glory (Baleroc)
			{ spellID = 99252, size = 72, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Searing Seeds (Majordomo Staghelm)
			{ spellID = 98450, size = 72, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Burning Orbs (Majordomo Staghelm)
			{ spellID = 98451, size = 72, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Blazing Heat (Ragnaros)
			{ spellID = 100460, size = 72, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Burning Wound (Ragnaros)
			{ spellID = 101239, size = 72, unitId = "player", caster = "all", filter = "DEBUFF" },

			-- Dragon Soul
			--Morchok
			-- Safe
			{ spellID = 103541, size = 72, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Warning
			{ spellID = 103536, size = 72, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Danger
			{ spellID = 103534, size = 72, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Black Blood of the Earth
			{ spellID = 108570, size = 72, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Crush Armor
			{ spellID = 33661, size = 72, unitId = "player", caster = "all", filter = "DEBUFF" },
			--Warlord Zon'ozz
			-- Disrupting Shadows
			{ spellID = 103434, size = 72, unitId = "player", caster = "all", filter = "DEBUFF" },
			--Yor'sahj the Unsleeping
			-- Deep Corruption
			{ spellID = 103628, size = 72, unitId = "player", caster = "all", filter = "DEBUFF" },
			--Hagara the Stormbinder
			-- Frostflake
			{ spellID = 109325, size = 72, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Target
			{ spellID = 105285, size = 72, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Shattered Ice
			{ spellID = 105289, size = 72, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Ice Tomb
			{ spellID = 104451, size = 72, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Lightning Storm
			{ spellID = 105465, size = 72, unitId = "player", caster = "all", filter = "DEBUFF" },
			--Ultraxion
			-- Heroic Will
			{ spellID = 106108, size = 72, unitId = "player", caster = "all", filter = "BUFF" },
			-- Looming Darkness
			{ spellID = 106498, size = 72, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Twilight Burst
			{ spellID = 106415, size = 72, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Fading Light
			{ spellID = 109075, size = 72, unitId = "player", caster = "all", filter = "BUFF" },
			--Warmaster Blackhorn
			-- Twilight Barrage
			{ spellID = 109204, size = 72, unitId = "player", caster = "all", filter = "DEBUFF" },
			--Spine of Deathwing
			-- Searing Plasma
			{ spellID = 105479, size = 72, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Fiery Grip
			{ spellID = 105490, size = 72, unitId = "player", caster = "all", filter = "DEBUFF" },
			--Madness of Deathwing
		},
		{
			Name = "PVP_T_BUFF_ICON",
			Direction = "UP",
			Interval = 4,
			Mode = "ICON",
			setPoint = { "LEFT", UIParent, "CENTER", 240, -80 },

			-- Aspect of the Pack
			{ spellID = 13159, size = 72, unitId = "player", caster = "player", filter = "BUFF" },
			-- Innervate
			{ spellID = 29166, size = 72, unitId = "target", caster = "all", filter = "BUFF"},
			-- Spell Reflection
			{ spellID = 23920, size = 72, unitId = "target", caster = "all", filter = "BUFF" },
			-- Aura Mastery
			{ spellID = 31821, size = 72, unitId = "target", caster = "all", filter = "BUFF" },
			-- Ice Block
			{ spellID = 45438, size = 72, unitId = "target", caster = "all", filter = "BUFF" },
			-- Cloak of Shadows
			{ spellID = 31224, size = 72, unitId = "target", caster = "all", filter = "BUFF" },
			-- Divine Shield
			{ spellID = 642, size = 72, unitId = "target", caster = "all", filter = "BUFF" },
			-- Deterrence
			{ spellID = 19263, size = 72, unitId = "target", caster = "all", filter = "BUFF" },
			-- Anti-Magic Shell
			{ spellID = 48707, size = 72, unitId = "target", caster = "all", filter = "BUFF" },
			-- Lichborne
			{ spellID = 49039, size = 72, unitId = "target", caster = "all", filter = "BUFF" },
			-- Hand of Freedom
			{ spellID = 1044, size = 72, unitId = "target", caster = "all", filter = "BUFF" },
			-- Hand of Sacrifice
			{ spellID = 6940, size = 72, unitId = "target", caster = "all", filter = "BUFF" },
			-- Grounding Totem Effect
			{ spellID = 8178, size = 72, unitId = "target", caster = "all", filter = "BUFF" },
		},
	},
--]]
}