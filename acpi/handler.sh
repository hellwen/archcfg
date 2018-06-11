#!/bin/bash
# Default acpi script that takes an entry for all actions

case "$1" in
    button/power)
        case "$2" in
            PBTN|PWRF)
                logger 'PowerButton pressed'
                ;;
            *)
                logger "ACPI action undefined: $2"
                ;;
        esac
        ;;
    button/sleep)
        case "$2" in
            SLPB|SBTN)
                logger 'SleepButton pressed'
                ;;
            *)
                logger "ACPI action undefined: $2"
                ;;
        esac
        ;;
    ac_adapter)
        case "$2" in
            AC|ACAD|ADP0)
                case "$4" in
                    00000000)
                        logger 'AC unpluged'
                        ;;
                    00000001)
                        logger 'AC pluged'
                        ;;
                esac
                ;;
            *)
                logger "ACPI action undefined: $2"
                ;;
        esac
        ;;
    battery)
        case "$2" in
            BAT0)
                case "$4" in
                    00000000)
                        logger 'Battery online'
                        ;;
                    00000001)
                        logger 'Battery offline'
                        ;;
                esac
                ;;
            CPU0)
                ;;
            *)  logger "ACPI action undefined: $2" ;;
        esac
        ;;
    button/lid)
        case "$3" in
            close)
                logger 'LID closed'
                ;;
            open)
                logger 'LID opened'
                ;;
            *)
                logger "ACPI action undefined: $3"
                ;;
        esac
        ;;
    video/brightnessup)
        logger "Brightness up"
        amixer -q set Master 1+ toggle
        # xbacklight -display :0.0 +10
        ;;
    video/brightnessdown)
        logger "Brightness down"
        # xbacklight -display :0.0 -10
        ;;
    video/switchmode)
        logger "Switch mode"
        xrandr --output eDP1 --auto --primary \
  --output HDMI2 --auto --rotate right --right-of eDP1 \
  --output HDMI1 --auto --left-of eDP1
        ;;
    button/volumeup)
        logger "Volume up"
        amixer -q set Master 2dB+
        ;;
    button/volumedown)
        logger "Volume down"
        amixer -q set Master 2dB-
        ;;
    button/mute)
        logger "Volume mute"
        amixer -q set Master 1+ toggle
        ;;
    *)
        logger "ACPI group/action undefined: $1 / $2"
        ;;
esac
