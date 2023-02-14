import os

import Scripts.GlobalVariables as GVars


def UpdateMapList(workshopFolderPath: str) -> list[str]:
    maplist = []
    for root, dirs, files in os.walk(workshopFolderPath):
        if (".jpg" in files) and (".bsp" in files):
            CMap = {
                "name" : "",
                "bsp" : "",
                "id" : ""
            }

            for file in files:
                if ".bsp" in file:
                    CMap["name"] = file.replace(".bsp", "")
                    CMap["bsp"] = "workshop" + os.path.join(root, file).replace(workshopFolderPath, "")
                elif ".jpg" in file:
                    CMap["id"] = file.replace("thumb", "").replace(".jpg", "")

            maplist.append(CMap)

def SteamIDFromLink(link : str) -> str:
    # remove the usual url
    link = link.replace("https://steamcommunity.com/sharedfiles/filedetails/?id=", "")
    # removes the searchtext
    # when you search for a map and you copy the link it will append the search text to the end of the url
    # like this -> https://steamcommunity.com/sharedfiles/filedetails/?id=91038223&searchtext=gelocity
    # to remove it loop through the string thats grabbed until it finds a letter then substring all that's before it
    i : int = 0
    for letter in link:
        if not letter.isdigit():
            link = link[0:i]
            break
        i += 1

    return link

def MapFromSteamID(workshopLink: str, workshoppath: str = None) -> str:
    if workshoppath is None:
        workshoppath = GVars.configsData["Portal2-Path"]["value"] + "/portal2/maps/workshop"

    SteamID = SteamIDFromLink(workshopLink)
    maplist = UpdateMapList(workshoppath)

    for map in maplist:
        if map["id"] == SteamID:
            return "changelevel " + map["bsp"]
    return None
