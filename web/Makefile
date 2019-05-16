all: changes.html changelog-include.html

# Create html file for inclusion from the ChangeLog
changes.html: ../lit/ChangeLog
	texlua changelog-parse.lua < $< > $@ || rm -f $@

# Larger changelog
changelog-include.html: ../lit/ChangeLog 
	texlua changelog-parse.lua 300 < $< > $@ || rm -f $@
