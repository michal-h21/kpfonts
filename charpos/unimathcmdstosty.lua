for line in io.lines() do
  local cmd, uni = line:match("textbackslash{}([^%s]+)%s*%&%s*([0-9a-fA-F]+)")
  if cmd then
    print(string.format('\\def\\%s{%s}', cmd, uni))
  end
end
