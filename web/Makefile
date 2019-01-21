all: changes.html changelog.html
# Create html file for inclusion from the ChangeLog
changes.html: ../lit/ChangeLog
	texlua changelog-parse.lua < $< > $@

# Larger changelog
changelog.html: ../lit/ChangeLog 
	texlua changelog-parse.lua 300 < $< > $@
