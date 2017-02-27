setName="fu_lightpriestset"

weaponEffect={
    {stat = "powerMultiplier", baseMultiplier = 1.20}
  }
  
armorBonus={
    { stat = "cosmicResistance", amount = 0.25 }
}

require "/stats/effects/fu_armoreffects/setbonuses_common.lua"

function init()
	setSEBonusInit(setName)
	weaponHandle=effect.addStatModifierGroup({})
	daggerCheck()
	armorHandle=effect.addStatModifierGroup(armorBonus)
end

function update(dt)
	if not checkSetWorn(self.setBonusCheck) then
		effect.expire()
	else
		daggerCheck()
		status.modifyResourcePercentage("health", 0.004 * dt)
	end	
end

function daggerCheck()
	if weaponCheck("both",{"staff","wand"},false) then
		effect.setStatModifierGroup(weaponHandle,weaponEffect)
	else
		effect.setStatModifierGroup(weaponHandle,{})
	end
end