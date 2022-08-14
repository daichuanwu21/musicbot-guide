# How to setup a Discord Music Bot

In the past, Google/YouTube has openly demonstrated their hostility towards Discord music bots. (Mlot) (Provenzano) This stance, while justified to some extent, deprives users of a part of the 'Discord experience'.

So then, what if public bots are not allowed in Google's eyes since they accept donations, what if you run your own?

---
## Step-by-step Guide

### Creating a Bot User on Discord
You'll need to create a "bot user" first, this is the account through which your bot will interact with Discord.

1. Head over to the [Discord Developer Portal](https://discord.com/developers/applications)
2. Click "New Application"
3. Put in a username for your bot
4. Accept the TOS and click "Create"
5. Click "OAuth2" on the sidebar
6. Take note of the Discord Client ID
7. Generate a Discord client secret by clicking "Reset Secret"
8. Click "Yes, do it!"
9. Take note of the Discord client secret
10. Click "Bot" on the sidebar
11. Click "Add Bot"
12. Click "Yes, do it!"
13. Generate a Discord bot token by clicking "Reset Token"
14. Click "Yes, do it!"
15. Take note of the Discord bot token

## Creating a Spotify application
You'll need a Spotify application for your bot to talk to Spotify, and play songs from there.

1. Head over to the [Spotify Developer Console](https://developer.spotify.com/dashboard) and login
2. Click "CREATE AN APP"
3. Put in anything for the app name, description and accept TOS
4. Click "CREATE"
5. Click "SHOW CLIENT SECRET"
6. Take note of the Spotify Client ID and Client Secret

## Deploying the Bot
This is the trickiest part of the guide. You'll need to rent a server, connect to it via a command-line interface and finally deploy the bot.
I've made a script to make this easier, but you'll still need to read the following steps carefully.

This guide uses Vultr as the cloud provider, but you can use others if you know how to adapt the steps.

### Renting the server
1. Head to [Vultr](https://www.vultr.com), create an account and link a payment method
2. Click the blue "+" button
3. Select "Cloud Compute"
4. Leave the "CPU & Storage Technology" as it is
5. Select a "Server Location" geographically close to you
6. Select "Debian 11 x64" as the "Server Image" if not already selected
7. Select the 1 vCPU, 1GB Memory and 2TB Bandwidth plan ($5-6/month)
8. (optional) Disable "Auto Backups" to save costs
9. Click Deploy Now and wait for the server to become available (spinning circle stops)
10. Click on the "Cloud Instance"

### Connecting to the server and deploying the bot
1. Open PowerShell (or Terminal on macOS)
2. Type `ssh root@[IP Address]` and press enter

**NOTE:** Replace [IP Address] with the IP Address found in the "Server Information" page

3. Type `yes` when prompted with key fingerprint confirmation and press enter

The key fingerprint confirmation prompt looks something like this:
```
The authenticity of host '69.42.24.96 (69.42.24.96)' can't be established.
ED25519 key fingerprint is SHA256:GfVfJBpUzAhWW9y+6bZCtb3ZPTl8XQsenUXkCsW8Mom.
This key is not known by any other names.
Are you sure you want to continue connecting (yes/no/[fingerprint])?
```

4. Wait until the command line shows `root@vultr:~#`
5. Paste `bash <(curl -s https://raw.githubusercontent.com/daichuanwu21/musicbot-guide/master/install.sh)` and press enter
6. Answer each prompt with the token, client ids and secrets from before
7. Invite the bot to your server with the link it provides

Congrats, you have your own music bot, that wasn't so bad, was it?

---

### Special Thanks
Thanks to @SudhanPlayz for developing the [music bot](https://github.com/SudhanPlayz/Discord-MusicBot) used in this guide. This guide wouldn't have happened without it.

---
### Sources

Mlot, Stephanie. “YouTube Orders Shutdown of Groovy Discord Music Bot.” PC Magazine, PCMag, 14 Aug. 2021, www.pcmag.com/news/youtube-orders-shutdown-of-groovy-discord-music-bot. Accessed 14 Nov. 2022.

Provenzano, Brianna. “YouTube Forces Popular Discord Music Bot to Shut Down.” Gizmodo, G/O Media Inc., 13 Sept. 2021, gizmodo.com/youtube-forces-popular-discord-music-bot-to-shut-down-1847664573. Accessed 12 Nov. 2022.
