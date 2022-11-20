#download from url
wget -O ~/Downloads/webstorm.tar.gz "https://download.jetbrains.com/product?code=WS&latest&distribution=linux";
#make application directory if it doesn't exist
mkdir -p ~/Applications;
#extracting
tar xvzf ~/Downloads/webstorm.tar.gz -C ~/Applications;
#replace extracted folder name with a generic name to remove any version number from folder name
# to keep name consistent
find ~/Applications -maxdepth 1 -name '*WebStorm*' -print0 | xargs -0 -I {} mv {} ~/Applications/webstorm

#~/Applications/webstorm/postinst.sh;

#rm ~/Downloads/*.tar.gz;
