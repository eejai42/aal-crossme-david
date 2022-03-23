import json

# print("hello")
# read file
myjsonfile = open('C:/Users/Kgand/Documents/Repositories/aal-crossme-david/SSoT/Airtable.xml.json', 'r')
jsondata = myjsonfile.read()

# Parse
obj = json.loads(jsondata)
#
# for x in obj["Airtable"]["Levels"]["Level"]:
#     if x["MenuName"] == "#1.08":

#
for x in obj["Airtable"]["Levels"]["Level"]:
    y = x["SolutionBinary"].replace("1", "x").replace("0"," ")
    print(x["LevelName"])
    print(y)
    print("")
    print("")
    print("")


# print(obj["Airtable"]["Levels"]["Level"][0]["SolutionBinary"])
# print(obj["Airtable"]["Levels"]["Level"][1]["SolutionBinary"])
# print(obj["Airtable"]["Levels"]["Level"][2]["SolutionBinary"])
# print(obj["Airtable"]["Levels"]["Level"][3]["SolutionBinary"])
# print(obj["Airtable"]["Levels"]["Level"][4]["SolutionBinary"])
# print(obj["Airtable"]["Levels"]["Level"][5]["SolutionBinary"])
# print(obj["Airtable"]["Levels"]["Level"][6]["SolutionBinary"])
# print(obj["Airtable"]["Levels"]["Level"][7]["SolutionBinary"])
# print(obj["Airtable"]["Levels"]["Level"][8]["SolutionBinary"])
# print(obj["Airtable"]["Levels"]["Level"][9]["SolutionBinary"])

# this is how the parentheses order goes
#  Object, Object, Object, Array, Object






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
