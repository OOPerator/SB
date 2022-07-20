x = Instance.new("Model")
x.Name = "Canvas"
x.Parent = game.Workspace
data = game:GetService("HttpService"):JSONDecode(data)
size = data["config"]["sizePerPart"]
for i,v in pairs(data.data) do
	spawn(function()
		local px = Instance.new("MeshPart")
                px.Parent = x
                px.Transparency = 1
		px.Name = tostring(v["x"]).."-"..tostring(v["y"])
		px.Anchored = true
		px.CanCollide = false
		px.CastShadow = false
                px.TopSurface = "Smooth"
		px.Color = Color3.fromRGB(v["color"][1],v["color"][2],v["color"][3])
		px.Position = Vector3.new(0,1,0) + Vector3.new(v["x"]/size,0,v["y"]/size)
		px.Size = Vector3.new(size,1,size)
                px.Material = "Brick"
	end)
end
x.PrimaryPart = x:WaitForChild("0-0")