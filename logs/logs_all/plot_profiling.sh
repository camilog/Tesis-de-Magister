gnuplot -persist <<-EOFMarker
	set datafile separator ";"
	
	set terminal pngcairo enhanced font "arial,18" fontscale 1.0 size 1920,1080
	set size ratio 1 1
	
	set title 'Code Profiling with all participants sending'
	set xlabel "Number of Participants"
	set ylabel '% of Total Time'
	
	set key invert reverse Left outside
	set xrange[-3:32]
	set yrange [0:100]
	set xtics 1
	
	set style data histograms
	set style histogram rowstacked 
	set style fill solid 1.00 border lt -1

	set key outside right top vertical Left reverse noenhanced autotitle columnhead nobox

	plot 'averages.csv' u 5:xtic(1) lt rgb '#69D2E7',\
	'' u 6 lt rgb '#E0E4CC' t column(6), \
	'' u 7 lt rgb '#E0E4CC' t column(7), \
	'' u 8 lt rgb '#E0E4CC' t column(8), \
	'' u 9 lt rgb '#FA6900' t column(9), \
	'' u 10 lt rgb '#E0E4CC' t column(10), \
	'' u 11 lt rgb '#E0E4CC' t column(11), \
	'' u 12 lt rgb '#E0E4CC' t column(12), \
	'' u 13 lt rgb '#FA6900' t column(13), \
	'' u 14 lt rgb '#E0E4CC' t column(14), \
	'' u 15 lt rgb '#E0E4CC' t column(15), \
	'' u 16 lt rgb '#FA6900' t column(16), \
	'' u 17 lt rgb '#E0E4CC' t column(17), \
	'' u 18 lt rgb '#E0E4CC' t column(18), \
	'' u 19 lt rgb '#FA6900' t column(19), \
	'' u 20 lt rgb '#E0E4CC' t column(20), \
	'' u 21 lt rgb '#E0E4CC' t column(21)
EOFMarker
