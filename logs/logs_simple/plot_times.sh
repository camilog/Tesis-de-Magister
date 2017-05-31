gnuplot -persist <<-EOFMarker
	set datafile separator ";"

	set title "Network with no Anonimity"
	
	set xlabel "Number of participants in room"
	set ylabel "Time [seconds]"
	
	set key box
	set key width 2
	set xrange[1:30]
	set yrange[0.001:0.02]
	
	f(x) = a1*x+ b1
	fit f(x) 'all/averages.csv' u (\$1):(\$2) via a1, b1
	
	g(x) = a2*x + b2
	fit g(x) 'partial30/averages.csv' u (\$1):(\$2) via a2, b2

	plot 'all/averages.csv' u (\$1):(\$2) title 'Total Time All', 'partial30/averages.csv' u (\$1):(\$2) title 'Total Time Partial', f(x) notitle, g(x) notitle
EOFMarker
