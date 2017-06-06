gnuplot -persist <<-EOFMarker
	set datafile separator ";"

	set title "Cost of Anonymity (Total DC-Net Time / No anonymity Time)"
	
	set xlabel "Number of Messages"
	set ylabel "Time Cost"
	
	set key box
	set key at 23, 28000
	set key width 2
	set xrange[1:30]
	set yrange[0:30000]
	
	f(x) = a1*x*x+ b1*x + c1
	fit f(x) '../averages_anon_cost_all.csv' u (\$1):(\$2) via a1, b1, c1
	
	g(x) = a2*x*x + b2*x + c2
	fit g(x) '../averages_anon_cost_partial30.csv' u (\$1):(\$2) via a2, b2, c2

	plot '../averages_anon_cost_all.csv' u (\$1):(\$2) title 'All Room Sending', '../averages_anon_cost_partial30.csv' u (\$1):(\$2) title 'Partial Room Sending (Room of 30)', f(x) notitle, g(x) notitle
EOFMarker
