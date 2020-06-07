-- this script parses log files for errors
-- pass the .log file as a first argument
-- 
-- Usage:
-- texlua checklog.lua <filename>.log
--
-- 
kpse.set_program_name "luatex"
-- the following library is part of make4ht
local error_logparser = require("make4ht-errorlogparser")

local function parse_log(content)
  -- log parsing can be expensive on time, don't do it if we don't have
  -- any error message in the log file
  if content:match("\n!") then
    local errors = error_logparser.parse(content)
    if #errors > 0 then
      print("Checking " .. input_file)
      print("Errors found:")
      for _, err in ipairs(errors) do
        print(err.filename or "?", err.line or "?", err.error)
      end
      os.exit(1)
    end
  end
end

local content 
-- the log file can be passed as filename argument, or piped from shell

if #arg > 0 then
  for _, input_file in ipairs(arg) do
    local ext = input_file:match("%.([^%.]+)$")
    if not ext then
      input_file = input_file .. ".log"
    elseif ext ~="log" then
      input_file = input_file:gsub("[^%.]+$", "log")
    end
    local f = io.open(input_file, "r")
    content = f:read("*all")
    f:close()
    parse_log(content)
  end
else
  -- read from STDIN
  content = io.read("*all")
  parse_log(content)
end

