import json

print("hello")
# read file
myjsonfile = open('C:/Users/Kgand/Documents/Repositories/aal-crossme-david/DavidToEjAirtablexml/Airtable.xml.json','r')
jsondata = myjsonfile.read()

# Parse
obj = json.loads(jsondata)

print(obj["Airtable"]["GameLevels"]["GameLevel"][0]["GroupNumber"])

#check pictures on your phone for reference for some of this stuff

# print(str(obj['GroupNumber']))

# print("I Made This Print 'Hello World' Thing Work So I Am Now Moving To New Things ")
#
# print("\n0001000"
#       "\n0111110"
#       "\n1111111"
#       "\n0001000"
#       "\n0001000"
#       "\n0001000"
#       "\n0011000"
#       "\n0011000")
