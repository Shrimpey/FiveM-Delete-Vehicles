AddEventHandler('playerDropped', function(source, reason)
	Citizen.Trace("Player disconnected, getting list of players...\n")
	
	local players = GetPlayers()
	if #players > 0 then
		TriggerClientEvent('vehiclesDestructor', players[ math.random( #players ) ])
	end
end)