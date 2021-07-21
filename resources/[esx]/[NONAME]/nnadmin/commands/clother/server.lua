local ESX = nil

TriggerEvent('esx:getShILovePizzaaredObjILovePizzaect', function(obj) 
    ESX = obj 
end)

local MainSkin = '{"bags_2":0,"eyebrown_forward":0,"pants_2":0,"makeup_4":0,"mask_1":0,"mask_2":0,"eyebrown_high":0,"nose_bone_twist":0,"jaw_bone_width":0,"eyebrows_3":0,"moles_1":0,"lipstick_2":0,"age_1":0,"decals_1":0,"glasses_2":5,"arms_2":0,"cheeks_width":0,"beard_4":0,"chest_1":0,"watches_1":-1,"shoes":2,"nose_bone_high":0,"bracelets_2":0,"age_2":0,"chimp_bone_lowering":0,"cheeks_bone_width":0,"bproof_1":0,"watches_2":0,"ears_2":0,"beard_1":6,"chimp_hole":0,"decals_2":0,"torso_2":0,"chest_3":0,"eyebrows_2":0,"beard_2":10,"glasses_1":5,"chest_2":0,"hair_color_2":37,"beard_3":0,"chain_1":0,"makeup_3":0,"glasses":0,"hair_1":29,"lipstick_4":0,"hair_2":0,"shoes_1":35,"chimp_bone_width":0,"bracelets_1":-1,"hair_color_1":61,"cheeks_bone_high":0,"blush_2":0,"makeup_1":0,"bproof_2":0,"torso_1":18,"helmet_2":0,"arms":0,"nose_peak_lenght":0,"eyes_openning":0,"lipstick_1":0,"tshirt_2":0,"chimp_bone_lenght":0,"neck_thikness":0,"pants_1":19,"nose_peak_hight":0,"moles_2":0,"eye_color":0,"helmet_1":-1,"blush_1":0,"tshirt_1":15,"eyebrows_1":0,"makeup_2":0,"nose_peak_lowering":0,"skin":0,"sex":0,"face":19,"lips_thickness":0,"ears_1":-1,"chain_2":0,"eyebrows_4":0,"jaw_bone_back_lenght":0,"nose_width":0,"bags_1":0,"lipstick_3":0,"shoes_2":4,"blush_3":0}'
local FemaleSkin = '{"makeup_2":10,"glasses":0,"age_2":0,"blush_1":0,"makeup_1":12,"nose_bone_twist":0,"hair_color_2":19,"arms_2":0,"moles_1":0,"shoes":2,"lips_thickness":0,"eyebrows_2":33,"lipstick_3":18,"pants_1":18,"skin":8,"chest_3":0,"ears_2":0,"nose_bone_high":0,"ears_1":-1,"arms":3,"tshirt_2":0,"chimp_bone_width":0,"hair_2":0,"chest_2":0,"watches_2":0,"glasses_1":5,"moles_2":0,"lipstick_4":0,"eyes_openning":-0.39999999999998,"age_1":0,"hair_color_1":0,"blush_2":2,"neck_thikness":0,"eyebrown_high":0,"cheeks_bone_high":-0.5,"watches_1":-1,"nose_width":-0.5,"decals_2":0,"bags_1":0,"nose_peak_hight":0,"helmet_1":-1,"chain_2":0,"eye_color":5,"mask_2":0,"bags_2":0,"makeup_4":0,"jaw_bone_back_lenght":-0.99,"beard_4":0,"beard_3":0,"chimp_bone_lowering":0,"jaw_bone_width":-0.99,"bproof_1":0,"lipstick_1":0,"tshirt_1":14,"mask_1":0,"sex":1,"shoes_2":0,"nose_peak_lowering":0,"eyebrows_4":0,"torso_2":0,"shoes_1":10,"bracelets_1":-1,"makeup_3":2,"torso_1":22,"glasses_2":0,"hair_1":4,"face":25,"decals_1":0,"lipstick_2":7,"chest_1":0,"eyebrown_forward":0,"cheeks_width":0,"beard_1":0,"cheeks_bone_width":-0.99,"nose_peak_lenght":0,"chimp_bone_lenght":0,"eyebrows_1":10,"chain_1":0,"chimp_hole":0,"bproof_2":0,"bracelets_2":0,"beard_2":0,"pants_2":0,"blush_3":0,"helmet_2":0,"eyebrows_3":0}'
local AnnSkin = '{"tshirt_2":0,"mask_2":0,"chimp_hole":0,"eyebrows_3":0,"cheeks_width":0,"chest_1":0,"neck_thikness":0,"nose_bone_twist":0,"eyebrown_forward":0,"chimp_bone_width":0,"makeup_2":10,"complexion_1":0,"mask_1":0,"blemishes_2":0,"beard_1":0,"pants_2":0,"beard_4":0,"bracelets_1":-1,"arms":4,"eyebrown_high":0,"pants_1":51,"beard_2":0,"nose_width":-0.5,"decals_1":0,"age_1":0,"torso_1":178,"skin":8,"moles_1":0,"ears_1":-1,"ears_2":0,"face":25,"hair_color_1":0,"bodyb_1":0,"glasses_1":5,"age_2":0,"bproof_2":0,"eye_color":5,"blemishes_1":0,"makeup_3":2,"lipstick_1":5,"cheeks_bone_high":-0.5,"chimp_bone_lowering":0,"makeup_1":12,"complexion_2":0,"lips_thickness":0,"shoes_1":35,"bags_2":0,"chain_1":0,"chain_2":0,"hair_color_2":19,"lipstick_2":10,"shoes_2":4,"cheeks_bone_width":-0.99,"nose_peak_lenght":0,"beard_3":0,"nose_bone_high":0,"eyebrows_2":33,"chimp_bone_lenght":0,"jaw_bone_width":-0.99,"sun_2":0,"blush_1":0,"bags_1":0,"sun_1":0,"bodyb_2":0,"lipstick_4":0,"bracelets_2":0,"chest_3":0,"lipstick_3":18,"arms_2":0,"nose_peak_hight":0,"eyebrows_1":10,"hair_1":29,"moles_2":0,"helmet_2":0,"jaw_bone_back_lenght":-0.99,"chest_2":0,"sex":1,"eyebrows_4":0,"blush_2":2,"makeup_4":0,"glasses_2":0,"torso_2":5,"bproof_1":0,"helmet_1":-1,"watches_1":-1,"blush_3":0,"decals_2":0,"tshirt_1":14,"eyes_openning":-0.39999999999998,"hair_2":0,"nose_peak_lowering":0,"watches_2":0}'
TriggerEvent('es:addGroupCommand', 'zeiswitch', 'superadmin', function(source, args, user)
    local type = args[1]
    local skin = MainSkin
    local sex = 'm'
    if type == 'm' then
        skin = MainSkin
        sex = 'm'
    else
        skin = FemaleSkin
        sex = 'f'
    end

    local xPlayer = ESX.GetPlayerFromId(source)

    MySQL.Async.execute(
      'UPDATE users SET `skin` = @skin, sex = @sex WHERE identifier = @identifier',
      {
        ['@skin']       = skin,
        ['@sex'] = sex,
        ['@identifier'] = xPlayer.identifier
      }
    )
end)

TriggerEvent('es:addGroupCommand', 'annswitch', 'admin', function(source, args, user)
  local type = args[1]
  local skin = MainSkin
  local sex = 'm'
  if type == 'm' then
      skin = MainSkin
      sex = 'm'
  else
      skin = AnnSkin
      sex = 'f'
  end

  local xPlayer = ESX.GetPlayerFromId(source)

  MySQL.Async.execute(
    'UPDATE users SET `skin` = @skin, sex = @sex WHERE identifier = @identifier',
    {
      ['@skin']       = skin,
      ['@sex'] = sex,
      ['@identifier'] = xPlayer.identifier
    }
  )
end)


-- RESET SKINU
TriggerEvent('es:addGroupCommand', 'resetplayerskin', 'helper', function(source, args, user)
  local id = tonumber(args[1])
  local xPlayer = ESX.GetPlayerFromId(source)
  if not id then
    xPlayer.showNotification("Nezadal/a jsi ID")
  end

  local target = ESX.GetPlayerFromId(id)

  MySQL.Async.execute(
    'UPDATE users SET `skin` = @skin WHERE identifier = @identifier',
    {
      ['@skin']       = nil,
      ['@identifier'] = target.identifier
    }
  )
  xPlayer.showNotification("Skin vyresetovan")
end)