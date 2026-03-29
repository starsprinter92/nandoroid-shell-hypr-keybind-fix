pragma Singleton

import "../core"
import QtQuick
import Quickshell
import Quickshell.Io

/**
 * SysCheckService.qml
 * Centralized dependency management service.
 * Driven by data/dependencies.json.
 */
Singleton {
    id: root

    property int missingCount: 0
    property bool isReady: missingCount === 0
    property bool isChecking: false
    
    // The master list of dependencies with their current status
    // [{name, displayName, description, installed, category}]
    property var dependencyData: []

    function check() {
        if (isChecking) return;
        isChecking = true;
        checkProcess.running = true;
    }

    Component.onCompleted: check()

    Process {
        id: checkProcess
        command: [
            "bash", "-c", 
            "JSON_FILE=\"" + Directories.home + "/.config/quickshell/nandoroid/data/dependencies.json\"; " +
            "if [ ! -f \"$JSON_FILE\" ]; then echo 'ERROR: File not found'; exit 1; fi; " +
            "jq -c '.core[], .fonts[], .optional[]' \"$JSON_FILE\" | while read -r item; do " +
            "  name=$(echo \"$item\" | jq -r '.name'); " +
            "  cmd=$(echo \"$item\" | jq -r '.command'); " +
            "  desc=$(echo \"$item\" | jq -r '.description // \"\"'); " +
            "  installed=false; " +
            "  if command -v \"$cmd\" >/dev/null 2>&1 || [ -f \"$cmd\" ]; then installed=true; fi; " +
            "  echo \"$name|$desc|$installed\"; " +
            "done"
        ]

        stdout: StdioCollector {
            onStreamFinished: {
                if (this.text.startsWith("ERROR")) {
                    root.isChecking = false;
                    return;
                }
                
                const lines = this.text.split("\n").filter(line => line.trim() !== "");
                let newData = [];
                let missing = 0;
                
                lines.forEach(line => {
                    const parts = line.split("|");
                    if (parts.length < 3) return;
                    
                    const isInstalled = parts[2] === "true";
                    if (!isInstalled) missing++;
                    
                    newData.push({
                        name: parts[0],
                        description: parts[1],
                        installed: isInstalled
                    });
                });
                
                root.dependencyData = newData;
                root.missingCount = missing;
                root.isChecking = false;
            }
        }
    }
}
