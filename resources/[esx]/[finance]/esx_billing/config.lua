Config = {}
Config.Locale = 'cs'

Config.Hooks = {
	society_ambulance = 'https://discordapp.com/api/webhooks/702484851550584872/tPzou0RarMB5VMtWg4ZGdvuNPCniz5IufByEyJ8bHGQFc8TVoaPXhOHAqf2BkupcBzsY',
	society_police = 'https://discordapp.com/api/webhooks/702486729978019921/9-edIn-n0HWQmpRQOp3ROwH7mHgDgm_ZDPDmRMpe-kjyDBf-p1mGWJTZIHIAIot2CjnH',
	society_mechanic = 'https://discordapp.com/api/webhooks/735800779834785885/OvVMJrgProM_9bBLB1NXLmpP2o5iYUIfvj2K0einLJnV0pEgh3b0d4CSteDVOA7sznvG',
	society_mecano = 'https://discordapp.com/api/webhooks/702487383714693210/Pfdo4uHrfsSG0peiNTPOerFtmBxlc_CyRxDrZnIuR_gAmQWH7S_9kTwdhUzqae-H1XkA',
	society_state = 'https://discordapp.com/api/webhooks/702541217774305366/9Z4mdaa7SUgfULG2WMK2gsuWXHHfBm3Ho10D12uaKKeHln-6DqTk1hoXmqUpT_lqYB6T',
	society_galdin = 'https://discordapp.com/api/webhooks/702547728919691374/8TYjRSLS0eU-DcSW1OhihoCHE4mphx3OnGetJ4RaZH7vc-qcEq4oIean8DtILZhhxOwX',
	society_ammu = 'https://discordapp.com/api/webhooks/704646197582757909/EfahUwdzZiP7k_m9CqpODySbrWLwnlSkht8m8uuHWs22nA_aNYop0PSoOKUnSsR_7AFW',
	society_vigne = 'https://discordapp.com/api/webhooks/706830620071821313/pss_Xvlvg7Y3-7LF0eVwG_SKsmIrqP8yYzYqu2h7bNaXIA78nQHYxQVRLEsFFN6_W0rX',
	society_cosanostra = 'https://discordapp.com/api/webhooks/737900179059114014/wgX3I1QrVHabFhHOgWJQNTSBa5k91tbSggIVH1HNXT3kwNhvk2eR3rYXW4iHg7QTiS0t',
	society_cozinheiro = 'https://discordapp.com/api/webhooks/710867713983119461/EtdTqLhtp2rgo0B0dIpPZvuBjkg1__5QcVupJRJR5UvCT8_OEW_MOmnNNYr3wh3ZSmHj',
	society_gang = 'https://discordapp.com/api/webhooks/715495624711077978/EGNwYbcUk-BGoNl_84t9O4FMHQHklG_SZV-gyx8iT3ImoOPuFy0Q8dDg4-bNzbIymUlh',
	society_farma = 'https://discordapp.com/api/webhooks/720618122947854437/0aXE-el2KqunLZDccSzAILxvW4KZBNG1BhPr9HUir1ai6e2pSugzUhaJ5rp_qnW_56WI',
	society_lifeinvader = 'https://discordapp.com/api/webhooks/721328176067903619/5NxIh3rYSzjGUQVul2h7tWbd5_4yyU2vnuFXsssz9RadaCGaz-MzWeITxCvknL1jlv5H',
	society_bazar = 'https://discordapp.com/api/webhooks/721700757736521819/3U1SayUV1O5bcwTqz8LCbaaSHsb2Lawui73Ojf7b8jhXm7M0XE0ylVzy7o7TE4SLdQ3t',
	society_lost = 'https://discordapp.com/api/webhooks/724351106574057562/Py2SE-QJuE45ziAvt2vUJIOYA3J4jHpReEmo-cKebp9slJr5ROE6k41lldZeKAAMCG71',
	society_pivovar = 'https://discordapp.com/api/webhooks/727106343319633950/xmBWi1fMqCnVbOp1l5zYZcwMOjdFwNHYUnFrN6seYtvwPyePleCFLmDnVOolhV_WWE2O',
	society_casino = 'https://discordapp.com/api/webhooks/730073011184730162/LoBdOe6mcYpLnDYC5hm3pW50IDhEjEn-65hOPSBZG6gWZJOnLHQ8n2l-DSHrFir5gbKX',
	society_wcorp = 'https://discordapp.com/api/webhooks/731067984075948062/K89-zwQbrnMGiAZJSXKcZ24FpUO5Z6ihOs-d_E8sly6KE5OyNzqI6Q-wYl3Uu_fiAWMm',
	society_benefactor = 'https://discordapp.com/api/webhooks/730073011184730162/LoBdOe6mcYpLnDYC5hm3pW50IDhEjEn-65hOPSBZG6gWZJOnLHQ8n2l-DSHrFir5gbKX',
	society_unicorn = 'https://discordapp.com/api/webhooks/737738846648664087/t4Z3EV7TLESzk7DLll7GF843bhuYFPhCjRuT3YWqr92D5JZbWQUWpDgmdOQHDJUIHNOJ',
	society_coffee = 'https://discordapp.com/api/webhooks/737757051425521766/_rmAW4xqa_U6hwdXSh-HLrP8VHvGeIATOyt5EU_N_Y2ftSdThdhxrc-1oqDuulLPFV84',
	society_easyway = 'https://discordapp.com/api/webhooks/737928763962294302/cVwr11n3j0Nuv55EofyXQea5e62MghMNHc2DD7NHjSBcn8vnv4gJ2uFw6iLSlZvcE8XE',
	society_kostel = 'https://discordapp.com/api/webhooks/739034070339813437/ZbdpuXoYcTdMhsPXm6p56mEI4erqgvJt9c9-qzv5SlZTovQgzrUsRRe49_uM20igxYO4',
}