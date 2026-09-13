# Tulasi By ShringarStudio
### The most aesthetic icon pack for Linux. designed by an artist.

<img width="4860" height="1396" alt="Branding" src="https://github.com/user-attachments/assets/aa8a192d-5476-420a-8a6e-ed6d09fc9f31" />


Tulasi is a handcrafted 32x32 pixel art icon pack for Linux desktops. Every single icon is drawn pixel by pixel in Aseprite, built with a uniform silhouette and a tactile visual grammar.

If you are looking for an aesthetic Linux icon theme, a consistent pixel art style for your desktop setup, or a clean icon pack for KDE Plasma, GNOME, and tiling window managers (Hyprland, Sway, i3), Tulasi was designed to replace the visual clutter of mismatched icons with something intentional, cohesive, and calm.


---


<img width="4860" height="2090" alt="What&#39;sNew" src="https://github.com/user-attachments/assets/45e9102e-c1cf-4d15-b514-cea15c3647c9" />

## What is New in Release 01

* **Moved from PNG bloat to singular SVGs:** Replaced heavy multi-size raster folders with single scalable SVGs. Connected pixel paths are merged directly in the vector code, dropping file sizes to 1-4 KB per icon and dramatically improving performance on low-end hardware.
* **Dolphin Seam Bug Fixed:** Rebuilt every icon on a strict 1:1 integer coordinate grid with crisp edge rendering. This completely fixes the faint white lines and micro-gaps that used to appear in KDE Dolphin and file pickers.
* **150+ Master App Icons:** Added high-demand software including Krita, Blender, FreeCAD, Telegram, Teams for Linux, Proton suite (Mail, VPN, Pass), Strawberry Music Player, Lollypop, Surfshark, Microsoft 365, VirtualBox, GNOME Boxes, Floorp, and more.
* **Over 1,000 Desktop Symlinks:** Expanded symlinks mapped to standard desktop IDs, ensuring broad out-of-the-box support for Flatpak (reverse-DNS), Snap, AppImage, and native distro installs.
* **Fixed Folder Favicons:** Resolved the issue where Downloads, Pictures, and Videos fell back to generic folder icons instead of their proper symbolic glyphs.


## The Three Editions

* **Tulasi (Full Theme):** Contains the complete icon set, including application icons, folders, places, actions, and system status glyphs. Ideal for KDE Plasma, XFCE, and deeply customizable environments.
* **Tulasi-Gnome:** An applications-only version tailored specifically for GNOME Shell. It only skins third-party applications and leaves your native Adwaita folders, top bar, and shell chrome untouched.
* **Tulasi.Noir:** A high-contrast monochromatic version built for dark mode, OLED screens, and minimal tiling setups. [Tulasi.Noir](https://github.com/shringarstudio/tulasi.noir)

  
---

## Why Tulasi Exists

I grew up on Windows. But over the last few years, watching the system degrade with forced telemetry, bloat, instability, and intrusive AI slop made me want to get away. I wanted to own my machine again and support open source software, and that brought me to Linux.

When I switched, I loved the freedom, but the desktop visuals felt disjointed. 

I have ADHD, and default Linux icon sets are often chaotic. Every app has a different shape, an uneven visual weight, and inconsistent styling. Every time I looked at my dock or application launcher, my brain had to do extra work just to scan and recognize software. 

Tulasi was created to fix that cognitive load. By giving every application an identical 32x32 base silhouette, the visual noise disappears. Your dock looks unified, and your brain stops fighting clutter.

<img width="4860" height="1508" alt="TulasiIconpackTaskbar" src="https://github.com/user-attachments/assets/c6753b58-4f55-4fc7-b9ee-db7ef2722389" />


---

## Design Language: Tactile & Meaningful

Icons shouldn't feel like flat, sterile vector templates, and they shouldn't intimidate users. Tulasi icons are drawn with depth and subtle borders so they feel tangible and tactile on your screen. More importantly, each icon is designed to communicate what the software actually represents.

### The Pamac Moment
When I first arrived on Linux, I hid Pamac for weeks. The default icon looked like a scary maintenance tool that would break my system if I touched it. It turned out to be one of the friendliest, most useful package managers on Linux. 

That was a design failure. An icon should invite people in, not scare them away. 

In Tulasi, the Pamac icon is reimagined as an approachable Pac-Man ghost. Click it, and you instantly feel comfortable managing software. That is good design working for Linux instead of against it.

### The CMake Design
The CMake icon in Tulasi doesn't just copy the standard geometric logo. The center vertical line represents the bridge between raw source code and the machine, and the surrounding blocks represent the compilation steps. You do not need to know that to use it, but if you notice it, it tells a story about what build systems actually do.

---

## Community Response

What started as a small personal project quickly turned into an open source community effort. 

Within 48 hours of posting the concept on Reddit, the post reached over 140,000 views, 900+ upvotes, and hundreds of encouraging comments from people who wanted better design on the Linux desktop. Tulasi was also picked up and featured on Chinese Linux and tech websites, bringing total impressions past 170,000 worldwide. 

Seeing people star the repo, use it in their desktop rices, and even create community forks while I had to temporarily step away due to family hardship is the reason this project is back and officially moving out of alpha into its first full release.

---

## Installation

### Manual Install (Recommended)

1. Download the latest release from the Releases tab and extract it.
2. Move the theme folders into your local icons directory:
   ```bash
   mkdir -p ~/.local/share/icons
   cp -r Tulasi Tulasi-Gnome Tulasi-Monochromatic ~/.local/share/icons/
   ```
3. Update your icon cache:
   ```bash
   gtk-update-icon-cache -f ~/.local/share/icons/Tulasi
   gtk-update-icon-cache -f ~/.local/share/icons/Tulasi-Gnome
   gtk-update-icon-cache -f ~/.local/share/icons/Tulasi-Monochromatic
   ```

### Quick Clone

```bash
git clone https://github.com/ShringarStudio/Tulasi.git ~/.local/share/icons/Tulasi
gtk-update-icon-cache -f ~/.local/share/icons/Tulasi
```

---

## Applying the Theme

* **KDE Plasma:** Open **System Settings → Appearance → Icons**, select **Tulasi** (or **tulasi.Noir**), and click Apply.
* **GNOME:** Install GNOME Tweaks (`flatpak install flathub org.gnome.tweaks`), open **Tweaks → Appearance → Icons**, and select **Tulasi-Gnome**.

---

## Requesting Icons

If an application you use is missing an icon:
1. Check existing GitHub issues to see if it is already logged.
2. If not, open an issue including:
   * The software name.
   * The desktop entry icon line (found via `grep "^Icon=" /usr/share/applications/<app>.desktop`).
   * How you installed it (native repo, Flatpak, or Snap).

---

## Supporting the Project

<img width="4860" height="1253" alt="Support Tulasi1" src="https://github.com/user-attachments/assets/5df9c52b-dc14-4c63-afc7-be669ff3220a" />

Tulasi is free and will always remain free.

If you enjoy the icon pack and want to help me continue working on it, you can support the project on (coming soon)

That being said. being 19 and broke financially. The last few months were uncertain and that struggle nearly killed this project.
If you cannot support financially, starring the repository or sharing Tulasi with other Linux users helps just as much.

---

## License

Licensed under [CC BY-NC-SA 4.0](https://creativecommons.org/licenses/by-nc-sa/4.0/). Free to use and share for non-commercial purposes with attribution.

Designed with care by **Lee** ([Shringar Studio](https://github.com/ShringarStudio))  
Contact: `notonlinux@gmail.com`
