import os
from docklib import Dock

tech_dock = [
    "/Applications/Visual Studio Code.app",
]

dock = Dock()
dock.items["persistent-apps"] = [
    dock.makeDockAppEntry(item) for item in tech_dock if os.path.exists(item)
]
dock.save()