--[[

	Filger
	Copyright (c) 2009, Nils Ruesch
	All rights reserved.

]]

-- TODO: 
-- 1) Is there a way to have the icon show when a spell is ready?
-- 2) find memory leak (should be in bars list management)

local T, C, L = unpack(Tukui) -- Import: T - functions, constants, variables; C - config; L - locales

local _, ns = ...
local f_s = ns.Filger_Settings;
local Filger_Spells = ns.Filger_Spells;

local class = select(2, UnitClass("player"))
local classcolor = RAID_CLASS_COLORS[class]
local active, bars = {}, {};
local MyUnits = {
    player = true,
    vehicle = true,
    pet = true,
}

local function FilgerUnitBuff(unitID, inSpellID, spn, absID)
	for i = 1, 40, 1 do
		local name, rank, icon, count, debuffType, duration, expirationTime, unitCaster, isStealable, shouldConsolidate, spellID = UnitBuff(unitID, i)
		if ( not name ) then break end
		if ( inSpellID == spellID ) or ( name == spn and not(absID) ) then
			return name, rank, icon, count, debuffType, duration, expirationTime, unitCaster, isStealable, shouldConsolidate, spellID
		end
	end
	return nil
end

local function FilgerUnitDebuff(unitID, inSpellID, spn, absID)
	for i = 1, 40, 1 do
		local name, rank, icon, count, debuffType, duration, expirationTime, unitCaster, isStealable, shouldConsolidate, spellID = UnitDebuff(unitID, i)
		if ( not name ) then break end
		if ( inSpellID == spellID ) or ( name == spn and not(absID) ) then
			return name, rank, icon, count, debuffType, duration, expirationTime, unitCaster, isStealable, shouldConsolidate, spellID
		end
	end
	return nil
end

local Update
local function OnUpdate(self, elapsed)
	local time = ( self.filter == "CD" or self.filter == "ICD" ) and (self.expirationTime + self.duration - GetTime()) or (self.expirationTime - GetTime())
	if (self:GetParent().Mode == "BAR") then
		self.statusbar:SetValue(time)
		if time <= 60 then
			self.time:SetFormattedText("%.1f", time)
		else
			self.time:SetFormattedText("%d:%.2d", time/60, time%60)
		end
	end
	if (time < 0 and ( self.filter == "CD" or self.filter == "ICD" ) ) then
		local id = self:GetParent().Id
		for index, value in ipairs(active[id]) do
			if (self.spellName == value.data.spellName and self.filter == value.data.filter) then
				tremove(active[id], index)
				--print("#active["..id.."]"..(#active[id]))
				break
			end
		end
		self:SetScript("OnUpdate", nil)
		Update(self:GetParent())
	end
end

function Update(self)
	local id = self.Id
	if (not bars[id]) then
		bars[id] = {}
	end
	for index, value in ipairs(bars[id]) do
		value:Hide()
	end
	local bar
	for index, value in ipairs(active[id]) do
		bar = bars[id][index]
		if (not bar) then
			bar = CreateFrame("Frame", "FilgerAnchor"..id.."Frame"..index, self)
			bar:Width(value.data.size)
			bar:Height(value.data.size)
			bar:SetScale(1)
			bar:SetTemplate("Default")
			bar:SetAlpha(value.data.Opacity or 1.0)

			-- HORIZONTAL is created as RIGHT, position will be updated later
			if (index == 1) then
				bar:Point(unpack(self.setPoint))
			else
				if (self.Direction == "UP") then
					bar:Point("BOTTOM", bars[id][index-1], "TOP", 0, self.Interval)
				elseif (self.Direction == "RIGHT" or self.Direction == "HORIZONTAL") then
					bar:Point("LEFT", bars[id][index-1], "RIGHT", self.Mode == "ICON" and self.Interval or value.data.barWidth + self.Interval, 0)
				elseif (self.Direction == "LEFT") then
					bar:Point("RIGHT", bars[id][index-1], "LEFT", self.Mode == "ICON" and -self.Interval or -(value.data.barWidth + self.Interval), 0)
				else
					bar:Point("TOP", bars[id][index-1], "BOTTOM", 0, -self.Interval)
				end
			end

			if (bar.icon) then
				bar.icon = _G[bar.icon:GetName()]
			else
				bar.icon = bar:CreateTexture("$parentIcon", "ARTWORK")
				bar.icon:Point("TOPLEFT", 2, -2)
				bar.icon:Point("BOTTOMRIGHT", -2, 2)
				bar.icon:SetTexCoord(0.1, 0.9, 0.1, 0.9)
			end

			if (self.Mode == "ICON") then
				bar.cooldown = CreateFrame("Cooldown", "$parentCD", bar, "CooldownFrameTemplate")
				bar.cooldown:SetAllPoints(bar.icon)
				bar.cooldown:SetReverse()

				if (bar.count) then
					bar.count = _G[bar.count:GetName()]
				else
					bar.count = bar:CreateFontString("$parentCount", "OVERLAY")
					bar.count:SetFont(C["media"].uffont, 14, "OUTLINE")
					bar.count:Point("BOTTOMRIGHT", 1, -1)
					bar.count:SetJustifyH("CENTER")
				end
			else
				if (bar.statusbar) then
					bar.statusbar = _G[bar.statusbar:GetName()]
				else
					bar.statusbar = CreateFrame("StatusBar", "$parentStatusBar", bar);
					bar.statusbar:Width(value.data.barWidth - 2)
					bar.statusbar:Height(value.data.size - 10)
					bar.statusbar:SetStatusBarTexture(C["media"].normTex)
					bar.statusbar:SetStatusBarColor(classcolor.r, classcolor.g, classcolor.b, 1)
					if ( self.IconSide == "LEFT" ) then
						bar.statusbar:Point("BOTTOMLEFT", bar, "BOTTOMRIGHT", 6, 2)
					elseif ( self.IconSide == "RIGHT" ) then
						bar.statusbar:Point("BOTTOMRIGHT", bar, "BOTTOMLEFT", -6, 2)
					end
				end
				bar.statusbar:SetMinMaxValues(0, 1)
				bar.statusbar:SetValue(0)

				if (bar.bg)then
					bar.bg = _G[bar.bg:GetName()]
				else
					bar.bg = CreateFrame("Frame","$parentBG", bar.statusbar)
					bar.bg:Point("TOPLEFT", -2, 2)
					bar.bg:Point("BOTTOMRIGHT", 2, -2)
					bar.bg:SetFrameStrata("BACKGROUND")
					bar.bg:SetTemplate("Default")
				end

				if (bar.background)then
					bar.background = _G[bar.background:GetName()]
				else
					bar.background = bar.statusbar:CreateTexture(nil, "BACKGROUND")
					bar.background:SetAllPoints()
					bar.background:SetTexture(C["media"].normTex)
					bar.background:SetVertexColor(0, 0, 0, 0.5)
				end

				if (bar.time)then
					bar.time = _G[bar.time:GetName()]
				else
					bar.time = bar.statusbar:CreateFontString("$parentTime", "ARTWORK")
					bar.time:SetFont(C["media"].uffont, 14, "OUTLINE")
					bar.time:Point("RIGHT", bar.statusbar, 0, 0)
				end

				if (bar.count) then
					bar.count = _G[bar.count:GetName()]
				else
					bar.count = bar:CreateFontString("$parentCount", "ARTWORK")
					bar.count:SetFont(C["media"].uffont, 14, "OUTLINE")
					bar.count:Point("BOTTOMRIGHT", 1, 1)
					bar.count:SetJustifyH("CENTER")
				end

				if (bar.spellname)then
					bar.spellname = _G[bar.spellname:GetName()]
				else
					bar.spellname = bar.statusbar:CreateFontString("$parentSpellName", "ARTWORK")
					bar.spellname:SetFont(C["media"].uffont, 14, "OUTLINE")
					bar.spellname:Point("LEFT", bar.statusbar, 2, 0)
					bar.spellname:SetPoint("RIGHT", bar.time, "LEFT")
					bar.spellname:SetJustifyH("LEFT")
				end
			end
			tinsert(bars[id], bar)
			--print("#bars["..id.."]"..(#bars[id]))
		end

		-- Update position of first 'bar' if direction is HORIZONTAL
		if ( self.Direction == "HORIZONTAL" and index == 1 ) then
			-- Compute total width
			local totalWidth = self.Interval * ( #active[id] - 1 )
			for _, v in ipairs(active[id]) do
				totalWidth = totalWidth + v.data.size
			end
			-- Get base position
			local point, relativeFrame, relativePoint, offsetX, offsetY = unpack(self.setPoint)
			-- Update x-offset: remove half the total width and center adding half median width
			offsetX = offsetX - ( totalWidth  / 2 )
			-- Set position
			bar:Point( point, relativeFrame, relativePoint, offsetX, offsetY )
		end
		
		bar.spellName = value.data.spellName

		bar.icon:SetTexture(value.icon)
		bar.count:SetText(value.count > 1 and value.count or "")
		if (self.Mode == "BAR") then
			bar.spellname:SetText(value.data.spellName)
		end
		if (value.duration > 0) then
			if (self.Mode == "ICON") then
				CooldownFrame_SetTimer(bar.cooldown, ( value.data.filter == "CD" or value.data.filter == "ICD" ) and value.expirationTime or (value.expirationTime - value.duration), value.duration, 1)
				if (value.data.filter == "CD" or value.data.filter == "ICD" ) then
					bar.expirationTime = value.expirationTime
					bar.duration = value.duration
					bar.filter = value.data.filter
					bar:SetScript("OnUpdate", OnUpdate)
				end
			else
				bar.statusbar:SetMinMaxValues(0, value.duration)
				bar.expirationTime = value.expirationTime
				bar.duration = value.duration
				bar.filter = value.data.filter
				bar:SetScript("OnUpdate", OnUpdate)
			end
		else
			if (self.Mode == "ICON") then
				bar.cooldown:Hide()
			else
				bar.statusbar:SetMinMaxValues(0, 1)
				bar.statusbar:SetValue(1)
				bar.time:SetText("")
				bar:SetScript("OnUpdate", nil)
			end
		end

		bar:Show()
	end
end

local function OnEvent(self, event, ...)
	local unit = ...
	if ((unit == "target" or unit == "player" or unit == "pet" or unit == "focus") or event == "PLAYER_TARGET_CHANGED" or event == "PLAYER_ENTERING_WORLD" or event == "SPELL_UPDATE_COOLDOWN") then
		local id = self.Id
		for i=1, #Filger_Spells[class][id], 1 do
			local data, name, rank, icon, count, debuffType, duration, expirationTime, caster, isStealable, start, enabled, slotLink, spn
			data = Filger_Spells[class][id][i]
			--DEFAULT_CHAT_FRAME:AddMessage("FILGER: spellID:"..data.spellID.." filter:"..data.filter)
			if (data.filter == "BUFF") then
				spn = GetSpellInfo(data.spellID)
				name, rank, icon, count, debuffType, duration, expirationTime, caster, isStealable = FilgerUnitBuff(data.unitId, data.spellID, spn, data.absID)
			elseif (data.filter == "DEBUFF") then
				spn = GetSpellInfo(data.spellID)
				name, rank, icon, count, debuffType, duration, expirationTime, caster, isStealable = FilgerUnitDebuff(data.unitId, data.spellID, spn, data.absID)
			elseif ( data.filter == "CD" ) then
				if (data.spellID) then
					spn = GetSpellInfo(data.spellID)
					start, duration, enabled = GetSpellCooldown(spn)
					_, _, icon = GetSpellInfo(data.spellID)
				else
					slotLink = GetInventoryItemLink("player", data.slotID);
					if (slotLink) then
						name, _, _, _, _, _, _, _, _, icon = GetItemInfo(slotLink)
						data.spellName = name
						start, duration, enabled = GetInventoryItemCooldown("player", data.slotID)
						--DEFAULT_CHAT_FRAME:AddMessage("FILGER: slotID:"..data.slotID.." filter:"..data.filter.." name:"..(name or "").." duration:"..(duration or 0).." enabled:"..(enabled or 0))
					end
				end
				count = 0
				caster = "all"
			elseif ( data.filter == "ICD" ) then
				if ( data.trigger == "BUFF" ) then
					spn = GetSpellInfo(data.spellID)
					name, _, icon = FilgerUnitBuff("player", data.spellID, spn, data.absID)
				elseif ( data.trigger == "DEBUFF" ) then
					spn = GetSpellInfo(data.spellID)
					name, _, icon = UnitDebuff("player", data.spellID, spn, data.absID)
				end
				if ( data.slotID ) then
					slotLink = GetInventoryItemLink("player", data.slotID)
					name, _, _, _, _, _, _, _, _, icon = GetItemInfo(slotLink)
					spn = name
				end
				start = GetTime()
				duration = data.duration
				caster = "all"
				count = 0
				if ( spn ) then
					enabled = 1
				end
			end
			if (not data.spellName) then
				data.spellName = spn
			end
			if (not active[id]) then
				active[id] = {}
			end
			
			-- remove existing and insert if needed
			local toInsert = true -- by default, insert in active
			if ( data.filter == "ICD" ) then
				-- Don't insert if an ICD already exists
				for index, value in ipairs(active[id]) do
					if ( data.spellName == value.data.spellName and value.data.filter == "ICD" ) then
						toInsert = false
						break
					end
				end
			else
				-- Remove existing non-ICD
				for index, value in ipairs(active[id]) do
					if (data.spellName == value.data.spellName and value.data.filter ~= "ICD" ) then
						tremove(active[id], index)
						--print("#active["..id.."]"..(#active[id]))
					end
				end
			end
			if ( toInsert ) then
				if ((name and (data.caster ~= 1 and (caster == data.caster or data.caster == "all") or MyUnits[caster])) or ((enabled or 0) > 0 and (duration or 0) > 1.5)) then
					table.insert(active[id], { data = data, icon = icon, count = count, duration = duration, expirationTime = expirationTime or start, filter == data.filter })
				end
			end
		end
		Update(self)
	end
end

if (Filger_Spells and Filger_Spells["ALL"]) then
	-- add spell-list found in section ALL to class-specific section
	if (not Filger_Spells[class]) then
		Filger_Spells[class] = {}
	end

	for i = 1, #Filger_Spells["ALL"], 1 do
		-- merge similar spell-list (compare using Name and merge flag set) otherwise add another spell-list
		local merge = false
		local spellListAll = Filger_Spells["ALL"][i]
		local spellListClass = nil
		for j = 1, #Filger_Spells[class], 1 do
			spellListClass = Filger_Spells[class][j]
			local mergeAll = spellListAll.Merge or false
			local mergeClass = spellListClass.Merge or false
			if ( spellListClass.Name == spellListAll.Name and ( mergeAll or mergeClass ) ) then
				merge = true
				break
			end
		end
		if ( not merge or spellListClass == nil ) then
			-- add another spell-list
			table.insert(Filger_Spells[class], Filger_Spells["ALL"][i])
		else
			-- merge spell-list but class-specific position, direction, ...
			--DEFAULT_CHAT_FRAME:AddMessage("FILGER: MERGING SPELLS FROM "..spellListAll.Name)
			for j = 1, #spellListAll, 1 do
				table.insert( spellListClass, spellListAll[j] )
			end
		end
	end
end

if (Filger_Spells and Filger_Spells[class]) then
	-- remove non-class specific spell-list
	for index in pairs(Filger_Spells) do
		if (index ~= class) then
			Filger_Spells[index] = nil
		end
	end
	-- remove invalid spell
	local idx, data, frame = {}
	for i = 1, #Filger_Spells[class], 1 do
		local jdx, spn = {}
		data = Filger_Spells[class][i]

		for j = 1, #data, 1 do
			if (data[j].spellID) then
				spn = GetSpellInfo(data[j].spellID)
			else
				local slotLink = GetInventoryItemLink("player", data[j].slotID);
				if (slotLink) then
					spn = GetItemInfo(slotLink)
				end
			end

			if (not spn and not data[j].slotID) then -- Warning only for spell, not for trinket
				--DEFAULT_CHAT_FRAME:AddMessage("FILGER: "..data.Name)
				print("Filger: WARNING - BAD spell/slot ID -> ".. (data[j].spellID or data[j].slotID or "UNKNOWN") .."!")
				table.insert(jdx, j)
			end
		end
		for _, v in ipairs(jdx) do
			table.remove(data, v)
		end

		if (#data == 0) then
			print("Filger: WARNING - EMPTY section -> "..data.Name.."!")
			table.insert(idx, i)
		end
	end
	for _, v in ipairs(idx) do
		table.remove(Filger_Spells[class], v)
	end
	-- create frame for each spell-list
	for i = 1, #Filger_Spells[class], 1 do
		data = Filger_Spells[class][i]

		frame = CreateFrame("Frame", "FilgerAnchor"..i, UIParent)
		frame.Id = i
		frame.Name = data.Name
		frame.Direction = data.Direction or "DOWN"
		frame.IconSide = data.IconSide or "LEFT"
		frame.Interval = data.Interval or 3
		frame.Mode = data.Mode or "ICON"
		frame.setPoint = data.setPoint or "CENTER"
		frame:Width(Filger_Spells[class][i][1] and Filger_Spells[class][i][1].size or 100)
		frame:Height(Filger_Spells[class][i][1] and Filger_Spells[class][i][1].size or 20)
		frame:Point(unpack(data.setPoint))
		frame:SetAlpha(data.Opacity or 1.0)

		if (f_s.configmode) then
			local spellIcon
			for j = 1, #Filger_Spells[class][i], 1 do
				data = Filger_Spells[class][i][j]
				if (not active[i]) then
					active[i] = {}
				end
				if (data.spellID) then
					_, _, spellIcon = GetSpellInfo(data.spellID)
				else
					local slotLink = GetInventoryItemLink("player", data.slotID)
					if (slotLink) then
						_, _, _, _, _, _, _, _, _, spellIcon = GetItemInfo(slotLink)
					end
				end
				table.insert(active[i], { data = data, icon = spellIcon, count = 9, duration = 0, expirationTime = 0, filter = data.filter })
			end
			Update(frame)
		else
			for j = 1, #Filger_Spells[class][i], 1 do
				data = Filger_Spells[class][i][j]
				if (data.filter == "CD") then
					frame:RegisterEvent("SPELL_UPDATE_COOLDOWN")
					break
				end
			end
			frame:RegisterEvent("UNIT_AURA")
			frame:RegisterEvent("PLAYER_TARGET_CHANGED")
			frame:RegisterEvent("PLAYER_ENTERING_WORLD")
			frame:SetScript("OnEvent", OnEvent)
		end
	end
end