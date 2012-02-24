--[[

	Filger
	Copyright (c) 2009, Nils Ruesch
	All rights reserved.

]]

-- http://lua-users.org/wiki/SortedIteration

-- TODO:
-- 1) Is there a way to have the icon show when a spell is ready? YES but GCD causes problem: icon is flickering (check ACD in iFilger to see this problem)

local T, C, L = unpack(Tukui) -- Import: T - functions, constants, variables; C - config; L - locales

local _, ns = ...
local Filger_Spells = ns.Filger_Spells
local Filger = {}

function Filger:UnitBuff(unitID, inSpellID, spn, absID)
--print("UnitBuff:"..tostring(unitID).."  "..tostring(inSpellID).."  "..tostring(spn).."  "..tostring(absID))
	if absID then
		for i = 1, 40, 1 do
			local name, rank, icon, count, debuffType, duration, expirationTime, unitCaster, isStealable, shouldConsolidate, spellID = UnitBuff(unitID, i)
			if not name then break end
			if inSpellID == spellID then
				return name, rank, icon, count, debuffType, duration, expirationTime, unitCaster, isStealable, shouldConsolidate, spellID
			end
		end
	else
		return UnitBuff(unitID, spn)
	end
	return nil
end

function Filger:UnitDebuff(unitID, inSpellID, spn, absID)
--print("UnitDebuff:"..tostring(unitID).."  "..tostring(inSpellID).."  "..tostring(spn).."  "..tostring(absID))
	if absID then
		for i = 1, 40, 1 do
			local name, rank, icon, count, debuffType, duration, expirationTime, unitCaster, isStealable, shouldConsolidate, spellID = UnitDebuff(unitID, i)
			if not name then break end
			if inSpellID == spellID then
				return name, rank, icon, count, debuffType, duration, expirationTime, unitCaster, isStealable, shouldConsolidate, spellID
			end
		end
	else
		return UnitDebuff(unitID, spn)
	end
	return nil
end

function Filger:UpdateCD(elapsed)
	local time = self.value.start + self.value.duration - GetTime()
	if time < 0 then
		local frame = self:GetParent()
--local toRemove = frame.actives[self.activeIndex]
--print("REMOVE["..tostring(self:GetParent().Id).."]:"..tostring(self.activeIndex).."->"..tostring(toRemove.data.spellID).."  "..tostring(toRemove.name).."  "..tostring(toRemove.data.filter))
		frame.actives[self.activeIndex] = nil
		self:SetScript("OnUpdate", nil)
		Filger.DisplayActives(frame)
	end
end

function Filger:DisplayActives()
	if not self.actives then return end
	if not self.auras then self.auras = {} end
	local id = self.Id
	local index
--print("DisplayActives:"..tostring(#self.auras).."  "..tostring(#self.actives))
	-- Create missing auras
	local previous = nil
	index = 1
	for _, _ in pairs(self.actives) do
		local aura = self.auras[index]
		if not aura then
			-- create aura
			aura = CreateFrame("Frame", "FilgerAnchor"..id.."Frame"..index, self)
			aura:Width(16) -- default value
			aura:Height(16) -- default value
			aura:SetScale(1)
			aura:SetTemplate("Default")
			-- anchor
			if index == 1 then
				aura:Point(unpack(self.setPoint))
			else
				if self.Direction == "UP" then
					aura:Point("BOTTOM", previous, "TOP", 0, self.Interval)
				elseif self.Direction == "RIGHT" or self.Direction == "HORIZONTAL" then
					aura:Point("LEFT", previous, "RIGHT", self.Interval, 0)
				elseif self.Direction == "LEFT" then
					aura:Point("RIGHT", previous, "LEFT", -self.Interval, 0)
				else
					aura:Point("TOP", previous, "BOTTOM", 0, -self.Interval)
				end
			end
			-- icon
			if aura.icon then
				aura.icon = _G[aura.icon:GetName()]
			else
				aura.icon = aura:CreateTexture("$parentIcon", "ARTWORK")
				aura.icon:Point("TOPLEFT", 2, -2)
				aura.icon:Point("BOTTOMRIGHT", -2, 2)
				aura.icon:SetTexCoord(0.1, 0.9, 0.1, 0.9)
			end
			-- cooldown
			if aura.cooldown then
				aura.cooldown = _G[aura.cooldown:GetName()]
			else
				aura.cooldown = CreateFrame("Cooldown", "$parentCD", aura, "CooldownFrameTemplate")
				aura.cooldown:SetAllPoints(aura.icon)
				aura.cooldown:SetReverse()
			end
			-- count
			if aura.count then
				aura.count = _G[aura.count:GetName()]
			else
				aura.count = aura:CreateFontString("$parentCount", "OVERLAY")
				aura.count:SetFont(C["media"].uffont, 14, "OUTLINE")
				aura.count:Point("BOTTOMRIGHT", 1, -1)
				aura.count:SetJustifyH("CENTER")
			end
			-- insert aura
			self.auras[index] = aura
		end
		-- save previous
		previous = aura
		-- next
		index = index + 1
	end

	-- local function pairsByKeys (t, f)
		-- local a = {}
		-- for n in pairs(t) do table.insert(a, n) end
		-- table.sort(a, f)
		-- local i = 0      -- iterator variable
		-- local iter = function ()   -- iterator function
			-- i = i + 1
			-- if a[i] == nil then return nil
			-- else return a[i], t[a[i]]
			-- end
		-- end
		-- return iter
	-- end
	--for k, v in pairsByKeys(self.actives) do

	-- -- Sort actives
	-- if not self.sortedIndex then self.sortedIndex = {} end
	-- local activeCount = 1
	-- for n in pairs(self.actives) do
-- --print("UNSORTED "..tostring(n))
		-- self.sortedIndex[activeCount] = n
		-- activeCount = activeCount + 1
	-- end
	-- table.sort(self.sortedIndex)
-- for n in pairs(self.sortedIndex) do
-- print("SORTED "..tostring(n).."  "..tostring(self.sortedIndex[n]))
-- end

	-- Update texture, count, cd, size, opacity
	local totalWidth = 0
	index = 1
	for activeIndex, value in pairs(self.actives) do
	--for n in pairs(self.sortedIndex) do
		-- if n >= activeCount then
			-- break -- sortedIndex may be greater than actives
		-- end
		-- local activeIndex = self.sortedIndex[n]
		-- local value = self.actives[activeIndex] -- Get sorted active

--print("SHOW:"..tostring(activeIndex).."  "..tostring(index).."  "..tostring(value.name).."  "..tostring(value.data.spellID))
		local aura = self.auras[index]
		aura.icon:SetTexture(value.icon)
		if value.count and value.count > 1 then
			aura.count:SetText(value.count)
			aura.count:Show()
		else
			aura.count:Hide()
		end
		if value.duration and value.duration > 0 then
			CooldownFrame_SetTimer(aura.cooldown, value.start, value.duration, 1)
			if value.data.filter == "CD" or value.data.filter == "ICD" then
				aura.value = value
				aura.activeIndex = activeIndex
				aura:SetScript("OnUpdate", Filger.UpdateCD)
			else
				aura:SetScript("OnUpdate", nil)
			end
			aura.cooldown:Show()
		else
			aura:SetScript("OnUpdate", nil)
			aura.cooldown:Hide()
		end
		aura:Width(value.data.size)
		aura:Height(value.data.size)
		aura:SetAlpha(value.data.opacity or 1.0)
		totalWidth = totalWidth + value.data.size + self.Interval
		-- show
		aura:Show()
		-- next
		index = index + 1
	end
	-- Update horizontal anchoring
	if index > 1 and self.Direction == "HORIZONTAL" then
		-- Compute total width
		totalWidth = totalWidth - self.Interval -- remove last interval
		-- Get base position
		local point, relativeFrame, relativePoint, offsetX, offsetY = unpack(self.setPoint)
		-- Update x-offset: remove half the total width
		offsetX = offsetX - (totalWidth / 2)
		-- Set position
		local aura = self.auras[1]
		aura:Point(point, relativeFrame, relativePoint, offsetX, offsetY)
	end
	-- Hide remaining
	for i = index, #self.auras, 1 do
--print("HIDE:"..tostring(i))
		local aura = self.auras[i]
		aura:Hide()
	end
end

function Filger:OnEvent(event, unit)
	if event == "SPELL_UPDATE_COOLDOWN" or event == "PLAYER_TARGET_CHANGED" or event == "PLAYER_FOCUS_CHANGED" or event == "PLAYER_ENTERING_WORLD" or event == "UNIT_AURA" and (unit == "target" or unit == "player" or unit == "pet" or unit == "focus") then
		local ptt = GetPrimaryTalentTree()
		local needUpdate = false
		local id = self.Id
		for i = 1, #Filger_Spells[T.myclass][id], 1 do
			local data = Filger_Spells[T.myclass][id][i]
			if not data.spec or data.spec == ptt then
				local found = false
				local name, icon, count, duration, start
				if data.filter == "BUFF" then
					local caster, spn, expirationTime
					spn, _, icon = GetSpellInfo(data.spellID)
					name, _, _, count, _, duration, expirationTime, caster = Filger:UnitBuff(data.unitId, data.spellID, spn, data.absID)
					if name and (data.caster == "all" or data.caster == caster) then
						start = expirationTime - duration
						found = true
					end
				elseif data.filter == "DEBUFF" then
					local caster, spn, expirationTime
					spn, _, icon = GetSpellInfo(data.spellID)
					name, _, _, count, _, duration, expirationTime, caster = Filger:UnitDebuff(data.unitId, data.spellID, spn, data.absID)
					if name and (data.caster == "all" or data.caster == caster) then
						start = expirationTime - duration
						found = true
					end
				elseif data.filter == "IBUFF" and (not data.incombat or InCombatLockdown()) then
					local spn
					spn, _, icon = GetSpellInfo(data.spellID)
					name = Filger:UnitBuff(data.unitId, data.spellID, spn, data.absID)
					if not name then
						found = true
						name = spn
					end
				elseif data.filter == "IDEBUFF" and (not data.incombat or InCombatLockdown()) then
					local spn
					spn, _, icon = GetSpellInfo(data.spellID)
					name = Filger:UnitDebuff(data.unitId, data.spellID, spn, data.absID)
					if not name then
						found = true
						name = spn
					end
				elseif data.filter == "CD" then
					if data.spellID then
						name, _, icon = GetSpellInfo(data.spellID)
						if data.name then
							start, duration = GetSpellCooldown(data.name)
						else
							start, duration = GetSpellCooldown(name)
						end
					elseif data.slotID then
						local slotLink = GetInventoryItemLink("player", data.slotID)
						if slotLink then
							name, _, _, _, _, _, _, _, _, icon = GetItemInfo(slotLink)
							start, duration = GetInventoryItemCooldown("player", data.slotID)
						end
					end
					if name and (duration or 0) > 1.5 then
						found = true
					end
				elseif data.filter == "ICD" then
					if data.trigger == "BUFF" then
						local spn
						spn, _, icon = GetSpellInfo(data.spellID)
						name = Filger:UnitBuff("player", data.spellID, spn, data.absID)
					elseif data.trigger == "DEBUFF" then
						local spn
						spn, _, icon = GetSpellInfo(data.spellID)
						name = Filger:UnitDebuff("player", data.spellID, spn, data.absID)
					end
					if name then
						if data.slotID then
							local slotLink = GetInventoryItemLink("player", data.slotID)
							_, _, _, _, _, _, _, _, _, icon = GetItemInfo(slotLink)
						end
						duration = data.duration
						start = GetTime()
						found = true
					end
				end
				if found then
					if not self.actives then self.actives = {} end
					if not self.actives[i] then
--print("INSERT["..tostring(id).."]:"..tostring(i).."->"..tostring(data.spellID).." "..tostring(name).." "..tostring(data.filter).." "..tostring(count).." "..tostring(start).." "..tostring(duration))
						self.actives[i] = {data = data, name = name, icon = icon, count = count, start = start, duration = duration}
						needUpdate = true
					else
						if data.filter ~= "ICD" and (self.actives[i].count ~= count or self.actives[i].start ~= start or self.actives[i].duration ~= duration) then
--print("UPDATE["..tostring(id).."]:"..tostring(i).."->"..tostring(data.spellID).." "..tostring(name).." "..tostring(data.filter).." "..tostring(count).." "..tostring(start).." "..tostring(duration))
							self.actives[i].count = count
							self.actives[i].start = start
							self.actives[i].duration = duration
							needUpdate = true
						end
					end
				else
					if data.filter ~= "ICD" and self.actives and self.actives[i] then
--local toRemove = self.actives[i]
--print("REMOVE["..tostring(id).."]:"..tostring(i).."->"..tostring(toRemove.data.spellID).."  "..tostring(toRemove.name).."  "..tostring(toRemove.data.filter))
						self.actives[i] = nil -- remove BUFF/DEBUFF/CD(only when BUFF/DEBUFF modified, CD are removed in UpdateCD)
						needUpdate = true
					end
				end
			end
		end

		if needUpdate and self.actives then
-- for k, v in pairs(self.actives) do
-- print("ACTIVE["..tostring(id).."]:"..tostring(k).."->"..tostring(v.data.spellID).." "..tostring(v.name))
-- end
			Filger.DisplayActives(self)
		end
	end
end

-- Build final spell-list
if Filger_Spells and Filger_Spells["ALL"] then
	-- add spell-list found in section ALL to class-specific section
	if not Filger_Spells[T.myclass] then
		Filger_Spells[T.myclass] = {}
	end

	for i = 1, #Filger_Spells["ALL"], 1 do
		-- merge similar spell-list (compare using Name and merge flag set) otherwise add another spell-list
		local merge = false
		local spellListAll = Filger_Spells["ALL"][i]
		local spellListClass = nil
		for j = 1, #Filger_Spells[T.myclass], 1 do
			spellListClass = Filger_Spells[T.myclass][j]
			local mergeAll = spellListAll.Merge or false
			local mergeClass = spellListClass.Merge or false
			if spellListClass.Name == spellListAll.Name and (mergeAll or mergeClass) then
				merge = true
				break
			end
		end
		if not merge or not spellListClass then
			-- add another spell-list
			table.insert(Filger_Spells[T.myclass], Filger_Spells["ALL"][i])
		else
			-- merge spell-list but class-specific position, direction, ...
			--DEFAULT_CHAT_FRAME:AddMessage("FILGER: MERGING SPELLS FROM "..spellListAll.Name)
			for j = 1, #spellListAll, 1 do
				table.insert(spellListClass, spellListAll[j])
			end
		end
	end
end

if Filger_Spells and Filger_Spells[T.myclass] then
	-- remove non-class specific spell-list
	for index in pairs(Filger_Spells) do
		if index ~= T.myclass then
			Filger_Spells[index] = nil
		end
	end
	-- remove invalid/disabled spell
	local idx = {}
	for i = 1, #Filger_Spells[T.myclass], 1 do
		local jdx = {}
		local data = Filger_Spells[T.myclass][i]

		if data.Enabled == false then
			print("Filger: Disabled section -> "..data.Name)
			table.insert(idx, i)
		else
			for j = 1, #data, 1 do
				local spn
				if data[j].spellID then
					spn = GetSpellInfo(data[j].spellID)
				else
					local slotLink = GetInventoryItemLink("player", data[j].slotID)
					if slotLink then
						spn = GetItemInfo(slotLink)
					end
				end

				if not spn and not data[j].slotID then -- Warning only for spell, not for trinket
					--DEFAULT_CHAT_FRAME:AddMessage("FILGER: "..data.Name)
					print("Filger: WARNING - BAD spell/slot ID -> ".. (data[j].spellID or data[j].slotID or "UNKNOWN") .."!")
					table.insert(jdx, j)
				end
			end
			for _, v in ipairs(jdx) do
				table.remove(data, v)
			end

			if #data == 0 then
				print("Filger: WARNING - EMPTY section -> "..data.Name.."!")
				table.insert(idx, i)
			end
		end
	end
	for _, v in ipairs(idx) do
		table.remove(Filger_Spells[T.myclass], v)
	end

	-- create frame for each spell-list
	for i = 1, #Filger_Spells[T.myclass], 1 do
		local data = Filger_Spells[T.myclass][i]
		local frame = CreateFrame("Frame", "FilgerFrame"..i.."_"..data.Name, UIParent)
--print("FRAME CREATED:"..tostring(frame).."  "..tostring(frame:GetName()).."  "..tostring(Filger))
		frame.Id = i
		frame.Name = data.Name
		frame.Direction = data.Direction or "DOWN"
		frame.IconSide = data.IconSide or "LEFT"
		frame.Interval = data.Interval or 3
		frame.Mode = data.Mode or "ICON"
		frame.setPoint = data.setPoint or "CENTER"
		frame:Width(Filger_Spells[T.myclass][i][1] and Filger_Spells[T.myclass][i][1].size or 100)
		frame:Height(Filger_Spells[T.myclass][i][1] and Filger_Spells[T.myclass][i][1].size or 20)
		frame:Point(unpack(data.setPoint))
		frame:SetAlpha(data.Opacity or 1.0)

		---- Set size to each spell in spell-list if specified
		-- if data.Size then
			-- for j = 1, #data, 1 do
				-- local spell = Filger_Spells[T.myclass][i][j]
				-- spell.size = data.Size
			-- end
		-- end
		-- Set default value (Size, Filter and UnitId) to each spell in spell-list
			for j = 1, #data, 1 do
				local spell = Filger_Spells[T.myclass][i][j]
			if data.Size and (ForceSize or not spell.size) then spell.size = data.Size end
			if data.Filter and not spell.filter then spell.filter = data.Filter end
			if data.UnitId and not spell.UnitId then spell.unitId = data.UnitId end
		end

		if ns.Filger_Settings.configmode then
			frame.actives = {}
			for j = 1, math.min(4,#Filger_Spells[T.myclass][i]), 1 do
				local data = Filger_Spells[T.myclass][i][j]
				local name, icon
				if data.spellID then
					name, _, icon = GetSpellInfo(data.spellID)
				elseif data.slotID then
					local slotLink = GetInventoryItemLink("player", data.slotID)
					if slotLink then
						name, _, _, _, _, _, _, _, _, icon = GetItemInfo(slotLink)
					end
				end
				frame.actives[j] = {data = data, name = name, icon = icon, count = 9, start = 0, duration = 0}
			end
			Filger.DisplayActives(frame)
		else
			local CDFound = false
			local focusFound = false
			local targetFound = false
			for j = 1, #Filger_Spells[T.myclass][i], 1 do
				local data = Filger_Spells[T.myclass][i][j]
				if data.filter == "CD" then
					CDFound = true
				elseif data.unitID == "target" then
					targetFound = true
				elseif data.unitID == "focus" then
					focusFound = true
				end
			end
			if CDFound then frame:RegisterEvent("SPELL_UPDATE_COOLDOWN") end
			if targetFound then frame:RegisterEvent("PLAYER_TARGET_CHANGED") end
			if focusFound then frame:RegisterEvent("PLAYER_FOCUS_CHANGED") end
			frame:RegisterEvent("UNIT_AURA")
			frame:RegisterEvent("PLAYER_ENTERING_WORLD")
			frame:SetScript("OnEvent", Filger.OnEvent)
		end
	end
end
