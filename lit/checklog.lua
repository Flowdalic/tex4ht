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

local input_file = arg[1]

local f = io.open(input_file, "r")
local content = f:read("*all")
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

