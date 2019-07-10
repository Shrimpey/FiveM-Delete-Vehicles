RegisterNetEvent('vehiclesDestructor')
local shouldDelete = false

AddEventHandler('vehiclesDestructor', function()
	print("Got event, deleting vehicles...\n")
	shouldDelete = true
end)

Citizen.CreateThread(function()
	while(true) do
		if shouldDelete then
			print("Triggered async function, waiting for player to exit vehicle...\n")
			Citizen.Wait(15000)	-- Wait 15 seconds to make sure disconnected player exited vehicle
			
			for veh in EnumerateVehicles() do
				if DoesEntityExist(veh) then
					if IsVehicleSeatFree(veh, -1) then
						DeleteEntity(veh)
						Citizen.Trace("Deleting vehicle...")
					end
				end
			end
			
			Citizen.Trace("Finished deleting vehicles...")
		
			shouldDelete = false
		end
        Citizen.Wait(0)
	end
end)