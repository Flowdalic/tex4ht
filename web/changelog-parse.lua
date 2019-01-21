-- convert changelog to HTML

local function find_header(buffer, position)
  local start, stop, date, author, email = buffer:find("(%d+%-%d+%-%d+)%s+(.-)%<([^%>]+)%>", position)
  return start, stop + 1, date, author, email
end

local function parse_entry(buffer, position)
  local _, pos, date, author, email = find_header(buffer, position)
  local entry = {date = date, author = author, email = email}
  -- find text between two headers
  local next_header = find_header(buffer, pos)
  entry.text = buffer:sub(pos, next_header - 1)
  return entry, pos + 1
end

local escapes = {["<"] = "&lt;", [">"] = "&gt;", ["&"] = "&amp;"}

local function print_entry(entry)
  -- print just the date and the entry text
  print("<tr>")
  print("<td>".. entry.date .. "</td>")
  local end_par = ""
  local escaped = entry.text:gsub("([%<%>%&])", function(a)
    return escapes[a]
  end)
  local text = escaped--:gsub("^%s*", "") -- remove space at the beginning
  :gsub("\n%s*%*%s+", function(star) -- replace "*" characters with paragraphs in the changelog entry
    local replace = end_par .. "<p>"
    end_par = "\n</p>\n"
    return replace
  end)
  :gsub("%s*$", "") -- remove space at the end
  .. "\n</p>" -- we need to close the paragraph explicitly
  -- text = text:gsub("<p>(.-):", "<p><em>%1</em>:")
  -- escape links
  text = text:gsub("(http[^%s]+)", "<br><a href='%1'>%1</a>")
  -- escape file names
  text = text:gsub("<p>(.-):", function(a)
    local texfile, generated = a:match("(.-tex)(%s+.+)")
    texfile = string.format("<a href='http://svn.gnu.org.ua/viewvc/tex4ht/trunk/lit/%s'>%s</a>", texfile, texfile)
    return "<p><em>" .. texfile .. generated .. "</em>"
  end)
  print("<td>")
  print(text)
  print("</td>\n</tr>")
end

-- read the standard input
local buffer = io.read("*all")

-- initialize variables
local pos = 0
local entry, entries = nil, {}
local news_entries = 5 -- number of printed changelog entries


-- parse changelog
for _=1,news_entries do
  entry, pos = parse_entry(buffer, pos)
  entries[#entries+1] = entry
end

-- it is not really clean to just print it, but I don't feel a necessity to use
-- templates yet
print("<table class='changelog'>")
-- print parsed entries
for _, entry in ipairs(entries) do
  print_entry(entry)
end
print("</table>")
