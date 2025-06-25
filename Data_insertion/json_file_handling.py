# Reads config.json and prints "refresh_interval"

# Updates "enabled" to false and writes back to config.json

import json as j

with open('config.json','r') as f:
    data = j.load(f)

print("Refresh Interval:", data['refresh_interval'])

data['enabled'] = False
with open('config.json','w') as f:
    j.dump(data, f, indent=2)


print(data)