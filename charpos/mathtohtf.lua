local t = {}
local max = math.max
local min = math.min

local add_char = function(font, uni, char, name)
  local f = t[font] or {}
  local char = tonumber(char)
  f.max = max(f.max or char, char)
  f.min = min(f.min or char, char)
  local ishex = uni:match("^[0-9A-Fa-f]+$") 
  f[char] = {code = ishex, name = name} 
  t[font] = f
end
for line in io.lines() do
  local uni, font, char, name = line:match("([^%s]+)%s+([^%s]+)%s+([^%\\]+)\\%%(.+)")
  add_char(font, uni, char, name)
end

for font, chars in pairs(t) do
  local min = chars.min
  local max = chars.max
  print(font, min, max)
  for i=min,max do
    local t = chars[i] or {}
    print(i, t.name, t.code)
  end
end
