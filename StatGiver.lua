local NPC_ENTRY = 90000
local REQUIRED_ITEM = 49426
local REQUIRED_AMOUNT = 100
local STACKABLE_SPELL = 80865 -- Your stacking spell

function StatGiver_OnGossipHello(event, player, creature)
    player:GossipClearMenu()
    player:GossipMenuAddItem(0, "Give 100 Emblems of Frost for +100 to all stats (stackable)", 0, 1)
    player:GossipSendMenu(1, creature)
end

function StatGiver_OnGossipSelect(event, player, creature, sender, intid, code)
    if intid == 1 then
        if player:HasItem(REQUIRED_ITEM, REQUIRED_AMOUNT) then
            player:RemoveItem(REQUIRED_ITEM, REQUIRED_AMOUNT)

            local aura = player:GetAura(STACKABLE_SPELL)

            if aura then
                local currentStacks = aura:GetStackAmount()
                if currentStacks < 100 then
                    aura:SetStackAmount(currentStacks + 1)
                    player:SendBroadcastMessage("You upgraded your stats! Total bonus: +" .. ((currentStacks + 1) * 100))
                else
                    player:SendBroadcastMessage("You are already at max stacks!")
                end
            else
                -- First time applying the aura
                player:AddAura(STACKABLE_SPELL, player)
                player:SendBroadcastMessage("You upgraded your stats! Total bonus: +100")
            end
        else
            player:SendBroadcastMessage("You need 100 Emblems of Frost.")
        end
        player:GossipComplete()
    end
end

RegisterCreatureGossipEvent(NPC_ENTRY, 1, StatGiver_OnGossipHello)
RegisterCreatureGossipEvent(NPC_ENTRY, 2, StatGiver_OnGossipSelect)

