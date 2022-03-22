import json

print("hello")
# read file
myjsonfile = open('C:/Users/Kgand/Documents/Repositories/aal-crossme-david/SSoT/Airtable.xml.json', 'r')
jsondata = myjsonfile.read()

# Parse
obj = json.loads(jsondata)

print(obj["Airtable"]["Levels"]["Level"][0]["SolutionBinary"])
print(obj["Airtable"]["Levels"]["Level"][1]["SolutionBinary"])
print(obj["Airtable"]["Levels"]["Level"][2]["SolutionBinary"])
print(obj["Airtable"]["Levels"]["Level"][3]["SolutionBinary"])
print(obj["Airtable"]["Levels"]["Level"][4]["SolutionBinary"])
print(obj["Airtable"]["Levels"]["Level"][5]["SolutionBinary"])
print(obj["Airtable"]["Levels"]["Level"][6]["SolutionBinary"])
print(obj["Airtable"]["Levels"]["Level"][7]["SolutionBinary"])
print(obj["Airtable"]["Levels"]["Level"][8]["SolutionBinary"])
print(obj["Airtable"]["Levels"]["Level"][9]["SolutionBinary"])






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
