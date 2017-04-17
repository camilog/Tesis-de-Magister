gnuplot -persist <<-EOFMarker
	set datafile separator ";"

	set title "Worst Case Bandwidth"
	
	set xlabel "Number of Messages"
	set ylabel "Bandwidth [bytes/seconds]"
	
	set key at 28,140
	set key box
	set key width 2
	set xrange[1:30]
	set yrange[0:150]

	f(x) = a1/(x**2)
	fit f(x) 'averages_all.csv' u (\$1):(\$26) via a1

	g(x) = a2/x
	fit g(x) 'averages_partial_30.csv' u (\$1):(\$26) via a2
	
	# f(x) = a1*x**2 + b1*x + c1
	# fit f(x) 'averages.csv' u (\$1):(\$2) via a1, b1, c1
	# 
	# g(x) = a2*x**2 + b2*x + c2
	# fit g(x) 'averages.csv' u (\$1):(\$3) via a2, b2, c2
	# 	
	# h(x) = a3*x**2 + b3*x + c3
	# fit h(x) 'averages.csv' u (\$1):(\$4) via a3, b3, c3
	
	# plot 'averages.csv' u (\$1):(\$2) title 'Total Time', 'averages.csv' u (\$1):(\$3) title 'First Message', 'averages.csv' u (\$1):(\$4) title 'Average Round Time', f(x) notitle, g(x) notitle, h(x) notitle
	plot 'averages_all.csv' u (\$1):(\$26) title 'All Room Sending', 'averages_partial_30.csv' u (\$1):(\$26) title 'Some Participants Sending (Room of 30)', f(x) notitle, g(x) notitle
EOFMarker
