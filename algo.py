import json

with open("telecom.json", "r") as file:
    requestJSON = json.load(file)

print(requestJSON)
with open("miRequest.json", "w", encoding= "utf8") as file:
    json.dump(requestJSON, file)