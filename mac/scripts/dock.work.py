import os
from docklib import Dock

tech_dock = [
    "/Applications/Safari.app",
    "/Applications/Microsoft Edge.app",
    "/Applications/Microsoft Outlook.app",
    "/Applications/Microsoft Teams.app",
    "/Applications/Slack.app",
    "/Applications/Discord.app",
    "/Applications/Visual Studio Code.app",
    "/Applications/iTerm.app",
    "/Applications/Insomnia.app",
    "/Applications/KeePassXC.app",
    "/Applications/Cisco/Cisco AnyConnect Secure Mobility Client.app'",
]

dock = Dock()
dock.items["persistent-apps"] = [
    dock.makeDockAppEntry(item) for item in tech_dock if os.path.exists(item)
]
dock.save()