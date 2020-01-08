#!/bin/bash

#Declare a string array
Extenstions=("azemoh.one-monokai" "emmanuelbeziat.vscode-great-icons" "HookyQR.beautify" "ow.vscode-subword-navigation" "formulahendry.auto-close-tag" "formulahendry.auto-rename-tag" "ms-vscode.csharp" "humao.rest-client" "cssho.vscode-svgviewer" "jupyter.showPreview" "eamodio.gitlens" "mindginative.terraform-snippets" "neilbarkhina.gitdownloadazurerepos" "ms-azuretools.vscode-azureterraform" "hookyqr.beautify" "bibhasdn.git-easy" "donjayamanne.githistory" "knisterpeter.vscode-github" "donjayamanne.jupyter" "ms-vscode.powershell" "loganarnett.tf-snippets" "mccarter.start-git-bash" "4ops.terraform" "mauve.terraform" "erd0s.terraform-autocomplete" "laszer25.terraform-azure-autocomplete" "sahmed.terraform-comments-beautifier")

# Print array values in  lines
echo "Installing Extenstions"
for val1 in ${Extenstions[*]}; do
     echo $val1
     code --install-extension $val1
done

echo ""
