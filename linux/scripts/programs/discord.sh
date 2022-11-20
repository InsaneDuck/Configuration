wget -O ~/Downloads/discord.tar.gz "https://discordapp.com/api/download?platform=linux&format=tar.gz";

mkdir -p ~/Applications;

tar xvzf ~/Downloads/discord.tar.gz -C ~/Applications;

#sh ~/Applications/Discord/postinst.sh;

rm ~/Downloads/discord.tar.gz;
