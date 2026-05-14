# Tulasi
### a pixel art icon pack for Linux. designed by an artist.

<img width="5643" height="1620" alt="COver" src="https://github.com/user-attachments/assets/ba9d9b68-a5ea-4623-ad19-996cfce69250" />


every icon in Tulasi is pixel art. 32x32. uniform shape. consistent visual grammar.

but it's not just aesthetic — each icon is designed to actually communicate something about the app it represents. if an app is good, it deserves an icon that says so.

---


## why this exists

I have ADHD. and GNOME's default icons are all over the place — different shapes, different styles, different weights. every time I looked at my dock my brain had to work harder than it should just to find things.

I tried existing icon packs. they were either too generic, too flat, or just a reskin of the same boring template. nothing felt intentional.

so I made my own. <3

<img width="3762" height="1212" alt="EX1" src="https://github.com/user-attachments/assets/adc604b4-db91-45b3-bf1e-8e4deb3bfe45" />

<img width="3776" height="1212" alt="EX2" src="https://github.com/user-attachments/assets/4858b624-9f1f-4b82-8e87-3e5bc2001aa6" />

## the Pamac moment

When I first came to Linux from Windows, I hid Pamac for weeks. The icon looked like something that would break my OS if I touched it. turns out it's one of the best package managers on Linux — friendly, visual, genuinely useful for anyone coming from Windows or Mac.

I didn't know that because the icon never gave me a reason to click it. That's a design failure.

The Pamac icon in Tulasi is a Pac-Man ghost. friendly. approachable. Click it, and suddenly you know how to manage your packages. That's not dumbing Linux down. That's just good design.

The CMake icon isn't just replicating the existing logo — the center line represents the bridge between raw source code and your machine. The small bits around it are the compilation process itself. you don't need to know that to use it. but if you see it, get curious, and look it up — your entire perception of what a build system does has just changed.

that's the halo effect working *for* Linux instead of against it.

---



---

## the community support <3

before Tulasi even officially dropped, the Linux community showed up in a massive way — **67k+ views, 900+ upvotes, and nearly 700 shares on Reddit**, plus over **150 GitHub stars** pre-release.

you all proved one thing: Linux deserves good design. to everyone who supported, shared, and resonated with this — thank you. <3


---

## installation

### method 1 — manual (recommended)

1. download the latest release zip and extract it
2. move the `Tulasi` folder to your icons directory:
   ```bash
   mv Tulasi ~/.local/share/icons/
   ```
3. refresh the icon cache:
   ```bash
   gtk-update-icon-cache ~/.local/share/icons/Tulasi/
   ```

### method 2 — one-liner
```bash
git clone https://github.com/shringarstudio/tulasi ~/.local/share/icons/Tulasi
gtk-update-icon-cache ~/.local/share/icons/Tulasi/
```

---

## applying the theme

### GNOME
install [GNOME Tweaks](https://gitlab.gnome.org/GNOME/gnome-tweaks) if you haven't already:
```bash
flatpak install flathub org.gnome.tweaks
```
then go to **Tweaks → Appearance → Icons → Tulasi**

### KDE Plasma
go to **System Settings → Appearance → Icons → Install from File** and select the zip, or move the folder to `~/.local/share/icons/` and select Tulasi from the list.

---

## app coverage

any app not listed here will fall back to your system theme (Adwaita on GNOME, Breeze on KDE).

**browsers** — Firefox (native + Flatpak), Brave, Vivaldi, Zen Browser, LibreWolf

**creative & design** — Blender (native + Flatpak), Aseprite, PureRef, Figma Linux, Kdenlive (native + Flatpak), FreeCAD, GIMP *(coming soon)*

**development** — Visual Studio Code, Godot Engine, Eclipse IDE, GitHub Desktop, Meld, RenderDoc, CMake

**gaming** — Steam, Lutris, Heroic Games Launcher, Bottles, Protontricks, Winetricks

**system & utilities** — Nautilus, GNOME Settings, GNOME Calculator, Disk Utility, File Roller, System Monitor, GNOME Tweaks, GNOME Software, GNOME Disks, Simple Scan, GNOME Extensions, Extension Manager, Dolphin, Ark, Konsole, KDE Partition Manager, Alacritty, htop, LocalSend, qBittorrent, Upscayl, Timeshift, FileZilla, GOverlay, Gear Lever

**media** — Tauon Music Box, Elisa, AudioTube, KDE Recorder, OBS Studio (native + Flatpak), Showtime

**notes & productivity** — Obsidian, Blanket, FeedFlow, GNOME World Secrets, Akregator

**communication** — Discord, Vesktop

**other** — Pins, Add Water, Penpot Desktop, NVIDIA Settings, Java (OpenJDK), Parental Controls, Winetricks, KDE Help Center, Kalk, KDE Clock, Kontrast, Arianna, KDE Weather

---

## manual setup (for unsupported apps)

some apps like **Eclipse**, **SKLauncher**, and **Helium Browser** don't use standard icon theme names. to use Tulasi icons for these, edit their `.desktop` file:

1. copy the app's `.desktop` file to your local applications folder:
   ```bash
   cp /usr/share/applications/eclipse.desktop ~/.local/share/applications/
   ```
2. open it in a text editor and change the `Icon=` line to the full path:
   ```ini
   Icon=/home/yourusername/.local/share/icons/Tulasi/scalable/apps/eclipse.svg
   ```

---

## flatpak vs native

many apps are available both as native packages and Flatpaks — Tulasi covers both. for example Firefox has both `firefox.svg` (native) and `org.mozilla.firefox.svg` (Flatpak) so it works regardless of how you installed it.

---

## status

Tulasi is officially released!! 🎉

- icons are SVGs, crisp at any size, ready to apply to your desktop
- The roster of supported apps is constantly growing
- this is still a work in progress and more apps will be added regularly
- want a specific app covered? open an issue and I'll add it to the roadmap!

---

## contribution & Future Plans

missing an icon for your favourite app? open an issue or submit a PR! include:
- the app name
- the icon name (run `grep "^Icon=" /path/to/app.desktop`)
- a reference image of the original icon
-  **Expanding Coverage:** New icons are added regularly.
-  **Rices:** I’m planning to release full desktop configurations to match the Tulasi aesthetic soon
I am a **UI/UX and branding designer**, not a developer. While I handle the art and visual grammar, **I need your help with the code!** If you know how to improve packaging, scripts, or system integration, please jump in.

---

## license

[CC BY-NC-SA 4.0](https://creativecommons.org/licenses/by-nc-sa/4.0/) — credit Shringar Studio, don't sell it, that's it really.

---

## support

Tulasi is free and always will be. if it made your desktop feel better, you can support the work here — *(Buy Me a Coffee link coming soon)*

## Contact

notonlinux@gmail.com

---

*built by a branding & product designer with <3 for Linux*
*because Linux deserves good design too.*
