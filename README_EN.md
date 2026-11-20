# Haier Matrix TV Launcher 📺

A complete Android TV launcher for Haier Matrix TVs — prayer times & adhan, Arabic voice assistant, auto game mode, cinema & match night, live Egyptian league scores.

A complete Android TV launcher based on [CleanYourTV](https://github.com/Gathin/cleanyourtv) (MIT license), customized for the Haier Matrix TV. It includes prayer times and adhan, an Arabic voice assistant, auto game mode, cinema and match-night scenes, live Egyptian league scores, and much more.

## What's new in this update (November 2026)

- ⚡ **Automatic memory saver** — 20 seconds after you return to Home, the launcher closes background apps by itself, so the TV stays fast even with only 1.4 GB of RAM.
- 🎯 **Precise arrows** — every press of an arrow key on the remote moves exactly one tile, no more jumping 3 or 4 tiles.
- 🎙️ **Mic button works from anywhere** — press it while watching any app and voice search opens right away, routing your query to the app in front (YouTube, Oscar, browser...).
- 🔧 **Settings navigation fixed** — arrows now reach every settings row, even the ones below the fold.
- 🔕 **"Allow USB debugging?" dialog gone for good** — the key is now fixed inside the app, the memory saver cleans without opening any debugging connection (only the hotkey watcher's single connection runs), the watcher restarts itself if it dies while the TV sleeps, it waits 5 minutes if the dialog is dismissed, and shows an on-screen guide to tick "Always allow" — after one approval the dialog never appears again, even after a reboot.
- 🛡️ **Self-healing remote buttons** — if the listener behind the Mic and Settings buttons ever wedges (it used to happen and silently killed both buttons), the launcher now detects it on its own and restarts it within seconds, no action needed.
- 🗣️ **Voice search while watching** — if a video is playing and you search by voice, search opens correctly instead of sending you back to Home.
- 🛠️ **Fixes** — the weather crash that closed the launcher, plus general stability.

## Who is it for?

| TV | Status |
|---|---|
| **Haier Matrix H43K80EF** (or any model on the same HRT56EU board) | ✅ **Full** — every feature works in full |
| Any Android TV 14 with a **MT5867** (MediaTek) chip | ✅ Full, most likely |
| Any Android TV **14** on ARM | ✅ Core features work (prayer, adhan, voice, cinema, scores) — auto game mode and the remote's Settings/Mic keys may need tweaking |
| Android TV **older than 14** or non-ARM chips | ❌ Not guaranteed |

**Processor:** ARM 32-bit (armeabi-v7a) — also runs on 64-bit ARM.
**Android:** 14 (minimum 8.0).
**RAM:** the original TV has only 1.4 GB, and the launcher is tuned to stay light on it.

**Who exactly is it for?**
- ✅ A **Haier Matrix** owner who wants an Arabic launcher with prayer times, adhan and Arabic voice search.
- ✅ Anyone tired of a slow TV who wants it to stay fast by itself (automatic memory saver).
- ✅ Anyone who watches YouTube through SmartTube and wants the remote's YouTube button to open it directly.
- ✅ Anyone who plays on HDMI and wants game mode to switch on by itself.
- ⚠️ Not for someone who wants a plain, traditional launcher with no extras, or for non-Android-TV screens (Samsung Tizen, LG webOS).

## What you need (just this)

1. A **Windows PC** (Windows 10 or 11)
2. The **TV** and the PC on the **same Wi-Fi**
3. **Nothing else** — adb is bundled in this folder (`tools\adb`), no Android Studio needed.

## Install (5 simple steps)

1. **On the TV:** Settings → Device Preferences → About → tap **"Build" 7 times** until it says "You are now a developer".
2. **On the TV:** Settings → Device Preferences → Developer options → turn on **"USB debugging"** and **"Wireless debugging"** — it will show you an IP address (e.g. `192.168.1.50:5555`).
3. **On the PC:** unzip this folder and double-click **`install.bat`**.
4. **Type the TV's IP address** when it asks, and press Enter.
5. **Wait until it says "Done!"** — then press **Home** on the remote and pick **"Home"** if it asks.

> **Note:** if the TV asks "Allow USB debugging?", tap **"Allow"** and check **"Always"** (always allow from this PC only).

## What gets installed automatically

- **The launcher** (`launcher.apk`) — all the features below.
- **SmartTube** — ad-free YouTube (downloaded from its official GitHub).
- **Oscar TV** — movies and series (downloaded from its official GitHub).
- **From the Play Store** (opened for you, tap "Install"): TDM, VLC, X-plore, SofaBrowser, Google TV, Prime Video, and Gboard (Arabic keyboard).
- **Cleanup:** disables 7 unnecessary apps (Haier + Google bloat) and hides the stock YouTube — all reversible from Settings.

## Your accounts (important!)

This download contains no accounts — the launcher holds none. You sign in on your own TV after installing:

1. **SmartTube:** open it → sign in with your Google account (from a browser: `yt.be/activate`).
2. **Prime Video:** open it → sign in with your Amazon account (from a browser: `amazon.com/mytv`).
3. **Google:** Settings → Accounts → add your Google account (for the Play Store).

## Features

- ⚡ **Automatic memory saver** — 20 seconds after you return to Home, the launcher closes background apps (Oscar, Prime, Store...) by itself, so RAM stays free and the TV stays fast. Turn it off in Settings → "Automatic memory saver".
- 🕌 **Prayer times & adhan** — Egyptian calculation method, muezzin adhan (3 voices), a reminder 3 minutes before, auto-dismiss. **Pick your city** in Settings → "Prayer location" (18 Egyptian cities, default Aga / Nosa El-Gheit).
- 🌙 **Screensaver** — big clock, Hijri date, next prayer with countdown, weather, and an ayah or hadith that **changes every time** the TV goes to sleep.
- 🎙️ **Arabic voice assistant** — "open Oscar", "play Ahmed Kassab", "when is the next prayer", "cinema night", "sleep in one hour" — from the remote's Mic button.
- 🎮 **Auto game mode** — open any HDMI input and the TV switches to game mode by itself; back to Home and it restores the normal picture.
- 🎬 **Cinema & match night** — cinema warms the picture, match night opens Oscar and readies the TV for the match with a countdown.
- ⚽ **Live Egyptian league scores** — in the bottom bar, refreshed every 5 minutes.
- 📺 **Built-in browser** — any YouTube link opens straight in SmartTube.
- 🧩 **Two tile styles** — original app banners, or uniform colored icon cards.
- 🌙 **Night mode** — 12 AM to 6 AM, the screen dims and the volume drops.
- ⏱️ **Sleep timer** — a "Sleep" tile on Home puts the TV to sleep.
- ⚡ **Power meter** — tracks the TV's kWh and cost in EGP (2026 slabs).

## Troubleshooting

- **"Can't reach the TV":** make sure the TV and PC are on the same Wi-Fi, "Wireless debugging" is on, and the address is right.
- **Launcher doesn't show after install:** press Home on the remote and pick "Home" from the list.
- **Settings or Mic button not working:** Launcher → Settings → "Settings & Mic buttons" — enable the local watcher (runs on the TV itself, no PC needed). **Note:** the Mic button depends on the local watcher — if it stops suddenly, try restarting the TV.
- **"Allow USB debugging?" appeared again:** check "Always" before tapping "Allow" — if you tap "Allow" without "Always", the dialog comes back on the next reconnect. After checking "Always" once, it never appears again.
- **Prayer times wrong:** Launcher → Settings → "Prayer location" → pick your city.
- **Anything else:** open an issue here on GitHub.

## Source & license

- Based on [CleanYourTV](https://github.com/Gathin/cleanyourtv) — **MIT** license (Copyright (c) 2026 Gathin).
- Additions (prayer, adhan, voice, cinema, game mode, scores, ...) by **Mohamed Yasser** — same MIT license.
- SmartTube and Oscar TV have their own (open source) licenses — the installer downloads them from their official GitHub releases.

---
Made in Egypt 🇪🇬 — if you like it, give the repo a ⭐ and share it.
