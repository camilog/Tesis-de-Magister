import csv

averages = open('averages.csv', 'w+')
averages.write('Messages;Total Time (sec);First Message Arrival (sec);Average Time per Round (sec);Key Generation (%);Commitments on Key (%);PoK Generation on Keys (%);Sending Comm&PoK on Keys (%);Receive Comm&PoK on Keys (%);Setting Round Messages (%);Calculate PoK on Message Format (%);Send Format Proof (%);Receive Comm&PoK on Format (%);Calculate PoK on Message (%);Send PoK on Message (%);Receive PoK on Message (%);Calculate PoK on Output (%);Send PoK on Output (%);Receive PoK on Output (%);Virtual Round (%);Round Resolution (%);Total Messages Size (bytes);Average Messages Size per Round (bytes);Average Bandwith by participant (bytes/sec);Average Bandwith Approx. all room (bytes/sec)\n')
for i in range(1,31):
	averages.write(str(i))
	file_name = str(i) + '.csv'
	for j in range(0, 24):
		with open(file_name, newline='') as f:
			reader = csv.reader(f, delimiter=';')
			the_numbers = [float(row[j]) for row in reader]
			average = sum(the_numbers) / len(the_numbers)
			# averages.write(';' + str(average))
			averages.write(';' + "%.4f" % average)
	averages.write('\n')
