local URL = 'https://discordapp.com/api/webhooks/718372577281835048/Qxqa7ciP8tYTVtmDJRf8zb5_SXwljSYjzATCQHH8f2MlJL9vDtgiNLYNpTq0SjNCv_W_'

function discordLog()
	local msg = 'SERVER UP! <3'
	PerformHttpRequest(URL, function(a,b,c)end, "POST", json.encode({content = msg}), {["Content-Type"]="application/json"})
end

SetTimeout(5000, discordLog)