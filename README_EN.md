# Mido's TV Launcher 📺

**Mido's exact TV setup — everything on it — except his accounts.**

A full Android TV launcher based on [CleanYourTV](https://github.com/Gathin/cleanyourtv) (MIT license), tuned for the Haier Matrix TV. Prayer times and adhan, an Arabic voice assistant, auto game mode, cinema and match-night scenes, live Egyptian league scores, and more.

## Who is it for?

| TV | Status |
|---|---|
| **Haier Matrix H43K80EF** (or any model on the same HRT56EU board) | ✅ **Full** — everything works exactly as on Mido's TV |
| Any Android TV 14 with a **MT5867** (MediaTek) chip | ✅ Full, most likely |
| Any Android TV **14** on ARM | ✅ Core features work (prayer, adhan, voice, cinema, scores) — auto game mode and the remote's Settings/Mic keys may need tweaking |
| Android TV **older than 14** or non-ARM chips | ❌ Not guaranteed |

**Processor:** ARM 32-bit (armeabi-v7a) — also runs on 64-bit ARM.
**Android:** 14 (minimum 8.0).
**RAM:** the original TV has only 1.4 GB, and the launcher is tuned to stay light on it.

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
- **Cleanup:** disables 7 useless apps (Haier + Google bloat) and hides the stock YouTube — all reversible from Settings.

## Your accounts (important!)

**None of Mido's accounts are in this download.** The launcher itself holds no accounts — you sign in on your own TV after installing:

1. **SmartTube:** open it → sign in with your Google account (from a browser: `yt.be/activate`).
2. **Prime Video:** open it → sign in with your Amazon account (from a browser: `amazon.com/mytv`).
3. **Google:** Settings → Accounts → add your Google account (for the Play Store).

## Features

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

## If something goes wrong

- **"Can't reach the TV":** make sure the TV and PC are on the same Wi-Fi, "Wireless debugging" is on, and the address is right.
- **Launcher doesn't show after install:** press Home on the remote and pick "Home" from the list.
- **Settings or Mic button not working:** Launcher → Settings → "Settings & Mic buttons" — enable the local watcher (runs on the TV itself, no PC needed).
- **Prayer times wrong:** Launcher → Settings → "Prayer location" → pick your city.
- **Anything else:** open an issue here on GitHub.

## Source & license

- Based on [CleanYourTV](https://github.com/Gathin/cleanyourtv) — **MIT** license (Copyright (c) 2026 Gathin).
- Additions (prayer, adhan, voice, cinema, game mode, scores, ...) by **Mido** — same MIT license.
- SmartTube and Oscar TV have their own (open source) licenses — the installer downloads them from their official GitHub releases.

---
Made with love in Egypt 🇪🇬 — if you like it, give the repo a ⭐ and share it.
