# This script file starts all JMeter test plans located in the same folder (as the script) N times from the command line

rounds=$1

if [ "$rounds" == "" ]
  then
    echo "You need to provide the number of rounds, e.g. $0 10"
  else 
    for file in *.jmx ; do
	for ((i=1;i<=$rounds;i++)) ; do
		echo "Starting test plan: $file"
		/home/user/apache-jmeter-3.2/bin/jmeter -n -t $file -l /home/user/tradeEvaluation/results/scenarioPlainODE_1KB/${file%%.*}-$i.jtl
		echo "Finished test plan: $file"
	done
    done
fi
