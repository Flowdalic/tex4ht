# mn web pages

tex = tex -interaction=nonstopmode -file-line-error
x:
#	chmod -R a+rwX .  # as received from OSU
	rm -f *.aux *.toc *.lof *.lot *.xref* *.tmp *.out *.4ct
	$(tex) mn && $(tex) mn && $(tex) mn
	tex4ht mn
	t4ht mn           # cvr found some mk4ht.4ht needed at one point
	rm -f *.zip       # we don't care
