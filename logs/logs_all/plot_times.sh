gnuplot -persist <<-EOFMarker
	set datafile separator ";"

	set title "All participants sending"
	
	set xlabel "Number of participants in room"
	set ylabel "Time [seconds]"
	
	set key at 23,95
	set key box
	set key width 2
	set xrange[1:30]
	set yrange[0:100]
	
	f(x) = a1*x**2 + b1*x + c1
	fit f(x) 'averages.csv' u (\$1):(\$2) via a1, b1, c1
	
	g(x) = a2*x**2 + b2*x + c2
	fit g(x) 'averages.csv' u (\$1):(\$3) via a2, b2, c2
	
	h(x) = a3*x**2 + b3*x + c3
	fit h(x) 'averages.csv' u (\$1):(\$4) via a3, b3, c3
	
	plot 'averages.csv' u (\$1):(\$2) title 'Total Time', 'averages.csv' u (\$1):(\$3) title 'First Message', 'averages.csv' u (\$1):(\$4) title 'Average Round Time', f(x) notitle, g(x) notitle, h(x) notitle
EOFMarker
