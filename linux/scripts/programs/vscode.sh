wget -O ~/Downloads/vscode.tar.gz "https://code.visualstudio.com/sha/download?build=stable&os=linux-x64";

mkdir -p ~/Applications;

tar xvzf ~/Downloads/vscode.tar.gz -C ~/Applications;

#installed folder
#~/Applications/VSCode-linux-x64/

rm ~/Downloads/vscode.tar.gz;
