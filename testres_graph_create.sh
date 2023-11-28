#!/bin/bash

echo 'Running Resonance Data through script...'

echo 'Checking for prescence of resonance testing folder'
if [ ! -d "/home/sachiki/printer_data/resonance_testing/" ]; then
	#make resonance testing dir
	echo 'Making resonance testing directory.'
	mkdir ~/printer_data/resonance_testing
	mkdir ~/printer_data/resonance_testing/csv_output
else
	echo 'Resonance testing directory exists!'
fi

echo 'Running X...'
python ~/klipper/scripts/calibrate_shaper.py /tmp/resonances_x_*.csv -o ~/printer_data/resonance_testing/shaper_calibrate_x-"`date +"%Y-%m-%d-%H%M%S"`".png

echo 'Running Y...'
python ~/klipper/scripts/calibrate_shaper.py /tmp/resonances_y_*.csv -o ~/printer_data/resonance_testing/shaper_calibrate_y-"`date +"%Y-%m-%d-%H%M%S"`".png

echo 'Moving CSV files'
mv /tmp/resonances_x_*.csv ~/printer_data/resonance_testing/csv_output
mv /tmp/resonances_y_*.csv ~/printer_data/resonance_testing/csv_output
echo 'Done!'
