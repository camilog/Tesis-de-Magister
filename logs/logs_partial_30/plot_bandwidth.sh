gnuplot -persist <<-EOFMarker
	set datafile separator ";"

	set title "Bandwidth usage with some participants sending (room of 30)"
	
	set xlabel "Number of participants in room"
	set ylabel "Bandwidth [bytes/seconds]"
	
	set key at 18,90000
	set key box
	set key width 2
	set xrange[1:30]
	set yrange[500:110000]
	
	f(x) = a1*x**2 + b1*x + c1
	fit f(x) 'averages.csv' u (\$1):(\$24) via a1, b1, c1
	
	g(x) = a2*x**2 + b2*x + c2
	fit g(x) 'averages.csv' u (\$1):(\$25) via a2, b2, c2
	
	plot 'averages.csv' u (\$1):(\$24) title 'Bandwidth by Participant', 'averages.csv' u (\$1):(\$25) title 'Bandwidth All Room', f(x) notitle, g(x) notitle
EOFMarker
