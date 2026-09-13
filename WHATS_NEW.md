# What’s New in Tulasi: The Next-Gen Pixel Art Evolution

A comprehensive overview of architectural upgrades, performance optimizations, bug fixes, expanded coverage, and new theme editions across the Tulasi ecosystem.

---

## 1. The Vector Revolution: Moving from PNGs to Pure Optimized SVGs

Tulasi has completed its transition from static raster PNGs to fully scalable, resolution-independent SVGs across the entire collection.

* **Flawless Multi-Resolution Scaling:** Whether running on standard 1080p, 1440p, 4K UHD, or ultra-dense HiDPI laptop displays, icons scale cleanly with zero blurriness and zero pixel interpolation artifacts.
* **Compound Path Optimization:** Instead of cluttering the SVG DOM with hundreds of individual `<rect>` elements per pixel (which consumes excess RAM and slows down compositor rendering), contiguous same-color pixels are merged using 2D greedy rectilinear grouping into unified `<path>` elements (`M x y h w v h h -w z`).
* **Ultra-Lightweight Footprint:**
  * Node counts reduced by up to **85%**.
  * File sizes trimmed down to a lightweight **1–4 KB per master icon**.
  * Instant GTK icon cache generation (`gtk-update-icon-cache`) and butter-smooth dock / launcher scrolling.

---

## 2. Seam & Stitching Artifacts: Solved

Previous vector exports from tools like Figma and Inkscape suffered from fractional subpixel coordinates (e.g. `x="17.0933"` on a $3357 \times 3357$ canvas). At runtime, anti-aliasing engines in Dolphin, Nautilus, and KDE Plasma rendered micro-gaps and thin white/transparent seams between adjacent pixels and gradient blocks.

* **Exact 1:1 Integer Coordinates:** Every coordinate across all 150 master SVGs is strictly mapped to whole integers on a unified `viewBox="0 0 32 32"`.
* **Hardware Crisp Edges:** All master SVGs now enforce `shape-rendering="crispEdges"`, instructing graphics renderers to snap edges cleanly to physical display pixels without subpixel blurring.
* **Zero Alpha Leakage:** Eliminated fractional export opacities (such as Krita's brush anti-aliasing) to ensure 100% solid, crisp pixel art fills.
* **Deleted Stale Test Files:** Removed legacy `RED*` test assets (`REDmother-terminal.svg`, `Redmotheralacritty.svg`, etc.) that were cluttering previous builds.

---

## 3. Massive Icon Roster Expansion (150 Total Master Applications)

Tulasi now features **150 unique, handcrafted master applications** in `cow/` and `scalable/apps/`. Recent additions include:

* **🎨 Creative & Production:**
  * **Krita** (`mother-krita.svg`) — Digital painting & illustration
  * **Blender** (`motherblender.svg`) — 3D creation suite
  * **FreeCAD** (`motherfreecad.svg`) — Parametric 3D CAD modeler
  * **Identity** (`motheridentity.svg`) — Image comparison tool
  * **OpenRGB** (`mother-openrgb.svg`) — Open source RGB lighting control
  * **RStudio** (`mother-rstudio.svg`) — Data science IDE
  * **PhpStorm**, **Sublime Text**, **Sublime Merge**, **VSCodium**

* **🔒 Privacy, Security & Cloud:**
  * **Proton Pass** (`mother-protonpass.svg`) — End-to-end encrypted password manager
  * **Proton Mail** (`mother-protonmail.svg`) — Secure private email
  * **Proton VPN** (`mother-protonvpn.svg`) — Encrypted VPN client
  * **Surfshark VPN** (`mother-surfshark.svg`) — Fast secure VPN
  * **Mullvad VPN** (`mother-mullvad-vpn.svg`) — Privacy-focused VPN
  * **Bitwarden** (`mother-bitwarden.svg`) — Open-source password manager
  * **Tuta Mail** (`mother-tutanota.svg`) — Encrypted mailbox
  * **Microsoft OneDrive** (`mother-microsoftonedrive.svg`)

* **💬 Communication & Social:**
  * **Telegram Desktop** (`mother-telegram.svg`) — Fast messaging client
  * **Teams for Linux** (`mother-teams.svg`) — Microsoft Teams desktop wrapper
  * **OpenWhisper** (`mother-openwhisper.svg`) — Whisper transcription / speech recognition
  * **Beeper** (`mother-beeper.svg`) — All-in-one chat client
  * **WhatsApp** (`mother-whatsapp.svg`)

* **🎵 Multimedia & Entertainment:**
  * **Strawberry Music Player** (`mother-strawberry.svg`) — Audiophile music player
  * **Lollypop** (`mother-lollypop.svg`) — Modern GNOME audio player
  * **OBS Studio** (`motherobs.svg`) — Screen recording & streaming
  * **Haruna** (`motherharuna.svg`) — Sleek Qt/mpv video player
  * **Gwenview** (`mothergwen_view.svg`) — KDE image viewer

* **📊 Office, Documents & System Management:**
  * **Microsoft 365 Suite:** Word (`mother-microsoftword.svg`), Excel (`mother-microsoftexcel.svg`), PowerPoint (`mother-microsoftpowerpoint.svg`)
  * **LibreOffice Math** (`mother-libreoffice-math.svg`)
  * **Virtualization:** Oracle VirtualBox (`mother-virtualbox.svg`), GNOME Boxes (`mother-gnome-boxes.svg`), Virtual Machine Manager (`mother-virt-manager.svg`)
  * **Web & Utilities:** Floorp Browser (`mother-floorp.svg`), AppManager (`mother-appmanager.svg`), GNOME Terminal (`mother-gnome-terminal.svg`), Meld, Micro, Baobab, Evince, File Roller, Upscayl, Lutris.

---

## 4. Expanded Symlink Network: Over 1,000+ Aliases, 0 Broken Links

To ensure icons immediately bind to applications regardless of packaging format or Linux distribution:

* **Complete Multi-Packaging Coverage:** Aliases generated for **Flatpak reverse-DNS IDs** (e.g. `me.proton.Pass`, `org.kde.krita`, `org.gnome.Boxes`), **AppImage** titles (`appimagekit-*`), **Snap** names (`snap.telegram-desktop.*`), and **native distro package binaries** (`calligrakrita`, `teams-for-linux`, `protonvpn-gui`, etc.).
* **Papirus Cross-Reference Database:** Integrated against real-world Linux desktop entries to capture alternate branding and historical application IDs.
* **100% Integrity:**
  * **Tulasi:** 1,095 active symlinks (**0 broken**).
  * **Tulasi-Monochromatic:** 1,095 active symlinks (**0 broken**).
  * **gnome:** 922 active symlinks (**0 broken**).

---

## 5. Desktop Favicons & UI Polish

* **Places Glyphs Fixed:** Resolved symbolic icon mismatch where *Downloads*, *Pictures*, and *Videos* folders were erroneously inheriting generic folder icons instead of their intended specialized symbolic glyphs.
* **System Actions, Status & Devices:** Full suite of places, actions, status, and device SVGs are now part of the primary Tulasi theme, giving desktop environments like KDE Plasma a coherent, pixel-perfect aesthetic from app icons down to file manager sidebars.
* **Standardized Terminal:** Upgraded generic terminal representations across all themes to `mother-gnome-terminal.svg` for cleaner desktop consistency.

---

## 6. The Dedicated GNOME Edition (`Tulasi-Gnome` / `gnome`)

For users on GNOME, Cosmic, or elementary OS who want Tulasi’s pixel art app icons without overriding GNOME’s native system shell chrome:

* **Apps-Only Focus:** Contains all 150 master application icons and their 922 symlinks, while omitting system actions, places, and status folders.
* **Native Adwaita Fallback:** Configured in `index.theme` to inherit `Inherits=Adwaita,hicolor`.
* **Zero UI Clutter:** GNOME Shell top bar icons, quick settings, and native system file dialogues retain their stock Adwaita aesthetics while your app drawer and dash glow with handcrafted pixel art.

---

## 7. Streamlined Contributor Workflow

Adding your own application icon or contributing back to Tulasi is now simpler and more structured:

1. **Design on a 32×32 Grid:**
   * Create your icon within a $32 \times 32$ pixel boundary using a consistent visual grammar and solid palette.
2. **Auto-Optimize via Compound Path Merger:**
   * Run the repository conversion helper to merge contiguous same-color pixels into compound `<path>` elements with `shape-rendering="crispEdges"` and exact integer coordinates.
3. **Deploy to `cow/` & `scalable/apps/`:**
   * Save the master file as `mother-<appname>.svg` in `cow/` and link or copy it to `scalable/apps/`.
4. **Link Desktop Aliases & Update Cache:**
   * Create symlinks for common desktop launcher names (Flatpak ID, binary name, etc.).
   * Run `gtk-update-icon-cache -f ~/.local/share/icons/Tulasi` to immediately see it live in your system dock.

---

## 8. "One More Thing..." — Introducing `tulasi.Noir`

```
   ┌─────────────────────────────────────────────────────────────┐
   │                                                             │
   │                        tulasi.Noir                          │
   │                                                             │
   │           Deep Black. Sharp Contours. Pure Focus.           │
   │                                                             │
   └─────────────────────────────────────────────────────────────┘
```

For those who believe less is everything.

Introducing **tulasi.Noir** (formerly Tulasi-Monochromatic). A completely reimagined monochromatic edition crafted for dark rooms, OLED panels, and distraction-free desktop setups.

* **Perceptual Luminance Mapping:** We didn't just strip saturation. Every single color value across all 150 master icons is mathematically re-calculated using ITU-R BT.601 perceptual luminance ($Y = 0.299R + 0.587G + 0.114B$). Deep tones stay rich, highlights punch through, and app silhouettes remain instantly recognizable at a glance.
* **Dynamic Accent Integration:** Fully integrated with KDE Plasma's `ColorScheme-Text`, meaning system glyphs naturally inherit your desktop theme's custom highlights.
* **OLED-Grade Stealth:** Designed to melt seamlessly into minimalist tiling window managers (Hyprland, Sway, i3) and darkened KDE/GNOME workflows.

Available now alongside Tulasi. Simply select **tulasi.Noir** in your appearance settings.
