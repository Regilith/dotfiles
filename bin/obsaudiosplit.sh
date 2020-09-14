#!/bin/bash
module_name=$(pactl list short sinks | grep alsa_output.pci | awk '{print $2}')
pactl load-module module-null-sink
null_sink_no=$(pactl list short sinks | grep null | awk '{print $1}')
pactl load-module module-combine-sink slaves="$null_sink_no,$module_name"
echo "This only works if you have 1 sound card and no null sinks already"