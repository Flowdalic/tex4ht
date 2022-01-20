
install-unicode-4hf:
	cd $(ht_fonts_devdir) && tar cf - `find . -name unicode.4hf` \
	| (cd $(ht_fonts_instdir) && tar xf -)
	svn diff $(ht_fonts_instdir)
#
# copy fonts listed in /tmp/htf (must be filenames relative to
# ht_fonts_devdir, like those created by diff-htfonts below)
# to ht_fonts_instdir.  Or to use /tmp/htnew instead of /tmp/htf, override:
tmp_htf = /tmp/htf
install-htfonts-tmp:
	cd $(ht_fonts_devdir) && tar cfT - $(tmp_htf) \
	| (cd $(ht_fonts_instdir) && tar xvf -)
	svn status $(ht_fonts_instdir)

xdiff-htfonts:
# put the raw diff in /tmp/htd:
	-$(diff) -r $(ht_fonts_instdir) $(ht_fonts_devdir) >/tmp/htdif
# just the changed filenames in /tmp/htf; but this includes date changes,
#   so will have lots of false matches. must fixx ...
# also we don't ever remove $(ht_fonts_instdir), so old stuff stays
#   around; must fixx again.
	sed -n 's,^diff.*ht-fonts/,,p' /tmp/htd | sort >/tmp/htf
# and new filenames in /tmp/htnew:
	sed -n -e 's,^Only in.*ht-fonts/,,' \
	       -e 's,: ,/,p' /tmp/htd >/tmp/htnew
# for human consumption, remove generation lines (hopefully there are no
# real diffs on those lines); also the @@ lines from diff -u and the
# redundant diff invocations.
	egrep -v '^(diff |@@ |[-+][^-+].*20[0-9][0-9]-[0-9][0-9]-[0-9][0-9])' \
	/tmp/htd | tee /tmp/htchanges

