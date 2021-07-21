Config = {}

Config.objects = {
	object = nil, ObjectVertX = nil, ObjectVertY = nil, ObjectVertZ = nil, OjbectDir = nil, isBed = nil,
	SitAnimation = 'PROP_HUMAN_SEAT_CHAIR_MP_PLAYER',
	LayBackAnimation = 'WORLD_HUMAN_SUNBATHE_BACK',
	LayStomachAnimation = 'WORLD_HUMAN_SUNBATHE',
	locations = {
		[1] = {object="v_med_bed2", verticalOffsetX=0.0, verticalOffsetY=0.0, verticalOffsetZ=-1.4, direction=0.0, bed=true},
		[2] = {object="v_serv_ct_chair02", verticalOffsetX=0.0, verticalOffsetY=0.0, verticalOffsetZ=-0.0, direction=168.0, bed=false},
		[3] = {object="prop_off_chair_04", verticalOffsetX=0.0, verticalOffsetY=0.0, verticalOffsetZ=-0.4, direction=168.0, bed=false},
		[4] = {object="prop_off_chair_03", verticalOffsetX=0.0, verticalOffsetY=0.0, verticalOffsetZ=-0.4, direction=168.0, bed=false},
		[5] = {object="prop_off_chair_05", verticalOffsetX=0.0, verticalOffsetY=0.0, verticalOffsetZ=-0.4, direction=168.0, bed=false},
		[6] = {object="v_club_officechair", verticalOffsetX=0.0, verticalOffsetY=0.0, verticalOffsetZ=-0.4, direction=168.0, bed=false},
		[7] = {object="v_ilev_leath_chr", verticalOffsetX=0.0, verticalOffsetY=0.0, verticalOffsetZ=-0.4, direction=168.0, bed=false},
		[8] = {object="v_corp_offchair", verticalOffsetX=0.0, verticalOffsetY=0.0, verticalOffsetZ=-0.4, direction=168.0, bed=false},
		[9] = {object="v_med_emptybed", verticalOffsetX=0.0, verticalOffsetY=0.13, verticalOffsetZ=-0.2, direction=90.0, bed=false},
		[10] = {object="Prop_Off_Chair_01", verticalOffsetX=0.0, verticalOffsetY=-0.1, verticalOffsetZ=-0.5, direction=180.0, bed=false},
		[11] = {object="prop_stool_01", verticalOffsetX=0.0, verticalOffsetY=0.0, verticalOffsetZ=-0.8, direction=168.0, bed=false},
		[12] = {object="prop_bar_stool_01", verticalOffsetX=0.0, verticalOffsetY=0.0, verticalOffsetZ=-0.8, direction=168.0, bed=false},
		[13] = {object="gabz_pillbox_diagnostics_bed_01", verticalOffsetX=0.0, verticalOffsetY=0.0, verticalOffsetZ=-1.9, direction=0.0, bed=true},
		[14] = {object="gabz_pillbox_diagnostics_bed_02", verticalOffsetX=0.0, verticalOffsetY=0.0, verticalOffsetZ=-1.9, direction=0.0, bed=true},
		[15] = {object="gabz_pillbox_diagnostics_bed_03", verticalOffsetX=0.0, verticalOffsetY=0.0, verticalOffsetZ=-1.9, direction=0.0, bed=true},
		[16] = {object="imp_Prop_ImpExp_OffChair_01a", verticalOffsetX=0.0, verticalOffsetY=0.0, verticalOffsetZ=0.1, direction=168.0, bed=false},

		-- Vinice a Steakhouse
		[17] = {object="v_res_m_l_chair1", verticalOffsetX=0.0, verticalOffsetY=0.0, verticalOffsetZ=-0.5, direction=180.0, bed=false},

		-- GALDIN
		-- barovky
		[18] = {
			object="ba_prop_int_glam_stool", verticalOffsetX=0.0, verticalOffsetY=0.0, verticalOffsetZ=-0.8, direction=0.0, bed=false,
			customDirections = {
				[vector3(-2243.709, -626.3775, 13.81565)] = {direction = 21.0},
				[vector3(-2244.93, -626.7439, 13.81565)] = {direction = 6.64},
				[vector3(-2246.367, -626.5614, 13.81565)] = {direction = 342.53},
				[vector3(-2247.372, -626.073, 13.81565)] = {direction = 321.68},
				[vector3(-2248.087, -625.1548, 13.81565)] = {direction = 310.26},

				[vector3(-2248.102, -621.6926, 13.81565)] = {direction = 233.56},
				[vector3(-2247.226, -620.6118, 13.81565)] = {direction = 215.95},
				[vector3(-2246.043, -620.0879, 13.81565)] = {direction = 193.87},
				[vector3(-2244.673, -620.0547, 13.81565)] = {direction = 175.94},
				[vector3(-2243.072, -620.5963, 13.81565)] = {direction = 140.83},
			},
		},
		-- cerveny zidle
		[19] = {object="prop_chateau_chair_01", verticalOffsetX=0.0, verticalOffsetY=0.0, verticalOffsetZ=0.1, direction=180.0, bed=false},
		-- nizke cervene kavove
		[20] = {object="hei_heist_din_chair_02", verticalOffsetX=0.0, verticalOffsetY=0.0, verticalOffsetZ=-0.5, direction=180.0, bed=false},
		-- bily kresla u sefa
		[21] = {object="v_res_m_armchair", verticalOffsetX=0.0, verticalOffsetY=0.0, verticalOffsetZ=-0.5, direction=180.0, bed=false},
		-- lehatka
		[22] = {object="prop_patio_lounger1", verticalOffsetX=0.0, verticalOffsetY=0.0, verticalOffsetZ=-1.4, direction=0.0, bed=true},
		-- cerne kreslo v satne
		[23] = {object="apa_mp_h_stn_chairarm_12", verticalOffsetX=0.0, verticalOffsetY=0.0, verticalOffsetZ=-0.5, direction=180.0, bed=false},
		-- bile zidle vepredu
		[24] = {object="prop_chair_04b", verticalOffsetX=0.0, verticalOffsetY=0.0, verticalOffsetZ=-0.5, direction=180.0, bed=false},

		[25] = {object="prop_table_04_chr", verticalOffsetX=0.0, verticalOffsetY=0.0, verticalOffsetZ=-0.5, direction=180.0, bed=false},
		[26] = {object="prop_table_01_chr_a", verticalOffsetX=0.0, verticalOffsetY=0.0, verticalOffsetZ=0.0, direction=180.0, bed=false},
		[27] = {object="prop_table_06_chr", verticalOffsetX=0.0, verticalOffsetY=0.0, verticalOffsetZ=-0.5, direction=180.0, bed=false},
		[28] = {object="prop_armchair_01", verticalOffsetX=0.0, verticalOffsetY=0.0, verticalOffsetZ=-0.5, direction=180.0, bed=false},
		[29] = {object="v_res_m_dinechair", verticalOffsetX=0.0, verticalOffsetY=0.0, verticalOffsetZ=-0.5, direction=180.0, bed=false},
		[30] = {object="v_ret_chair", verticalOffsetX=0.0, verticalOffsetY=0.0, verticalOffsetZ=-0.5, direction=180.0, bed=false},
	
		-- STEAKHOUSE
		[31] = {object="prop_chair_09", verticalOffsetX=0.0, verticalOffsetY=0.0, verticalOffsetZ=-0.5, direction=180.0, bed=false},

		-- REHAB
		[32] = {object="prop_table_05_chr", verticalOffsetX=0.0, verticalOffsetY=0.0, verticalOffsetZ=-0.5, direction=180.0, bed=false},

		-- PD
		[32] = {object="prop_sol_chair", verticalOffsetX=0.0, verticalOffsetY=0.0, verticalOffsetZ=-0.5, direction=180.0, bed=false},
	}
}