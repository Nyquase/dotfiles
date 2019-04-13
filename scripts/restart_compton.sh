#!/bin/bash

nitrogen --restore

(( $? != 0 )) && pkill compton

sleep 0.5
compton -b --config ~/.config/compton.conf
