#!/bin/bash

echo 'Running Resonance Data through script...'

echo 'Checking for prescence of resonance testing folder'
if [ ! -d "/home/pi/klipper_config/resonance_testing/" ]; then
	#make resonance testing dir
	echo 'Making resonance testing directory.'
	mkdir ~/klipper_config/resonance_testing
	mkdir ~/klipper_config/resonance_testing/csv_output
else
	echo 'Resonance testing directory exists!'
fi

echo 'Running X...'
python ~/klipper/scripts/calibrate_shaper.py /tmp/calibration_data_x_*.csv -o ~/klipper_config/resonance_testing/shaper_calibrate_x-"`date +"%Y-%m-%d-%H%M%S"`".png

echo 'Running Y...'
python ~/klipper/scripts/calibrate_shaper.py /tmp/calibration_data_y_*.csv -o ~/klipper_config/resonance_testing/shaper_calibrate_y-"`date +"%Y-%m-%d-%H%M%S"`".png

echo 'Moving CSV files'
mv /tmp/calibration_data_x_*.csv ~/klipper_config/resonance_testing/csv_output
mv /tmp/calibration_data_y_*.csv ~/klipper_config/resonance_testing/csv_output
echo 'Done!'