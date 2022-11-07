local mdhash = GetHashKey("mp_m_freemode_01")
local oldmdhash

local Character = {
	["resemblance"] = 0.8,
	["skintone"] = 0.9,
	["ddad"] = 0,
	["dmom"] = 0,
	["mom"] = 21,
	["dad"] = 0,
	["gender"] = "Male",
	["ogd"] = "M",
	["lcgd"] = "male",
	["hair"] = 13,
	['hair_color_1'] = 0,
	["outfit"] = 1,
	["beard"] = 0,
	["beard_2"] = 1,
	["beard_3"] = 26,
	["eyebrows"] = 1,
	["eyebrows_2"] = 1,
	["eyebrows_3"] = 2,
	["blush_1"] = 0,
	["blush_2"] = 1,
	["blush_3"] = 0,
	["sun_1"] = 0,
	["sun_2"] = 1,
	["complexion_1"] = 0,
	["complexion_2"] = 1,
	["bodyb_1"] = 0,
	["bodyb_2"] = 1,
	["age_1"] = 0,
	["age_2"] = 1,
	["eye_color"] = 0,
	["makeup_1"] = 0,
	["makeup_2"] = 1,
	["makeup_3"] = 0,
	["lipstick_1"] = 0,
	["lipstick_2"] = 1,
	["lipstick_3"] = 0,
	["moles_1"] = 0,
	["moles_2"] = 1,
	['neck_thick'] = 0.0,
	['chin_hole'] = 0.0,
	['chin_width'] = 0.0,
	['chin_length'] = 0.0,
	['chin_height'] = 0.0,
	['jaw_1'] = 0.0,
	['jaw_2'] = 0.0,
	['lips_thick'] = 0.0,
	['eye_open'] = 0.0,
	['cheeks_3'] = 0.0,
	['cheeks_2'] = 0.0,
	['cheeks_1'] = 0.0,
	['eyebrows_6'] = 0.0,
	['eyebrows_5'] = 0.0,
	['nose_6'] = 0.0,
	['nose_5'] = 0.0,
	['nose_4'] = 0.0,
	['nose_3'] = 0.0,
	['nose_2'] = 0.0,
	['nose_1'] = 0.0,
	['glasses'] = 0,
}

if GetResourceKvpString('lbg-char-info') ~= nil then
	Character = json.decode(GetResourceKvpString('lbg-char-info'))
end

if Character["gender"] == "Female" then
	mdhash = GetHashKey("mp_f_freemode_01")
end

local moutfits = {
	{
		[3] = {18, 0},
		[11] = {6, 5},
		[8] = {2, 2},
		[4] = {0, 4},
		[6] = {0, 10}
	},
	{
		[6] = {0, 10},
		[3] = {18, 0},
		[11] = {64, 0},
		[4] = {1, 0},
		[8] = {2, 1}
	},
	{
		[6] = {0, 10},
		[3] = {52, 0},
		[11] = {0, 0},
		[4] = {0, 0}
	},
	{
		[6] = {25, 0},
		[8] = {15, 0},
		[11] = {55, 0},
		[3] = {52, 0},
		[4] = {35, 0}
	},
	{
		[11] = {47, 0},
		[4] = {0, 0},
		[6] = {0, 10},
		[3] = {52, 0},
		[8] = {15, 0}
	}
}
local foutfits = {
	{
		[3] = {60, 0},
		[11] = {8, 2},
		[8] = {0, 6},
		[4] = {11, 1},
		[6] = {4, 0}
	},
	{
		[6] = {4, 0},
		[3] = {64, 0},
		[11] = {31, 0},
		[4] = {25, 0},
		[8] = {5, 0}
	},
	{
		[6] = {0, 0},
		[3] = {63, 0},
		[11] = {0, 0},
		[4] = {0, 0}
	},
	{
		[6] = {25, 0},
		[8] = {15, 0},
		[11] = {48, 0},
		[3] = {70, 0},
		[4] = {34, 0}
	},
	{
		[6] = {1, 1},
		[11] = {9, 9},
		[4] = {11, 1},
		[3] = {67, 0},
		[8] = {8, 0}
	}
}
local hairbrowcolors = {{28, 31, 33, 255}, {39, 42, 44, 255}, {49, 46, 44, 255}, {53, 38, 28, 255}, {75, 50, 31, 255}, {92, 59, 36, 255}, {109, 76, 53, 255}, {107, 80, 59, 255}, {118, 92, 69, 255}, {127, 104, 78, 255}, {153, 129, 93, 255}, {167, 147, 105, 255}, {175, 156, 112, 255}, {187, 160, 99, 255}, {214, 185, 123, 255}, {218, 195, 142, 255}, {159, 127, 89, 255}, {132, 80, 57, 255}, {104, 43, 31, 255}, {97, 18, 12, 255}, {100, 15, 10, 255}, {124, 20, 15, 255}, {160, 46, 25, 255}, {182, 75, 40, 255}, {162, 80, 47, 255}, {170, 78, 43, 255}, {98, 98, 98, 255}}
local allparents = {"Benjamin", "Daniel", "Joshua", "Noah", "Andrew", "Juan", "Alex", "Isaac", "Evan", "Ethan", "Vincent", "Angel", "Diego", "Adrian", "Gabriel", "Michael", "Santiago", "Kevin", "Louis", "Samuel", "Anthony", "Hannah", "Audrey", "Jasmine", "Giselle", "Amelia", "Isabella", "Zoe", "Ava", "Camila", "Violet", "Sophia", "Evelyn", "Nicole", "Ashley", "Grace", "Brianna", "Natalie", "Olivia", "Elizabeth", "Charlotte", "Emma", "Claude", "Niko", "John", "Misty"}
local fparents = {"Hannah", "Audrey", "Jasmine", "Giselle", "Amelia", "Isabella", "Zoe", "Ava", "Camila", "Violet", "Sophia", "Evelyn", "Nicole", "Ashley", "Grace", "Brianna", "Natalie", "Olivia", "Elizabeth", "Charlotte", "Emma", "Misty"}
local mparents = {"Benjamin", "Daniel", "Joshua", "Noah", "Andrew", "Juan", "Alex", "Isaac", "Evan", "Ethan", "Vincent", "Angel", "Diego", "Adrian", "Gabriel", "Michael", "Santiago", "Kevin", "Louis", "Samuel", "Anthony", "Claude", "Niko", "John"}
hairDecorDefault = {'mpbeach_overlays', "FM_hair_fuzz"}
hairDecor = {
    ['M'] = {
        [0] = {"",""}, --who doesn't like a shiny head from time to time?
        [1] = {"multiplayer_overlays", "FM_M_Hair_001_a"},
        [2] = {"multiplayer_overlays", "NG_M_Hair_002"},
        [3] = {"multiplayer_overlays", "FM_M_Hair_003_a"},
        [4] = {"multiplayer_overlays", "NG_M_Hair_004"},
        [5] = {"multiplayer_overlays", "FM_M_Hair_long_a"},
        [6] = {"multiplayer_overlays", "FM_M_Hair_006_a"},
        [8] = {"multiplayer_overlays", "FM_M_Hair_008_a"},
        [9] = {"multiplayer_overlays", "NG_M_Hair_009"},
        [10] = {"multiplayer_overlays", "NG_M_Hair_013"},
        [11] = {"multiplayer_overlays", "NG_M_Hair_002"},
        [12] = {"multiplayer_overlays", "NG_M_Hair_011"},
        [13] = {"multiplayer_overlays", "NG_M_Hair_012"},
        [14] = {"multiplayer_overlays", "NG_M_Hair_014"},
        [15] = {"multiplayer_overlays", "NG_M_Hair_015"},
        [16] = {"multiplayer_overlays", "NGBea_M_Hair_000"},
        [17] = {"multiplayer_overlays", "NGBea_M_Hair_001"},
        [18] = {"mpbusiness_overlays", "FM_Bus_M_Hair_000_a"},
        [19] = {"mpbusiness_overlays", "FM_Bus_M_Hair_001_a"},
        [20] = {"mphipster_overlays", "FM_Hip_M_Hair_000_a"},
        [21] = {"mphipster_overlays", "FM_Hip_M_Hair_001_a"},
        [22] = {"multiplayer_overlays", "NGInd_M_Hair_000"},
            --23
        [24] = {"mplowrider_overlays", "LR_M_Hair_000"},
        [25] = {"mplowrider_overlays", "LR_M_Hair_001"},
        [26] = {"mplowrider_overlays", "LR_M_Hair_002"},
        [27] = {"mplowrider_overlays", "LR_M_Hair_003"},
        [28] = {"mplowrider2_overlays", "LR_M_Hair_004"},
        [29] = {"mplowrider2_overlays", "LR_M_Hair_005"},
        [30] = {"mplowrider2_overlays", "LR_M_Hair_006"},
        [31] = {"mpbiker_overlays", "MP_Biker_Hair_000_M"},
        [32] = {"mpbiker_overlays", "MP_Biker_Hair_001_M"},
        [33] = {"mpbiker_overlays", "MP_Biker_Hair_002_M"},
        [34] = {"mpbiker_overlays", "MP_Biker_Hair_003_M"},
        [35] = {"mpbiker_overlays", "MP_Biker_Hair_004_M"},
        [36] = {"mpbiker_overlays", "MP_Biker_Hair_005_M"},

        [72] = {"mpgunrunning_overlays", "MP_Gunrunning_Hair_M_000_M"},
        [73] = {"mpgunrunning_overlays", "MP_Gunrunning_Hair_M_001_M"},
        [74] = {"mpvinewood_overlays", "MP_Vinewood_Hair_M_000_M"},
        [75] = {"mptuner_overlays", "MP_Tuner_Hair_001_M"},
        [76] = {"mpsecurity_overlays", "MP_Security_Hair_001_M"},
    },
    ['F'] = {
        [0] = {"",""}, --who doesn't like a shiny head from time to time?
        [1] = {"multiplayer_overlays", "NG_F_Hair_001"},
        [2] = {"multiplayer_overlays", "NG_F_Hair_002"},
        [3] = {"multiplayer_overlays", "FM_F_Hair_003_a"},
        [4] = {"multiplayer_overlays", "NG_F_Hair_004"},
        [5] = {"multiplayer_overlays", "FM_F_Hair_005_a"},
        [6] = {"multiplayer_overlays", "FM_F_Hair_006_a"},
        [7] = {"multiplayer_overlays", "NG_F_Hair_007"},
        [8] = {"multiplayer_overlays", "NG_F_Hair_008"},
        [9] = {"multiplayer_overlays", "NG_F_Hair_009"},
        [10] = {"multiplayer_overlays", "NG_F_Hair_010"},
        [11] = {"multiplayer_overlays", "NG_F_Hair_011"},
        [12] = {"multiplayer_overlays", "NG_F_Hair_012"},
        [13] = {"multiplayer_overlays", "FM_F_Hair_013_a"},
        [14] = {"multiplayer_overlays", "FM_F_Hair_014_a"},
        [15] = {"multiplayer_overlays", "NG_M_Hair_015"},
        [16] = {"multiplayer_overlays", "NGBea_F_Hair_000"},
        [17] = {"mpbusiness_overlays", "FM_Bus_F_Hair_a"},
        [18] = {"multiplayer_overlays", "NG_F_Hair_007"},
        [19] = {"multiplayer_overlays", "NGBus_F_Hair_000"},
        [20] = {"multiplayer_overlays", "NGBus_F_Hair_001"},
        [21] = {"multiplayer_overlays", "NGBea_F_Hair_001"},
        [22] = {"mphipster_overlays", "FM_Hip_F_Hair_000_a"},
        [23] = {"multiplayer_overlays", "NGInd_F_Hair_000"},
        --24
        [25] = {"mplowrider_overlays", "LR_F_Hair_000"},
        [26] = {"mplowrider_overlays", "LR_F_Hair_001"},
        [27] = {"mplowrider_overlays", "LR_F_Hair_002"},
        [29] = {"mplowrider2_overlays", "LR_F_Hair_003"},
        [30] = {"mplowrider2_overlays", "LR_F_Hair_004"},
        [31] = {"mplowrider2_overlays", "LR_F_Hair_006"},
        [32] = {"mpbiker_overlays", "MP_Biker_Hair_000_F"},
        [33] = {"mpbiker_overlays", "MP_Biker_Hair_001_F"},
        [34] = {"mpbiker_overlays", "MP_Biker_Hair_002_F"},
        [35] = {"mpbiker_overlays", "MP_Biker_Hair_003_F"},
        [38] = {"mpbiker_overlays", "MP_Biker_Hair_004_F"},
        [36] = {"mpbiker_overlays", "MP_Biker_Hair_005_F"},
        [37] = {"mpbiker_overlays", "MP_Biker_Hair_005_F"},

        [76] = {"mpgunrunning_overlays", "MP_Gunrunning_Hair_F_000_F"},
        [77] = {"mpgunrunning_overlays", "MP_Gunrunning_Hair_F_001_F"},
        [78] = {"mpvinewood_overlays", "MP_Vinewood_Hair_F_000_F"},
        [79] = {"mptuner_overlays", "MP_Tuner_Hair_000_F"},
        [80] = {"mpsecurity_overlays", "MP_Security_Hair_000_F"},
    },
}

function ShowNotification(text)
    SetNotificationTextEntry("STRING")
    AddTextComponentString(text)
    DrawNotification(false, false)
end

function ChangeComponents(shouldChangeModel)
	--the shouldChangeModel parameter is here for legacy purposes, because I am lazy to change up any lines of code
	--containing it. it is not requires, as it is not used.
	SetPedDefaultComponentVariation(PlayerPedId())
	SetPedHeadBlendData(PlayerPedId(), Character["mom"], Character["dad"], nil, Character["mom"], Character["dad"], nil, Character["resemblance"], Character["skintone"], nil, true)
	SetPedComponentVariation(PlayerPedId(), 2, Character["hair"], 0, 2)
	SetPedHairColor(PlayerPedId(),Character['hair_color_1'], 0)

	ClearPedDecorations(PlayerPedId())
	if hairDecor[Character["ogd"]][Character["hair"]] ~= nil then
		AddPedDecorationFromHashes(PlayerPedId(), hairDecor[Character["ogd"]][GetPedDrawableVariation(PlayerPedId(), 2)][1], hairDecor[Character["ogd"]][GetPedDrawableVariation(PlayerPedId(), 2)][2])
	else
		AddPedDecorationFromHashes(PlayerPedId(), hairDecorDefault[1], hairDecorDefault[2])
	end
	SetPedHeadOverlay(PlayerPedId(), 8,Character['lipstick_1'],Character['lipstick_2'])
	SetPedHeadOverlayColor(PlayerPedId(), 8, 1,Character['lipstick_3'],0)
	SetPedHeadOverlay(PlayerPedId(), 2,Character['eyebrows'],Character['eyebrows_2'])
	SetPedHeadOverlayColor(PlayerPedId(), 2, 1,Character['eyebrows_3'],0)
	SetPedHeadOverlay(PlayerPedId(), 3,Character['age_1'],Character['age_2'])
	SetPedHeadOverlay(PlayerPedId(), 7,Character['sun_1'],Character['sun_2'])
	SetPedHeadOverlay(PlayerPedId(), 6,Character['complexion_1'],Character['complexion_2'])
	SetPedHeadOverlay(PlayerPedId(), 9,Character['moles_1'],Character['moles_2'])
	SetPedEyeColor(PlayerPedId(), Character['eye_color'], 0, 1)
	SetPedHeadOverlay(PlayerPedId(), 4,Character['makeup_1'],Character['makeup_2'])
	SetPedHeadOverlayColor(PlayerPedId(), 4, 1,Character['makeup_3'],0)
	SetPedFaceFeature(PlayerPedId(), 19, Character['neck_thick'])
	SetPedFaceFeature(PlayerPedId(), 18, Character['chin_hole'])
	SetPedFaceFeature(PlayerPedId(), 17, Character['chin_width'])
	SetPedFaceFeature(PlayerPedId(), 16, Character['chin_length'])
	SetPedFaceFeature(PlayerPedId(), 15, Character['chin_height'])
	SetPedFaceFeature(PlayerPedId(), 14, Character['jaw_2'])
	SetPedFaceFeature(PlayerPedId(), 13, Character['jaw_1'])
	SetPedFaceFeature(PlayerPedId(), 12, Character['lips_thick'])
	SetPedFaceFeature(PlayerPedId(), 11, Character['eye_open'])
	SetPedFaceFeature(PlayerPedId(), 10, Character['cheeks_3'])
	SetPedFaceFeature(PlayerPedId(), 9, Character['cheeks_2'])
	SetPedFaceFeature(PlayerPedId(), 8, Character['cheeks_1'])
	SetPedFaceFeature(PlayerPedId(), 6, Character['eyebrows_6'])
	SetPedFaceFeature(PlayerPedId(), 7, Character['eyebrows_5'])
	SetPedFaceFeature(PlayerPedId(), 5, Character['nose_6'])
	SetPedFaceFeature(PlayerPedId(), 4, Character['nose_5'])
	SetPedFaceFeature(PlayerPedId(), 3, Character['nose_4'])
	SetPedFaceFeature(PlayerPedId(), 2, Character['nose_3'])
	SetPedFaceFeature(PlayerPedId(), 1, Character['nose_2'])
	SetPedFaceFeature(PlayerPedId(), 0, Character['nose_1'])
	if Character["gender"] == "Male" then
		for k, v in pairs(moutfits[Character["outfit"]]) do
			SetPedComponentVariation(PlayerPedId(), k, v[1], v[2], 2)
		end
		SetPedHeadOverlay(PlayerPedId(), 1,Character['beard'],Character['beard_2'])
		SetPedHeadOverlayColor(PlayerPedId(), 1, 1,	Character['beard_3'],0)
	elseif Character["gender"] == "Female" then
		for k, v in pairs(foutfits[Character["outfit"]]) do
			SetPedComponentVariation(PlayerPedId(), k, v[1], v[2], 2)
		end
		SetPedHeadOverlay(PlayerPedId(), 5,Character['blush_1'],Character['blush_2'])
		SetPedHeadOverlayColor(PlayerPedId(), 5, 2,	Character['blush_3'],0)
	end
	local glassDR
	if Character["glasses"] == 0 then
		if Character["gender"] == "Male" then
			SetPedPropIndex(PlayerPedId(), 1, 11, 0, false)
		else
			SetPedPropIndex(PlayerPedId(), 1, 5, 0, false)
		end
	else
		if Character["gender"] == "Male" then
			SetPedPropIndex(PlayerPedId(), 1, 5, 0, false)
		else
			SetPedPropIndex(PlayerPedId(), 1, 11, 0, false)
		end
	end
end
function RefreshModel()
	Citizen.CreateThread(function()
		--replaces the player's current model if it wasn't the supposed one already
		if GetEntityModel(PlayerPedId()) ~= mdhash then
			while not HasModelLoaded(mdhash) do
				RequestModel(mdhash)
				Wait(0)
			end
			SetPlayerModel(PlayerId(), mdhash)
			SetPedHeadBlendData(PlayerPedId(), Character["mom"], Character["dad"], nil, Character["mom"], Character["dad"], nil, Character["resemblance"], Character["skintone"], nil, true)
			ChangeComponents()
		end
	end)
end
RegisterNetEvent('lbg-refreshComponents')
AddEventHandler('lbg-refreshComponents', ChangeComponents)
RegisterNetEvent('lbg-refreshModel')
AddEventHandler('lbg-refreshModel', RefreshModel)

function AddMenuGender(menu)
    local genders = {
        "Male",
        "Female"
    }
	local GenderIndex = 1
	if Character["gender"] == "Female" then
		GenderIndex = 2
	end
    local genderitem = NativeUI.CreateListItem("Sex", genders, GenderIndex, "Select the gender of your Character.")
    menu:AddItem(genderitem)
    menu.OnListChange = function(sender, item, index)
        if item == genderitem then
            Character["gender"] = genders[index]
			Character["ogd"] = string.sub(genders[index], 1, 1)
			Character["lcgd"] = string.sub(genders[index], 1, 1) .. string.sub(genders[index], 2, #genders[index])
			oldmdhash = mdhash
			if genders[index] == "Male" then
				mdhash = GetHashKey("mp_m_freemode_01")
			else
				mdhash = GetHashKey("mp_f_freemode_01")
			end
			
			RequestModel(mdhash)
			Character["resemblance"] = 1.0 - Character["resemblance"]
			Character["skintone"] = 1.0 - Character["skintone"]
			RefreshModel()
        end
    end
end

function AddMenuHeritage(menu)
    local submenu = _menuPool:AddSubMenu(menu, "Heritage", "Select to choose your parents.", true, true)
    local heritage = NativeUI.CreateHeritageWindow(Character["dmom"], Character["ddad"])
	submenu:AddWindow(heritage)
	
	local moms = {"21", "22", "23", "24", "25", "26", "27", "28", "29", "30", "31", "32", "33", "34", "35", "36", "37", "38", "39", "40", "41", "45"} -- female heads
    local momitem = NativeUI.CreateListItem("Mom", fparents, Character["dmom"], "Select your Mom.")
    submenu:AddItem(momitem)
	
	local dads = {"00", "01", "02", "03", "04", "05", "06", "07", "08", "09", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20", "42", "43", "44"} -- male heads
    local daditem = NativeUI.CreateListItem("Dad", mparents, Character["ddad"] + 1, "Select your Dad.")
    submenu:AddItem(daditem)
    submenu.OnListChange = function(sender, item, index)
        if item == daditem then
            Character["ddad"] = tonumber(index - 1)
			Character["dad"] = tonumber(dads[index])
        end
		if item == momitem then
            Character["dmom"] = tonumber(index - 1)
			Character["mom"] = tonumber(moms[index])
        end
		heritage:Index(Character["dmom"], Character["ddad"])
		SetPedHeadBlendData(PlayerPedId(), Character["mom"], Character["dad"], nil, Character["mom"], Character["dad"], nil, Character["resemblance"], Character["skintone"], nil, true)
    end
	
	local ZtO = {} -- array  that counts from 0 to 1 with decimals
    for i = 1, 11 do ZtO[i] = (i - 1) / 10 end
	
	local resemblanceitem = NativeUI.CreateSliderItem("Resemblance", ZtO, Character["resemblance"], "Select if your features are influenced more by your Mother or Father.", true)
    submenu:AddItem(resemblanceitem)
	
	local skintoneitem = NativeUI.CreateSliderItem("Skin Tone", ZtO, Character["skintone"], "Select if your skin tone is influenced more by your Mother or Father.", true)
    submenu:AddItem(skintoneitem)
	
    submenu.OnSliderChange = function(sender, item, index)
        if item == resemblanceitem then
			Character["resemblance"] = ZtO[index]
			SetPedHeadBlendData(PlayerPedId(), Character["mom"], Character["dad"], nil, Character["mom"], Character["dad"], nil, Character["resemblance"], Character["skintone"], nil, true)
		end
		
		if item == skintoneitem then
			Character["skintone"] = ZtO[index]
			SetPedHeadBlendData(PlayerPedId(), Character["mom"], Character["dad"], nil, Character["mom"], Character["dad"], nil, Character["resemblance"], Character["skintone"], nil, true)
		end
    end
	
	menu.OnMenuChanged = function(parent, menu, whateverthefuck)
		if menu == submenu then
			CreateSkinCam('face')
			resemblanceitem:Index((Character["resemblance"] * 10) + 1)
			skintoneitem:Index((Character["skintone"] * 10) + 1)
		end
	end
	submenu.OnMenuClosed = function()
		CreateSkinCam('body')
	end
end

function AddMenuFaceShape(menu)
	local ListItem = {'-1.0','-0.9','-0.8','-0.7','-0.6','-0.5','-0.4','-0.3','-0.2','-0.1','0.0','0.1','0.2','0.3','0.4','0.5','0.6','0.7','0.8','0.9','1.0'}
	local submenu = _menuPool:AddSubMenu(menu, "Features", "Select to alter your facial Features.", true)
		--Nose management
		local NoseWidth =  NativeUI.CreateSliderItem("Nose Width", ListItem, 1 + Character['nose_1'] * 10 + 1, "Make changes to your physical Features.", true)
		submenu:AddItem(NoseWidth)
		NoseWidth.OnSliderChanged = function(sender, item, index)
			SetPedFaceFeature(PlayerPedId(), 0, tonumber(ListItem[index]))
			Character['nose_1'] = tonumber(ListItem[index])
		end
		local NosePeakHeight =  NativeUI.CreateSliderItem("Nose Peak Height", ListItem, 1 + Character['nose_2'] * 10 + 1, "Make changes to your physical Features.", true)
		submenu:AddItem(NosePeakHeight)
		NosePeakHeight.OnSliderChanged = function(sender, item, index)
			SetPedFaceFeature(PlayerPedId(), 1, tonumber(ListItem[index]))
			Character['nose_2'] = tonumber(ListItem[index])
		end
		local NosePeakLength =  NativeUI.CreateSliderItem("Nose Peak Length", ListItem, 1 + Character['nose_3'] * 10 + 1, "Make changes to your physical Features.", true)
		submenu:AddItem(NosePeakLength)
		NosePeakLength.OnSliderChanged = function(sender, item, index)
			SetPedFaceFeature(PlayerPedId(), 2, tonumber(ListItem[index]))
			Character['nose_3'] = tonumber(ListItem[index])
		end
		local NoseBoneHeight =  NativeUI.CreateSliderItem("Nose Bone Height", ListItem, 1 + Character['nose_4'] * 10 + 1, "Make changes to your physical Features.", true)
		submenu:AddItem(NoseBoneHeight)
		NoseBoneHeight.OnSliderChanged = function(sender, item, index)
			SetPedFaceFeature(PlayerPedId(), 3, tonumber(ListItem[index]))
			Character['nose_4'] = tonumber(ListItem[index])
		end
		local NosePeakLowering =  NativeUI.CreateSliderItem("Nose Peak Lowering", ListItem, 1 + Character['nose_5'] * 10 + 1, "Make changes to your physical Features.", true)
		submenu:AddItem(NosePeakLowering)
		NosePeakLowering.OnSliderChanged = function(sender, item, index)
			SetPedFaceFeature(PlayerPedId(), 4, tonumber(ListItem[index]))
			Character['nose_5'] = tonumber(ListItem[index])
		end
		local NoseBoneTwist =  NativeUI.CreateSliderItem("Nose Bone Twist", ListItem, 1 + Character['nose_6'] * 10 + 1, "Make changes to your physical Features.", true)
		submenu:AddItem(NoseBoneTwist)
		NoseBoneTwist.OnSliderChanged = function(sender, item, index)
			SetPedFaceFeature(PlayerPedId(), 5, tonumber(ListItem[index]))
			Character['nose_6'] = tonumber(ListItem[index])
		end

		--Eyebrows
		local EyebrowDepth =  NativeUI.CreateSliderItem("Eyebrow Depth", ListItem, 1 + Character['eyebrows_5'] * 10 + 1, "Make changes to your physical Features.", true)
		submenu:AddItem(EyebrowDepth)
		EyebrowDepth.OnSliderChanged = function(sender, item, index)
			SetPedFaceFeature(PlayerPedId(), 7, tonumber(ListItem[index]))
			Character['eyebrows_5'] = tonumber(ListItem[index])
		end
		local EyebrowHeight =  NativeUI.CreateSliderItem("Eyebrow Height", ListItem, 1 + Character['eyebrows_6'] * 10 + 1, "Make changes to your physical Features.", true)
		submenu:AddItem(EyebrowHeight)
		EyebrowHeight.OnSliderChanged = function(sender, item, index)
			SetPedFaceFeature(PlayerPedId(), 6, tonumber(ListItem[index]))
			Character['eyebrows_6'] = tonumber(ListItem[index])
		end
		
		--Cheekbones
		local CheekbonesHeight =  NativeUI.CreateSliderItem("Cheekbones Height", ListItem, 1 + Character['cheeks_1'] * 10 + 1, "Make changes to your physical Features.", true)
		submenu:AddItem(CheekbonesHeight)
		CheekbonesHeight.OnSliderChanged = function(sender, item, index)
			SetPedFaceFeature(PlayerPedId(), 8, tonumber(ListItem[index]))
			Character['cheeks_1'] = tonumber(ListItem[index])
		end
		local CheekbonesWidth =  NativeUI.CreateSliderItem("Cheekbones Width", ListItem, 1 + Character['cheeks_2'] * 10 + 1, "Make changes to your physical Features.", true)
		submenu:AddItem(CheekbonesWidth)
		CheekbonesWidth.OnSliderChanged = function(sender, item, index)
			SetPedFaceFeature(PlayerPedId(), 9, tonumber(ListItem[index]))
			Character['cheeks_2'] = tonumber(ListItem[index])
		end
		
		--Cheeks
		local CheeksWidth =  NativeUI.CreateSliderItem("Cheeks Width", ListItem, 1 + Character['cheeks_3'] * 10 + 1, "Make changes to your physical Features.", true)
		submenu:AddItem(CheeksWidth)
		CheeksWidth.OnSliderChanged = function(sender, item, index)
			SetPedFaceFeature(PlayerPedId(), 10, tonumber(ListItem[index]))
			Character['cheeks_3'] = tonumber(ListItem[index])
		end
		
		--Eyes-- Squint Wide
		local EyeOpening =  NativeUI.CreateSliderItem("Eye Opening", ListItem, 1 + Character['eye_open'] * 10 + 1, "Make changes to your physical Features.", true)
		submenu:AddItem(EyeOpening)
		EyeOpening.OnSliderChanged = function(sender, item, index)
			SetPedFaceFeature(PlayerPedId(), 11, tonumber(ListItem[index]))
			Character['eye_open'] = tonumber(ListItem[index])
		end

		--Lips
		local LipsThickness =  NativeUI.CreateSliderItem("Lips Thickness", ListItem, 1 + Character['lips_thick'] * 10 + 1, "Make changes to your physical Features.", true)
		submenu:AddItem(LipsThickness)
		LipsThickness.OnSliderChanged = function(sender, item, index)
			SetPedFaceFeature(PlayerPedId(), 12, tonumber(ListItem[index]))
			Character['lips_thick'] = tonumber(ListItem[index])
		end

		--Jaw
		local JawBoneWidth =  NativeUI.CreateSliderItem("Jaw Bone Width", ListItem, 1 + Character['jaw_1'] * 10 + 1, "Make changes to your physical Features.", true)
		submenu:AddItem(JawBoneWidth)
		JawBoneWidth.OnSliderChanged = function(sender, item, index)
			SetPedFaceFeature(PlayerPedId(), 13, tonumber(ListItem[index]))
			Character['jaw_1'] = tonumber(ListItem[index])
		end
		local JawBoneDepth =  NativeUI.CreateSliderItem("Jaw Bone Depth", ListItem, 1 + Character['jaw_2'] * 10 + 1, "Make changes to your physical Features.", true)
		submenu:AddItem(JawBoneDepth)
		JawBoneDepth.OnSliderChanged = function(sender, item, index)
			SetPedFaceFeature(PlayerPedId(), 14, tonumber(ListItem[index]))
			Character['jaw_2'] = tonumber(ListItem[index])
		end

		--Chin
		local ChinHeight =  NativeUI.CreateSliderItem("Chin Height", ListItem, 1 + Character['chin_height'] * 10 + 1, "Make changes to your physical Features.", true)
		submenu:AddItem(ChinHeight)
		ChinHeight.OnSliderChanged = function(sender, item, index)
			SetPedFaceFeature(PlayerPedId(), 15, tonumber(ListItem[index]))
			Character['chin_height'] = tonumber(ListItem[index])
		end
		local ChinDepth =  NativeUI.CreateSliderItem("Chin Depth", ListItem, 1 + Character['chin_length'] * 10 + 1, "Make changes to your physical Features.", true)
		submenu:AddItem(ChinDepth)
		ChinDepth.OnSliderChanged = function(sender, item, index)
			SetPedFaceFeature(PlayerPedId(), 16, tonumber(ListItem[index]))
			Character['chin_length'] = tonumber(ListItem[index])
		end
		local ChinWidth =  NativeUI.CreateSliderItem("Chin Width", ListItem, 1 + Character['chin_width'] * 10 + 1, "Make changes to your physical Features.", true)
		submenu:AddItem(ChinWidth)
		ChinWidth.OnSliderChanged = function(sender, item, index)
			SetPedFaceFeature(PlayerPedId(), 17, tonumber(ListItem[index]))
			Character['chin_width'] = tonumber(ListItem[index])
		end
		local ChinHoleSize =  NativeUI.CreateSliderItem("Chin Hole Size", ListItem, 1 + Character['chin_hole'] * 10 + 1, "Make changes to your physical Features.", true)
		submenu:AddItem(ChinHoleSize)
		ChinHoleSize.OnSliderChanged = function(sender, item, index)
			SetPedFaceFeature(PlayerPedId(), 18, tonumber(ListItem[index]))
			Character['chin_hole'] = tonumber(ListItem[index])
		end

		--Neck
		local NeckThickness =  NativeUI.CreateSliderItem("Neck Thickness", ListItem, 1 + Character['neck_thick'] * 10 + 1, "Make changes to your physical Features.", true)
		submenu:AddItem(NeckThickness)
		NeckThickness.OnSliderChanged = function(sender, item, index)
			SetPedFaceFeature(PlayerPedId(), 19, tonumber(ListItem[index]))
			Character['neck_thick'] = tonumber(ListItem[index])
		end

		menu.OnMenuChanged = function(parent, menu, whateverthefuck)
			if menu == submenu then
				CreateSkinCam('face')
			end
		end
		submenu.OnMenuClosed = function()
			CreateSkinCam('body')
		end
end

function AddMenuAppearance(menu)
	local submenu = _menuPool:AddSubMenu(menu, "Appearance", "Select to change your Appearance.", true)
	
	local haircuts = { "1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20", "21", "22", "23"}
	local MHairNames = {"Close Shave", "Buzzcut", "Faux Hawk", "Hipster", "Side Parting", "Shorter Cut", "Biker", "Ponytail", "Cornrows", "Slicked", "Short Brushed", "Spikey", "Caesar", "Chopped", "Dreads", "Long Hair", "Shaggy Curls", "Surfer Dude", "Short Side Part", "High Slicked Sides", "Long Slicked", "Hipster Youth", "Mullet"}
	local FHairNames = { "Close Shave", "Short", "Layered Bob", "Pigtails", "Ponytail", "Braided Mohawk", "Braids", "Bob", "Faux Hawk", "French Twist", "Long Bob", "Loose Tied", "Pixie", "Shaved Bangs", "Top Knot", "Wavy Bob", "Pin Up Girl", "Messy Bun", "Unknown", "Tight Bun", "Twisted Bob", "Big Bangs", "Braided Top Knot"}
	local hairitem = NativeUI.CreateListItem("Hair", haircuts, Character["hair"] + 1, "Make changes to your Appearance.")
	local haircolor = NativeUI.CreateColourPanel("Color", hairbrowcolors)
	hairitem:AddPanel(haircolor)
	submenu:AddItem(hairitem)
	hairitem.OnListChanged = function(ParentMenu, SelectedItem, Index)
		local ActiveItem = SelectedItem:IndexToItem(Index)
		local color = (ActiveItem.Panels and ActiveItem.Panels[1] or 1)
		Character['hair_color_1'] = color-1
		Character["hair"] = Index - 1
		SetPedComponentVariation(PlayerPedId(), 2, Index - 1, 0, 2)
		SetPedHairColor(PlayerPedId(),color-1,0)
		ClearPedDecorations(PlayerPedId())
		if hairDecor[Character["ogd"]][hairitem:Index()] ~= nil then
			local hairDecoraciones = hairDecor[Character["ogd"]]
			if hairDecoraciones[Character["hair"]] ~= nil then
				AddPedDecorationFromHashes(PlayerPedId(), hairDecoraciones[Character["hair"]][1], hairDecoraciones[Character["hair"]][2])
			else
				AddPedDecorationFromHashes(PlayerPedId(), hairDecorDefault[1], hairDecorDefault[2])
			end
		else
			AddPedDecorationFromHashes(PlayerPedId(), hairDecorDefault[1], hairDecorDefault[2])
		end
	end
	
	local eyebrows = { "Balanced", "Fashion", "Cleopatra", "Quizzical", "Femme", "Seductive", "Pinched", "Chola", "Triomphe", "Carefree", "Curvaceous", "Rodent", 
	"Double Tram", "Thin", "Penciled", "Mother Plucker", "Straight and Narrow", "Natural", "Fuzzy", "Unkempt", "Caterpillar", "Regular", "Mediterranean", "Groomed", "Bushels", 
	"Feathered", "Prickly", "Monobrow", "Winged", "Triple Tram", "Arched Tram", "Cutouts", "Fade Away", "Solo Tram" }
	local eyebrowitem = NativeUI.CreateListItem("Eyebrows", eyebrows, Character['eyebrows'] + 1, "Select to change your Appearance.")
	local browcolor = NativeUI.CreateColourPanel("Color", hairbrowcolors)
	local browpercentageitem = NativeUI.CreatePercentagePanel("0%", "Opacity", "100%")
	eyebrowitem:AddPanel(browpercentageitem)
	eyebrowitem:AddPanel(browcolor)
	submenu:AddItem(eyebrowitem)
	eyebrowitem.OnListChanged = function(ParentMenu, SelectedItem, Index)
		eyebrowitem:Index(Index)
		local ActiveItem = SelectedItem:IndexToItem(Index)
        local percentage = (ActiveItem.Panels and ActiveItem.Panels[1] or 1.0)
		local color = (ActiveItem.Panels and ActiveItem.Panels[2] or 1)
		SetPedHeadOverlay(PlayerPedId(), 2,Index-1,percentage)
		SetPedHeadOverlayColor(PlayerPedId(), 2, 1,	color-1,0)
		Character['eyebrows'] = Index-1
		Character['eyebrows_2'] = percentage
		Character['eyebrows_3'] = color-1
	end

	local beard = { "Clean Shaven", "Light Stubble", "Balbo", "Circle Beard", "Goatee", "Chin", "Chin Fuzz", "Pencil Chin Strap", "Scruffy", "Musketeer", "Mustache", 
	"Trimmed Beard", "Stubble", "Thin Circle Beard", "Horseshoe", "Pencil and Chops", "Chin Strap Beard", "Balbo and Sideburns", "Mutton Chops", "Scruffy Beard", "Curly", 
	"Curly and Deep Stranger", "Handlebar", "Faustic", "Otto and Patch", "Otto and Full Stranger", "Light Franz", "The Hampstead", "The Ambrose", "Lincoln Curtain" }
	local bearditem = NativeUI.CreateListItem("Facial Hair", beard, Character["beard"] + 2, "Make changes to your Appearance.")
	submenu:AddItem(bearditem)
	bearditem.OnListChanged = function(ParentMenu, SelectedItem, Index)
		if Character["gender"] == "Female" then
			bearditem:Index(Character["beard"] + 1)
			ShowNotification("Facial Hair unavailable for Female characters.")
		else
			if Index == 1 then
				bearditem:RemovePanelAt(1)
				bearditem:RemovePanelAt(1)
				SetPedHeadOverlay(PlayerPedId(), 1,0,0.0)
				SetPedHeadOverlayColor(PlayerPedId(), 1, 1,	0,0)
				Character['beard'] = 0
				Character['beard_2'] = 0
				Character['beard_3'] = 0
			else
				if bearditem.Panels[1] == nil then
					local beardcolor = NativeUI.CreateColourPanel("Color", hairbrowcolors)
					local beardper = NativeUI.CreatePercentagePanel("0%", "Opacity", "100%")
					bearditem:AddPanel(beardper)
					bearditem:AddPanel(beardcolor)
				end
				local ActiveItem = SelectedItem:IndexToItem(Index)
				local percentage = (ActiveItem.Panels and ActiveItem.Panels[1] or 1.0)
				local color = (ActiveItem.Panels and ActiveItem.Panels[2] or 1)
				SetPedHeadOverlay(PlayerPedId(), 1,Index - 2,percentage)
				SetPedHeadOverlayColor(PlayerPedId(), 1, 1,	color-1,0)
				Character['beard'] = Index - 2
				Character['beard_2'] = percentage
				Character['beard_3'] = color-1
			end
		end
	end

	local blemishes = { "None", "Measles", "Pimples", "Spots", "Break Out", "Blackheads", "Build Up", "Pustules", "Zits", "Full Acne", "Acne", "Cheek Rash", "Face Rash",
	"Picker", "Puberty", "Eyesore", "Chin Rash", "Two Face", "T Zone", "Greasy", "Marked", "Acne Scarring", "Full Acne Scarring", "Cold Sores", "Impetigo" }
	local blemishesitem = NativeUI.CreateListItem("Skin Blemishes", blemishes, Character['bodyb_1'] + 1, "Make changes to your Appearance.")
	submenu:AddItem(blemishesitem)
	blemishesitem.OnListChanged = function(ParentMenu, SelectedItem, Index)
		if Index == 1 then
			blemishesitem:RemovePanelAt(1)
			blemishesitem:RemovePanelAt(1)
			SetPedHeadOverlay(PlayerPedId(), 11,0,0.0)
			SetPedHeadOverlayColor(PlayerPedId(), 11, 1,	0,0)
			Character['bodyb_1'] = 0
			Character['bodyb_2'] = 0
		else
			if blemishesitem.Panels[1] == nil then
				local blemishescolor = NativeUI.CreateColourPanel("Color", hairbrowcolors)
				local blemishesper = NativeUI.CreatePercentagePanel("0%", "Opacity", "100%")
				blemishesitem:AddPanel(blemishesper)
				blemishesitem:AddPanel(blemishescolor)
			end
			local ActiveItem = SelectedItem:IndexToItem(Index)
			local percentage = (ActiveItem.Panels and ActiveItem.Panels[1] or 1.0)
			SetPedHeadOverlay(PlayerPedId(), 11,Index-1,percentage)
			Character['bodyb_1'] = Index-1
			Character['bodyb_2'] = percentage
		end
	end

	local aging = { "None", "Crow's Feet", "First Signs", "Middle Aged", "Worry Lines", "Depression", "Distinguished", "Aged", "Weathered", "Wrinkled", "Sagging", "Tough Life", 
	"Vintage", "Retired", "Junkie", "Geriatric" }
	local agingitem = NativeUI.CreateListItem("Skin Aging", aging, Character['age_1'] + 1, "Make changes to your Appearance.")
	submenu:AddItem(agingitem)
	agingitem.OnListChanged = function(ParentMenu, SelectedItem, Index)
		if Index == 1 then
			agingitem:RemovePanelAt(1)
			SetPedHeadOverlay(PlayerPedId(), 3,0,0.0)
			SetPedHeadOverlayColor(PlayerPedId(), 3, 1,	0,0)
			Character['age_1'] = 0
			Character['age_2'] = 0
		else
			if agingitem.Panels[1] == nil then
				local agingper = NativeUI.CreatePercentagePanel("0%", "Opacity", "100%")
				agingitem:AddPanel(agingper)
			end
			local ActiveItem = SelectedItem:IndexToItem(Index)
			local percentage = (ActiveItem.Panels and ActiveItem.Panels[1] or 1.0)
			SetPedHeadOverlay(PlayerPedId(), 3,Index-2,percentage)
			Character['age_1'] = Index-2
			Character['age_2'] = percentage
		end
	end

	local complexion = { "None", "Rosy Cheeks", "Stubble Rash", "Hot Flush", "Sunburn", "Bruised", "Alchoholic", "Patchy", "Totem", "Blood Vessels", "Damaged", "Pale", "Ghostly" }
	local complexitem = NativeUI.CreateListItem("Skin Complexion", complexion, Character['complexion_1'] + 1, "Make changes to your Appearance.")
	submenu:AddItem(complexitem)
	complexitem.OnListChanged = function(ParentMenu, SelectedItem, Index)
		if Index == 1 then
			complexitem:RemovePanelAt(1)
			SetPedHeadOverlay(PlayerPedId(), 9,0,0.0)
			SetPedHeadOverlayColor(PlayerPedId(), 9, 1,	0,0)
			Character['complexion_1'] = 0
			Character['complexion_2'] = 0
		else
			if complexitem.Panels[1] == nil then
				local complexper = NativeUI.CreatePercentagePanel("0%", "Opacity", "100%")
				complexitem:AddPanel(complexper)
			end
			local ActiveItem = SelectedItem:IndexToItem(Index)
			local percentage = (ActiveItem.Panels and ActiveItem.Panels[1] or 1.0)
			SetPedHeadOverlay(PlayerPedId(), 6,Index-2,percentage)
			Character['complexion_1'] = Index-2
			Character['complexion_2'] = percentage
		end
	end

	local molefreckle = { "None", "Cherub", "All Over", "Irregular", "Dot Dash", "Over the Bridge", "Baby Doll", "Pixie", "Sun Kissed", "Beauty Marks", "Line Up", "Modelesque",
	"Occasional", "Speckled", "Rain Drops", "Double Dip", "One Sided", "Pairs", "Growth" }
	local moleitem = NativeUI.CreateListItem("Moles & Freckles", molefreckle, Character['moles_1'] + 1, "Make changes to your Appearance.")
	local moleopacity = NativeUI.CreatePercentagePanel("0%", "Opacity", "100%")
	moleitem:AddPanel(moleopacity)
	submenu:AddItem(moleitem)
	moleitem.OnListChanged = function(ParentMenu, SelectedItem, Index)
		if Index == 1 then
			moleitem:RemovePanelAt(1)
			SetPedHeadOverlay(PlayerPedId(), 9,0,0.0)
			SetPedHeadOverlayColor(PlayerPedId(), 9, 1,	0,0)
			Character['moles_1'] = 0
			Character['moles_2'] = 0
		else
			if moleitem.Panels[1] == nil then
				local moleper = NativeUI.CreatePercentagePanel("0%", "Opacity", "100%")
				moleitem:AddPanel(moleper)
			end
			local ActiveItem = SelectedItem:IndexToItem(Index)
			local percentage = (ActiveItem.Panels and ActiveItem.Panels[1] or 1.0)
			SetPedHeadOverlay(PlayerPedId(), 9,Index-1,percentage)
			Character['moles_1'] = Index-1
			Character['moles_2'] = percentage
		end
	end

	local sundamage = { "None", "Uneven", "Sandpaper", "Patchy", "Rough", "Leathery", "Textured", "Coarse", "Rugged", "Creased", "Cracked", "Gritty" }
	local damageitem = NativeUI.CreateListItem("Skin Damage", sundamage, Character['sun_1'] + 1, "Make changes to your Appearance.")
	submenu:AddItem(damageitem)
	damageitem.OnListChanged = function(ParentMenu, SelectedItem, Index)
		if Index == 1 then
			damageitem:RemovePanelAt(1)
			damageitem:RemovePanelAt(1)
			SetPedHeadOverlay(PlayerPedId(), 7,0,0.0)
			SetPedHeadOverlayColor(PlayerPedId(), 7, 1,	0,0)
			Character['sun_1'] = 0
			Character['sun_2'] = 0
		else
			if damageitem.Panels[1] == nil then
				local damagecolor = NativeUI.CreateColourPanel("Color", hairbrowcolors)
				local damageper = NativeUI.CreatePercentagePanel("0%", "Opacity", "100%")
				damageitem:AddPanel(damageper)
				damageitem:AddPanel(damagecolor)
			end
			local ActiveItem = SelectedItem:IndexToItem(Index)
			local percentage = (ActiveItem.Panels and ActiveItem.Panels[1] or 1.0)
			SetPedHeadOverlay(PlayerPedId(), 7,Index-2,percentage)
			Character['sun_1'] = Index-2
			Character['sun_2'] = percentage
		end
	end

	local eyeColorNames = { "Green", "Emerald", "Light Blue", "Ocean Blue", "Light Brown", "Dark Brown", "Hazel", "Dark Gray", "Light Gray", "Pink", "Yellow", "Purple", "Blackout", 
	"Shades of Gray", "Tequila Sunrise", "Atomic", "Warp", "ECola", "Space Ranger", "Ying Yang", "Bullseye", "Lizard", "Dragon", "Extra Terrestrial", "Goat", "Smiley", "Possessed", 
	"Demon", "Infected", "Alien", "Undead", "Zombie"}
	local eyecoloritem = NativeUI.CreateListItem("Eye Color", eyeColorNames, Character['eye_color'] + 1, "Make changes to your Appearance.")
	submenu:AddItem(eyecoloritem)
	eyecoloritem.OnListChanged = function(ParentMenu, SelectedItem, Index)
		SetPedEyeColor(PlayerPedId(), Index - 1, 0, 1)
		Character['eye_color'] = Index-1
	end

	local makeup = { "None", "Smoky Black", "Bronze", "Soft Gray", "Retro Glam", "Natural Look", "Cat Eyes", "Chola", "Vamp", "Vinewood Glamour", "Bubblegum", "Aqua Dream", "Pin up", "Purple Passion", "Smoky Cat Eye", "Smoldering Ruby", "Pop Princess"}
	local makeupitem = NativeUI.CreateListItem("Makeup", makeup, Character['makeup_1'] + 1, "Make changes to your Appearance.")
	submenu:AddItem(makeupitem)
	makeupitem.OnListChanged = function(ParentMenu, SelectedItem, Index)
		if Index == 1 then
			makeupitem:RemovePanelAt(1)
			makeupitem:RemovePanelAt(1)
			SetPedHeadOverlay(PlayerPedId(), 4,0,0.0)
			SetPedHeadOverlayColor(PlayerPedId(), 4, 1,	0,0)
			Character['makeup_1'] = 0
			Character['makeup_2'] = 0
			Character['makeup_3'] = 0
		else
			if makeupitem.Panels[1] == nil then
				local makeupitemcolor = NativeUI.CreateColourPanel("Color", hairbrowcolors)
				local makeupitemper = NativeUI.CreatePercentagePanel("0%", "Opacity", "100%")
				makeupitem:AddPanel(makeupitemper)
				makeupitem:AddPanel(makeupitemcolor)
			end
			local ActiveItem = SelectedItem:IndexToItem(Index)
			local percentage = (ActiveItem.Panels and ActiveItem.Panels[1] or 1.0)
			local color = (ActiveItem.Panels and ActiveItem.Panels[2] or 1)
			SetPedHeadOverlay(PlayerPedId(), 4,Index-2,percentage)
			SetPedHeadOverlayColor(PlayerPedId(), 4, 1,	color-1,0)
			Character['makeup_1'] = Index-2
			Character['makeup_2'] = percentage
			Character['makeup_3'] = color-1
		end
	end

	local blush = { "None", "Full", "Angled", "Round", "Horizontal", "High", "Sweetheart", "Eighties" }
	local blushitem = NativeUI.CreateListItem("Blusher", blush, Character['blush_1'] + 1, "Make changes to your Appearance.")
	submenu:AddItem(blushitem)
	blushitem.OnListChanged = function(ParentMenu, SelectedItem, Index)
		if Character["gender"] == "Male" then
			blushitem:Index(Character["blush_1"] + 1)
			ShowNotification("Blusher unavailable for Male characters.")
		else
			if Index == 1 then
				blushitem:RemovePanelAt(1)
				blushitem:RemovePanelAt(1)
				SetPedHeadOverlay(PlayerPedId(), 5,0,0.0)
				SetPedHeadOverlayColor(PlayerPedId(), 5, 1,	0,0)
				Character['blush_1'] = 0
				Character['blush_2'] = 0
				Character['blush_3'] = 0
			else
				if blushitem.Panels[1] == nil then
					local blushcolor = NativeUI.CreateColourPanel("Color", hairbrowcolors)
					local blushper = NativeUI.CreatePercentagePanel("0%", "Opacity", "100%")
					blushitem:AddPanel(blushper)
					blushitem:AddPanel(blushcolor)
				end
				local ActiveItem = SelectedItem:IndexToItem(Index)
				local percentage = (ActiveItem.Panels and ActiveItem.Panels[1] or 1.0)
				local color = (ActiveItem.Panels and ActiveItem.Panels[2] or 1)
				SetPedHeadOverlay(PlayerPedId(), 5,Index-2,percentage)
				SetPedHeadOverlayColor(PlayerPedId(), 5, 2,	color-1,0)
				Character['blush_1'] = Index-2
				Character['blush_2'] = percentage
				Character['blush_3'] = color-1
			end
		end
	end
	
	local lipstick =  { "None", "Color Matte", "Color Gloss", "Lined Matte", "Lined Gloss", "Heavy Lined Matte", "Heavy Lined Gloss", "Lined Nude Matte", "Liner Nude Gloss", "Smudged", "Geisha" }
	local lipstickitem = NativeUI.CreateListItem("Lipstick", lipstick, Character['lipstick_1'] + 1, "Make changes to your Appearance.")
	submenu:AddItem(lipstickitem)
	lipstickitem.OnListChanged = function(ParentMenu, SelectedItem, Index)
		if Index == 1 then
			lipstickitem:RemovePanelAt(1)
			lipstickitem:RemovePanelAt(1)
			SetPedHeadOverlay(PlayerPedId(), 8,0,0.0)
			SetPedHeadOverlayColor(PlayerPedId(), 8, 1,	0,0)
			Character['lipstick_1'] = 0
			Character['lipstick_2'] = 0
			Character['lipstick_3'] = 0
		else
			if lipstickitem.Panels[1] == nil then
				local lipstickcolor = NativeUI.CreateColourPanel("Color", hairbrowcolors)
				local lipstickper = NativeUI.CreatePercentagePanel("0%", "Opacity", "100%")
				lipstickitem:AddPanel(lipstickper)
				lipstickitem:AddPanel(lipstickcolor)
			end
			local ActiveItem = SelectedItem:IndexToItem(Index)
			local percentage = (ActiveItem.Panels and ActiveItem.Panels[1] or 1.0)
			local color = (ActiveItem.Panels and ActiveItem.Panels[2] or 1)
			SetPedHeadOverlay(PlayerPedId(), 8,Index-2,percentage)
			SetPedHeadOverlayColor(PlayerPedId(), 8, 1,	color-1,0)
			Character['lipstick_1'] = Index-2
			Character['lipstick_2'] = percentage
			Character['lipstick_3'] = color-1
		end
	end
	
	menu.OnMenuChanged = function(parent, menu, whateverthefuck)
		if menu == submenu then
			CreateSkinCam('face')
		end

		if Character["gender"] == "Male" then
			hairitem.Items = MHairNames
		elseif Character["gender"] == "Female" then
			hairitem.Items = FHairNames
		else
			hairitem.Items = haircuts
		end
	end
	submenu.OnMenuClosed = function()
		CreateSkinCam('body')
	end
end

function AddMenuApparel(menu)
	local submenu = _menuPool:AddSubMenu(menu, "Apparel", "Select to change your Apparel.", true, true)

	local outfits = {
		"Racing Default",
		"Biker Apparel",
		"Freemode Classic",
		"Double Agent",
		"lambdaguy101"
	}

	local glassus = {
		"No",
		"Yes"
	}
	local glassFDRs = {
		"5",
		"11"
	}
	local glassMDRs = {
		"11",
		"5"
	}

	local outfititem = NativeUI.CreateListItem("Outfit", outfits, Character["outfit"], "Make changes to your Apparel.")
	submenu:AddItem(outfititem)

	local glassesitem = NativeUI.CreateListItem("Aviators", glassus, Character["glasses"] + 1, "Make changes to your Apparel.")
	submenu:AddItem(glassesitem)
	
	submenu.OnListChange = function(sender, item, index)
		if item == outfititem then
			Character["outfit"] = index
			ChangeComponents(false)
		end
		if item == glassesitem then
			Character["glasses"] = index - 1
			if Character["gender"] == "Male" then
				SetPedPropIndex(PlayerPedId(), 1, tonumber(glassMDRs[index]), 0, true)
			else
				SetPedPropIndex(PlayerPedId(), 1, tonumber(glassFDRs[index]), 0, true)
			end
		end
	end
end

function AddButtonFinish(menu)
	local finishButton = _menuPool:AddSubMenu(menu, "Save & Continue", "Ready to play GTA Online?", true)
	local sureButton = NativeUI.CreateItem("Are you sure?", "Press Enter to continue")
	finishButton:AddItem(sureButton)
	sureButton.Activated = function(menu, item, _)
		EndCharCreator()
		finishButton:Visible(false)
		menu:Visible(false)
	end
end

_menuPool = NativeUI.CreatePool()
mainMenu = NativeUI.CreateMenu("Character Creator", "~HUD_COLOUR_FREEMODE~EDIT CHARACTER", 47.5, 47.5)
_menuPool:Add(mainMenu)

AddMenuGender(mainMenu)
AddMenuHeritage(mainMenu)
AddMenuFaceShape(mainMenu)
AddMenuAppearance(mainMenu)
AddMenuApparel(mainMenu)
AddButtonFinish(mainMenu)
_menuPool:RefreshIndex()

local enable = false

local Camera = {
	face = {x = 402.74, y = -1000.72, z = -98.45, fov = 10.00},
	body = {x = 402.92, y = -1000.72, z = -99.01, fov = 30.00},
}

cam, cam2, cam3, camSkin, isCameraActive = nil, nil, nil, nil, nil
lastCam = 'body'

function Collision()
    for i=1,256 do
        if NetworkIsPlayerActive(i) then
            SetEntityVisible(GetPlayerPed(i), false, false)
            SetEntityVisible(PlayerPedId(), true, true)
            SetEntityNoCollisionEntity(GetPlayerPed(i), PlayerPedId(), false)
        end
    end
end

function Visible()
    while enable == true do
        Citizen.Wait(0)
        --DisableAllControlActions(0)
        Collision()
    end
end

function CharCreatorAnimation()
	enable = true
	DisplayRadar(false)
	AnimCam()
	Visible()
end

local camSkin

function CreateSkinCam(camera)
	if camSkin then
		local newCam = CreateCamWithParams("DEFAULT_SCRIPTED_CAMERA", Camera[camera].x, Camera[camera].y, Camera[camera].z, 0.00, 0.00, 0.00, Camera[camera].fov, false, 0)
		PointCamAtCoord(newCam, Camera[camera].x, Camera[camera].y, Camera[camera].z)
   		SetCamActiveWithInterp(newCam, camSkin, 250, true, true)
   		camSkin = newCam
	else
		camSkin = CreateCamWithParams("DEFAULT_SCRIPTED_CAMERA", Camera[camera].x, Camera[camera].y, Camera[camera].z, 0.00, 0.00, 0.00, Camera[camera].fov, false, 0)
	    SetCamActive(cam2, true)
	    RenderScriptCams(true, false, 2000, true, true) 
	end
end

local initpos = nil

function AnimCam()
	local playerPed = PlayerPedId()
    DoScreenFadeOut(1000)
    Citizen.Wait(4000)
    DestroyAllCams(true)
	initpos = GetEntityCoords(PlayerPedId())
	RefreshModel()
    ChangeComponents(true)
	cam2 = CreateCamWithParams("DEFAULT_SCRIPTED_CAMERA", Camera['body'].x, Camera['body'].y, Camera['body'].z, 0.00, 0.00, 0.00, Camera['body'].fov, false, 0)
    SetCamActive(cam2, true)
    RenderScriptCams(true, false, 2000, true, true) 
    Citizen.Wait(500)
    DoScreenFadeIn(2000)
    SetEntityCoords(PlayerPedId(), 405.59, -997.18, -99.00, 0.0, 0.0, 0.0, true)
    SetEntityHeading(PlayerPedId(), 90.00)
    -- TriggerEvent('skinchanger:loadSkin', {sex = 0})
    Citizen.Wait(500)
    cam3 = CreateCamWithParams("DEFAULT_SCRIPTED_CAMERA", 402.99, -998.02, -99.00, 0.00, 0.00, 0.00, 50.00, false, 0)
    PointCamAtCoord(cam3, 402.99, -998.02, -99.00)
    SetCamActiveWithInterp(cam2, cam3, 5000, true, true)
    LoadAnim("mp_character_creation@customise@male_a")
    TaskPlayAnim(PlayerPedId(), "mp_character_creation@customise@male_a", "intro", 1.0, 1.0, 4050, 0, 1, 0, 0, 0)
	Citizen.Wait(5500)
	loopanim = true
    local coords = GetEntityCoords(PlayerPedId())
    if GetDistanceBetweenCoords(coords, 402.89, -996.87, -99.0, true) > 0.5 then
    	SetEntityCoords(PlayerPedId(), 402.89, -996.87, -99.0, 0.0, 0.0, 0.0, true)
    	SetEntityHeading(PlayerPedId(), 173.97)
    end
    Citizen.Wait(100)
	mainMenu:Visible(true)
    Citizen.Wait(1000)
    FreezeEntityPosition(PlayerPedId(), true)
end

function EndCharCreator()
	mainMenu:Visible(false)
	FreezeEntityPosition(PlayerPedId(), false)
	if Character["gender"] == "Male" then
		LoadAnim("mp_character_creation@lineup@male_b")
		TaskPlayAnim(PlayerPedId(), "mp_character_creation@lineup@male_b", "outro", 0.225, 1.0, 6000, 0, 1, 0, 0, 0)
	elseif Character["gender"] == "Female" then
		LoadAnim("mp_character_creation@lineup@female_a")
		TaskPlayAnim(PlayerPedId(), "mp_character_creation@lineup@female_a", "outro", 0.225, 1.0, 6000, 0, 1, 0, 0, 0)
	end
	Citizen.Wait(4275)
	local playerPed = PlayerPedId()
	DoScreenFadeOut(1000)
	Wait(1000)
	SetEntityCoords(playerPed, initpos.x, initpos.y, initpos.z, true, false, false, true)
	SetCamActive(camSkin,  false)
	RenderScriptCams(false,  false,  0,  true,  true)
	enable = false
	DisplayRadar(true)
	Wait(1000)
	ChangeComponents(false)
	DoScreenFadeOut(10)
	Wait(1000)
	SetCamActive(camSkin,  false)
	RenderScriptCams(false,  false,  0,  true,  true)
	enable = false
	EnableAllControlActions(0)
    FreezeEntityPosition(PlayerPedId(), false)
	Wait(1000)
	SetResourceKvp('lbg-char-info', json.encode(Character))
	TriggerServerEvent('lbg-chardone', Character)
	DisplayRadar(true)
	DoScreenFadeIn(1000)
	Wait(1000)
end

function LoadAnim(dict)
  while not HasAnimDictLoaded(dict) do
    RequestAnimDict(dict)
    Wait(10)
  end
end

local oldchar = Character

mainMenu.OnMenuClosed = function(Menu)
	--[[if Character ~= oldchar then
		if user.getMoney() < changecost then
			ShowNotification("Insufficient cash for character change!")
		else
			user.removeMoney(changecost)
			ShowNotification("Your character has been saved.")
		end
	else
		ShowNotification("No money has been taken because no changes were made.")
	end]]
	EndCharCreator()
end

Citizen.CreateThread(function()
    while true do
		Citizen.Wait(0)
		_menuPool:ProcessMenus()
    end
end)

RegisterNetEvent('lbg-openChar')
AddEventHandler('lbg-openChar', function()
	CharCreatorAnimation()
end)

RegisterCommand("charedit", function()
    TriggerEvent('lbg-openChar')
end, false)
