
# ls /sys/class/backlight/intel_backlight

# max brightness
# cat /sys/class/backlight/intel_backlight/max_brightness

# current brightness
# cat /sys/class/backlight/intel_backlight/brightness

# change brightness
# sudo tee /sys/class/backlight/intel_backlight/brightness <<< 500
