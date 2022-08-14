#!/bin/bash

echo Enter your Discord bot token:
read discord_token

echo Enter your Discord client ID:
read discord_client_id

echo Enter your Discord client secret:
read discord_client_secret

echo Enter your Spotify application client ID:
read spotify_client_id

echo Enter your Spotify application client secret:
read spotify_client_secret

export DEBIAN_FRONTEND=noninteractive
apt update
apt full-upgrade

bash <(curl -s https://deb.nodesource.com/setup_18.x)
apt install -y nodejs

apt install -y git

mkdir -p /opt
cd /opt
git clone https://github.com/SudhanPlayz/Discord-MusicBot.git
cd Discord-MusicBot

cp /dev/null botconfig.js
cat <<EOT >> botconfig.js
module.exports = {
  Admins: [""], // Admins of the bot, I don't know what this do. -Darren.
  ExpressServer: false, // If you wanted to make the website run or not
  DefaultPrefix: process.env.Prefix || ">", // Default prefix, Server Admins can change the prefix
  Port: 3000, //Which port website gonna be hosted
  SupportServer: "https://discord.gg/sbySMS7m3v", // Support Server Link
  Token: process.env.Token || "$discord_token", // Discord Bot Token
  ClientID: process.env.Discord_ClientID || "$discord_client_id", // Discord Client ID
  ClientSecret: process.env.Discord_ClientSecret || "$discord_client_secret", // Discord Client Secret
  Scopes: ["identify", "guilds", "applications.commands"], // Discord OAuth2 Scopes
  ServerDeafen: true, // If you want bot to stay deafened
  DefaultVolume: 100, // Sets the default volume of the bot, You can change this number anywhere from 1 to 9007199254740991 (JS Integer limit. If you do set it to that, you're a monster.)
  CallbackURL: "/api/callback", // Discord API Callback url. Do not touch it if you don't know what you are doing. All you need to change for website to work is on line 20.
  "24/7": false, // Make the bot stays in VC 24/7 (when you reboot the bot will **not** automatically rejoin.)
  CookieSecret: "Pikachu is cute", // A cookie for you, cookie for me. make sure you change this value!
  IconURL:
    "https://raw.githubusercontent.com/SudhanPlayz/Discord-MusicBot/master/assets/logo.gif", // URL of all embed author icons | Dont edit unless you dont need that Music CD Spining
  EmbedColor: "RANDOM", // Color of most embeds | Custom Hex value are supported. I.e: "#36393F"
  Permissions: 2205281600, // Bot Inviting Permissions
  Website: process.env.Website || "https://example.com", // Website where it is hosted at includes http or https || Use "0.0.0.0" if you using Heroku || Do not include /api/callback. Just the website url. I.e. "https://foo.bar"
  // If you get invalid oauth, make sure on the discord developer page you set the oauth url to something like: https://example.com/api/callback.

  Presence: {
    status: "online", // You can show online, idle, and dnd
    name: "Music", // The message shown
    type: "LISTENING", // PLAYING, WATCHING, LISTENING, STREAMING
  },

  // You need a lavalink server for this bot to work!!!!
  // Lavalink server; public lavalink -> https://lavalink-list.darrennathanael.com/; create one yourself -> https://darrennathanael.com/post/how-to-lavalink
  Lavalink: {
    id: "Main", //- Used for indentifier. You can set this to whatever you want.
    host: "node1.kartadharta.xyz", //- The host name or IP of the lavalink server.
    port: 443, // The port that lavalink is listening to. This must be a number!
    pass: "kdlavalink", //- The password of the lavalink server.
    secure: true, // Set this to true if the lavalink uses SSL. if not set it to false.
    retryAmount: 200, //- The amount of times to retry connecting to the node if connection got dropped.
    retryDelay: 40, //- Delay between reconnect attempts if connection is lost.
  },
  // Spotify Integration, allows you to enter a spotify link.
  Spotify: {
    ClientID: process.env.Spotify_ClientID || "$spotify_client_id", // Spotify Client ID
    ClientSecret: process.env.Spotify_ClientSecret || "$spotify_client_secret", // Spotify Client Secret
  },
};
EOT

cat <<EOT > /lib/systemd/system/musicbot.service
[Unit]
Description=Discord Music Bot
After=network.target

[Service]
Type=simple
User=root
Group=root
WorkingDirectory=/opt/Discord-MusicBot
ExecStart=/usr/bin/node /opt/Discord-MusicBot/index.js
Restart=on-failure

[Install]
WantedBy=multi-user.target
EOT

npm install

systemctl daemon-reload

systemctl enable --now musicbot

echo Music bot should be running!

echo Invite it to your server with this link:
echo https://discord.com/oauth2/authorize?client_id=$discord_client_id&permissions=141771132224&scope=bot
