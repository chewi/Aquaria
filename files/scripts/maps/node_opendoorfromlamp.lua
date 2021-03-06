-- Copyright (C) 2007, 2010 - Bit-Blot
--
-- This file is part of Aquaria.
--
-- Aquaria is free software; you can redistribute it and/or
-- modify it under the terms of the GNU General Public License
-- as published by the Free Software Foundation; either version 2
-- of the License, or (at your option) any later version.
--
-- This program is distributed in the hope that it will be useful,
-- but WITHOUT ANY WARRANTY; without even the implied warranty of
-- MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
--
-- See the GNU General Public License for more details.
--
-- You should have received a copy of the GNU General Public License
-- along with this program; if not, write to the Free Software
-- Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA  02111-1307, USA.

if not v then v = {} end
if not AQUARIA_VERSION then dofile("scripts/entities/entityinclude.lua") end

v.lamp = 0
v.door = 0

function init(me)
	node_setCursorActivation(me, false)
end

function activate(me)
end

function update(me, dt)
	if v.lamp == 0 then
		v.lamp = node_getNearestEntity(me, "songlamp1")
	end
	if v.door == 0 then
		v.door = node_getNearestEntity(me, "EnergyDoor")
	end
	if v.lamp ~= 0 and entity_isState(v.lamp, STATE_ON) then
		if v.door ~= 0 and not entity_isState(v.door, STATE_OPEN) and not entity_isState(v.door, STATE_OPENED) then
			entity_setState(v.door, STATE_OPEN)
		end
	end
end
