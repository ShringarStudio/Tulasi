#!/bin/bash

# Root directory of your icon theme
THEME_DIR="/home/nuclear/Documents/Arpana"
COW_DIR="$THEME_DIR/cow"

cd "$THEME_DIR" || exit 1

# List of target size directories
SIZES=("16x16" "24x24" "32x32" "48x48" "64x64" "128x128" "256x256" "512x512")

echo "=== 1. Ensuring clean target folders ==="
for size in "${SIZES[@]}"; do
    rm -rf "$size/apps"
    mkdir -p "$size/apps"
done
mkdir -p "places/symbolic"

if [ ! -d "$COW_DIR" ]; then
    echo "Error: Directory '$COW_DIR' not found!"
    exit 1
fi

if ! command -v rsvg-convert &> /dev/null; then
    echo "Error: rsvg-convert is not installed! Install the 'librsvg' package."
    exit 1
fi

if command -v magick &> /dev/null; then
    IMG_CMD="magick"
elif command -v convert &> /dev/null; then
    IMG_CMD="convert"
else
    echo "Error: ImageMagick is not installed!"
    exit 1
fi

echo "=== 2. Crash-Free Hybrid PNG Generation ==="
for master in "$COW_DIR"/*.svg; do
    [ -f "$master" ] && [ ! -L "$master" ] || continue

    base_name=$(basename "$master" .svg)
    png_filename="${base_name}.png"
    tmp_master="/tmp/${base_name}_temp.png"

    echo "  -> Processing: $base_name"

    # Step A: Safely render a 512px master using rsvg (bypasses Inkscape crash)
    rsvg-convert -w 512 -h 512 "$master" -o "$tmp_master"

    # Step B: Use your preferred -scale logic to snap the pixels to smaller grids
    for size in "${SIZES[@]}"; do
        target_file="$size/apps/$png_filename"
        dim=$(echo "$size" | cut -d'x' -f1)

        # If it's 512, just copy the temp file. Otherwise, scale it sharply.
        if [ "$dim" -eq 512 ]; then
            cp "$tmp_master" "$target_file"
        else
            $IMG_CMD -background none "$tmp_master" -scale "${dim}x${dim}!" "$target_file"
        fi
    done

    # Clean up the temporary file
    rm -f "$tmp_master"
done

echo "=== 3. Generating Link Shortcuts ==="
MAPS=(
"mother-affinity.png:affinity.png:Affinity.png:affinity-photo.png:affinity-designer.png:affinity-publisher.png:appimagekit-affinity-photo.png:appimagekit-affinity-designer.png:appimagekit-affinity-publisher.png:appimagekit-affinity.png:Affinity-photo.png:Affinity-designer.png:Affinity-publisher.png"
"mother-akregator.png:org.kde.akregator.png:akregator.png:Akregator.png"
"motheralacritty.png:alacritty.png:org.alacritty.Alacritty.png:Alacritty.png"
"mother-ark.png:org.kde.ark.png:ark.png:Ark.png"
"mother-aseprite.png:aseprite.png:org.aseprite.Aseprite.png:Aseprite.png:org.aseprite.aseprite.png"
"motherbaobab.png:org.gnome.baobab.png:baobab.png:gnome-disk-usage.png:Baobab.png"
"mother-bauh.png:bauh.png:Bauh.png"
"mother-benjamimgois.goverlay.png:io.github.benjamimgois.goverlay.png:goverlay.png:GOverlay.png:io.github.benjamimgois.GOverlay.png"
"motherblender.png:blender.png:org.blender.Blender.png:Blender.png:blender-3.6.png:blender-4.0.png"
"mother-brave-desktop.png:brave-browser.png:com.brave.Browser.png:brave.png:brave-browser-stable.png:Brave-browser.png:com.brave.browser.png:brave_brave.png:brave-browser-beta.png:brave-browser-nightly.png"
"mother-btop++.png:btop.png:Btop.png:btop++.png"
"mother-btrfs.png:btrfs-assistant.png:Btrfs-assistant.png:btrfs-assistant-launcher.png"
"mother-camera-photo.png:camera-photo.png:org.gnome.Camera.png:org.gnome.Snapshot.png:snapshot.png:org.gnome.snapshot.png:applets-screenshooter.png:camera.png"
"mother-chrome.png:google-chrome.png:com.google.Chrome.png:google-chrome-stable.png:Google-chrome.png:google-chrome-beta.png:google-chrome-unstable.png"
"mother-cmakesetup.png:cmake-gui.png:cmake.png:org.cmake.cmake-gui.png:CMake.png:CMakeSetup.png"
"mother-code.png:code.png:com.visualstudio.code.png:vscode.png:Code.png:visual-studio-code.png:code-oss.png:com.visualstudio.code.oss.png"
"mother-discordapp.discord.png:com.discordapp.Discord.png:discord.png:Discord.png:discord-canary.png:discord-ptb.png:discord_discord.png:com.discordapp.DiscordCanary.png:com.discordapp.DiscordPTB.png:WebCord.png"
"mother-discover.png:org.kde.discover.png:discover.png:Discover.png:plasmadiscover.png"
"mother-easy_effects.png:easyeffects.png:com.github.wwmm.easyeffects.png:Easyeffects.png:com.github.wwmm.Easyeffects.png"
"mother-eclipseide.png:eclipse.png:org.eclipse.Committers.png:org.eclipse.Platform.png:Eclipse.png"
"mother-elisa.png:org.kde.elisa.png:elisa.png:Elisa.png"
"motheremoji.png:org.kde.plasma.emojier.png:plasma.emojier.png:emojier.png:Emojier.png:emoji-picker.png:org.kde.plasma.emoji.png"
"motherevince.png:evince.png:org.gnome.Evince.png:gnome-evince.png:Evince.png"
"mother-fabrialberio.pinapp.png:io.github.fabrialberio.PinApp.png:pinapp.png:PinApp.png"
"mother-faugus_launcher.png:faugus-launcher.png:Faugus-launcher.png:faugus.png:appimagekit-faugus-launcher.png"
"mother-figmalinux.png:figma-linux.png:io.github.Figma_Linux.figma-linux.png:figma.png:Figma.png:appimagekit-figma-linux.png"
"motherfileroller.png:file-roller.png:org.gnome.FileRoller.png:file-roller-stable.png:File-roller.png"
"mother-filezilla.png:filezilla.png:org.filezillaproject.Filezilla.png:FileZilla.png"
"mother-firefox.png:firefox.png:org.mozilla.firefox.png:org.mozilla.Firefox.png:firefox-esr.png:Firefox.png:firefox-developer-edition.png:firefox-nightly.png:firefox-beta.png:firefox_firefox.png:firefox-esr-wayland.png"
"mother-firewallgui.png:firewall-config.png:Firewall-config.png:firewalld.png:firewalld-applet.png:system-config-firewall.png"
"motherfreecad.png:freecad.png:org.freecadweb.FreeCAD.png:FreeCAD.png:org.freecad.FreeCAD.png:freecad-daily.png:appimagekit-freecad.png"
"mothergnomecalculator.png:org.gnome.Calculator.png:gnome-calculator.png:Gnome-calculator.png:calculator.png"
"mother-gnomeextensions.png:org.gnome.Extensions.png:gnome-extensions.png:extension.png:Extensions.png"
"mother-gnome_notes.png:org.gnome.Notes.png:bijiben.png:notes.png:org.gnome.notes.png:Notes.png"
"mother-gnome-papers.png:org.gnome.Papers.png:papers.png:org.gnome.papers.png:Papers.png"
"mother-gnome-secrets.png:org.gnome.World.Secrets.png:gnome-secrets.png:secrets.png:Secrets.png"
"mother-gnome-showtime.png:org.gnome.Showtime.png:showtime.png:Showtime.png"
"mother-gnome-simplescan.png:org.gnome.SimpleScan.png:simple-scan.png:scanner.png:Simple-scan.png"
"mother-gnome-systemmonitor.png:org.gnome.SystemMonitor.png:gnome-system-monitor.png:system-monitor.png:System-monitor.png"
"mother-gnome-timeshift.png:timeshift.png:org.timeshift.Timeshift.png:timeshift-gtk.png:Timeshift-gtk.png"
"mother-gnome-tweaks.png:org.gnome.tweaks.png:gnome-tweaks.png:org.gnome.Tweaks.png:Tweaks.png"
"mother-godot.png:godot.png:org.godotengine.Godot.png:Godot.png:org.godotengine.Godot3.png:org.godotengine.Godot4.png:godot-mono.png"
"mother-googleantigravity.png:google-chrome.png:com.google.Chrome.png:google-chrome-stable.png:Google-chrome.png:google-chrome-beta.png:google-chrome-unstable.png"
"mothergwen_view.png:org.kde.gwenview.png:gwenview.png:Gwenview.png"
"motherharuna.png:org.kde.haruna.png:haruna.png:Haruna.png"
"motherhelium.png:helium.png:net.imput.helium.png:helium-browser.png:Helium_Browser.png:Helium.png:appimagekit-helium.png"
"mother-heroicgamelauncher.png:heroic.png:com.heroicgameslauncher.hgl.png:Heroic.png:appimagekit-heroic.png"
"mother-htop.png:htop.png:io.github.htop.htop.png:Htop.png"
"motheridentity.png:org.gnome.World.Identity.png:identity.png:Identity.png"
"mother-infocenter.png:org.kde.kinfocenter.png:kinfocenter.png:Kinfocenter.png:hwinfo.png"
"mother-intellij.png:intellij-idea.png:intellij-idea-ultimate.png:intellij-idea-community.png:idea.png:com.jetbrains.IntelliJ-IDEA-Community.png:com.jetbrains.IntelliJ-IDEA-Ultimate.png:jetbrains-idea.png:jetbrains-idea-ce.png:Idea.png"
"mother-javaopenjdk26.png:java.png:openjdk.png:java-openjdk.png:openjdk-26.png:java-11-openjdk.png:java-17-openjdk.png:java-21-openjdk.png"
"mother-joplin.png:joplin.png:net.cozic.joplin_desktop.png:joplin-desktop.png:Joplin.png:appimagekit-joplin.png"
"mother-kalk.png:org.kde.kalk.png:kalk.png:Kalk.png"
"mother-kate.png:kate.png:org.kde.kate.png:Kate.png"
"mother-kcalc.png:org.kde.kcalc.png:kcalc.png:Kcalc.png:utilities-calculator.png:accessories-calculator.png"
"mother-kclock.png:org.kde.kclock.png:kclock.png:Kclock.png"
"mother-kde-arianna.png:org.kde.arianna.png:arianna.png:Arianna.png"
"mother-kde-audex.png:org.kde.audex.png:audex.png:Audex.png"
"mother-kde-dolphin.png:org.kde.dolphin.png:dolphin.png:Dolphin.png:system-file-manager.png:folder.png"
"mother-kdenlive.png:org.kde.kdenlive.png:kdenlive.png:Kdenlive.png:org.kde.kdenlive.kdenlive.png"
"mother-kdepartitionmanager.png:org.kde.partitionmanager.png:partitionmanager.png:Partitionmanager.png"
"mother-kde_settings.png:systemsettings.png:org.kde.systemsettings.png:Systemsettings.png:systemsettings5.png:org.gnome.Settings.png:gnome-control-center.png:org.gnome.settings.png:preferences-system.png"
"mother-kdewallet.png:org.kde.kwalletmanager5.png:kwalletmanager.png:kwalletmanager5.png:Kwalletmanager.png:kwalletmanager-kwalletd.png"
"mother-khelpcenter.png:org.kde.khelpcenter.png:khelpcenter.png:Khelpcenter.png"
"mother-kitty.png:kitty.png:org.valdikss.kitty.png:Kitty.png"
"mother-kontrast.png:org.kde.kontrast.png:kontrast.png:Kontrast.png"
"mother-krecorder.png:org.kde.krecorder.png:krecorder.png:Krecorder.png"
"mother-kvantam.png:kvantummanager.png:kvantum.png:Kvantummanager.png:Kvantum.png"
"mother-kweather.png:org.kde.kweather.png:kweather.png:Kweather.png:weather.png"
"mother-librewolf.png:librewolf.png:io.gitlab.librewolf-community.LibreWolf.png:LibreWolf.png:io.gitlab.librewolf_community.librewolf.png:appimagekit-librewolf.png"
"mother-lm_studio.png:lm-studio.png:lm_studio.png:LM_Studio.png:appimagekit-lm-studio.png:lmstudio.png"
"mother-localsend_app.png:org.localsend.localsend_app.png:localsend.png:localsend_app.png:Localsend.png:org.localsend.LocalsendApp.png"
"motherlutrus.png:lutris.png:net.lutris.Lutris.png:Lutris.png:lutris_lutris.png"
"mothermalcontent.png:org.freedesktop.MalcontentControl.png:malcontent-control.png:Malcontent-control.png"
"mother-mattjakeman.extensionmanager.png:com.mattjakeman.ExtensionManager.png:extension-manager.png:ExtensionManager.png"
"mothermeld.png:meld.png:org.gnome.Meld.png:Meld.png"
"mothermicro.png:micro.png:io.github.zyedidia.micro.png:micro-text-editor.png:Micro.png"
"mother-minecraft.png:minecraft.png:minecraft-launcher.png:com.mojang.Minecraft.png:Minecraft.png"
"mother-mitchellh.ghostty.png:com.mitchellh.ghostty.png:ghostty.png:Ghostty.png:com.mitchellh.Ghostty.png"
"mother-mpv.png:mpv.png:io.mpv.Mpv.png:Mpv.png:io.mpv.mpv.png"
"mother-ms_edge.png:microsoft-edge.png:com.microsoft.Edge.png:microsoft-edge-stable.png:Microsoft-edge.png"
"mothernautilus.png:org.gnome.Nautilus.png:nautilus.png:system-file-manager.png:Nautilus.png"
"mother-nvidiasettings.png:nvidia-settings.png:nvidia.png:com.nvidia.settings.png:Nvidia-settings.png"
"motherobs.png:com.obsproject.Studio.png:obs-studio.png:obs.png:obs-studio_obs-studio.png:obs-studio-wayland.png:obs-studio-x11.png:OBS.png"
"mother-obsidian.png:obsidian.png:md.obsidian.Obsidian.png:Obsidian.png:appimagekit-obsidian.png:obsidian_obsidian.png"
"mother-prof18.feedflow.png:com.prof18.feedflow.png:feedflow.png:FeedFlow.png:com.prof18.FeedFlow.png"
"mother-pureref.png:pureref.png:PureRef.png:com.pureref.PureRef.png:appimagekit-pureref.png"
"mother-qbittorrent.png:qbittorrent.png:org.qbittorrent.qBittorrent.png:qBittorrent.png:org.qbittorrent.qbittorrent.png"
"mother-qgis.png:qgis.png:org.qgis.qgis.png:QGIS.png:qgis-desktop.png"
"mother-qv4l2.png:qv4l2.png:org.v4l2.qv4l2.png:Qv4l2.png"
"mother-qvidcap.png:qvidcap.png:org.v4l2.qvidcap.png:Qvidcap.png"
"mother-qwery.addwater.png:io.github.qwery.addwater.png:addwater.png:AddWater.png:io.github.qwery.AddWater.png"
"mother-rafaelmardojai.blanket.png:com.rafaelmardojai.Blanket.png:blanket.png:Blanket.png"
"mother-renderdoc.png:renderdoc.png:org.renderdoc.RenderDoc.png:qrenderdoc.png:RenderDoc.png"
"mother-scheduleext.png:scx-manager.png:scx_manager.png:Scx-manager.png:Scx_manager.png:scx.png:schedextgui.png:org.cachyos.scx-manager"
"mother-shelly.png:shelly.png:shellyalpm.png:Shelly.png"
"mother-shiftey.desktop.png:io.github.shiftey.Desktop.png:github-desktop.png:GitHubDesktop.png"
"mother-signal.png:signal-desktop.png:org.signal.Signal.png:Signal.png:signal_signal.png:appimagekit-signal-desktop.png"
"mother-spotify.png:spotify.png:com.spotify.Client.png:spotify-client.png:Spotify.png"
"mother-steam.svg.png:steam.png:com.valvesoftware.Steam.png:net.valvesoftware.Steam.png:Steam.png:steam-icon.png:steam_icon_480.png"
"mother-sublime_merge.png:sublime-merge.png:com.sublimemerge.App.png:Sublime_merge.png:sublime_merge.png"
"mother-systemmonitor.png:org.kde.plasma-systemmonitor.png:plasma-systemmonitor.png:Plasma-systemmonitor.png:ksysguard.png:org.kde.ksysguard.png:Ksysguard.png:utilities-system-monitor.png:system-monitor.png"
"mother-system-software-install.svg.png:system-software-install.png:org.gnome.Software.png:gnome-software.png:Gnome-software.png:gnome-software-local-file.png:pamac-manager.png:org.manjaro.pamac.manager.png:pamac-updater.png:update-notifier.png"
"mother-tauonmb.png:com.github.taiko2k.tauonmusicbox.png:tauonmusicbox.png:tauon-music-box.png:TauonMusicBox.png"
"mother-terminal.png:utilities-terminal.png:org.gnome.Terminal.png:gnome-terminal.png:terminal.png:Gnome-terminal.png:org.gnome.Console.png:com.gexperts.Tilix.png:konsole.png:org.kde.konsole.png:Konsole.png"
"mother-thunderbird.png:thunderbird.png:org.mozilla.Thunderbird.png:org.mozilla.thunderbird.png:Thunderbird.png"
"motherupscayl.png:org.upscayl.Upscayl.png:upscayl.png:upscayl-desktop.png:Upscayl.png:appimagekit-upscayl.png"
"mother-usebottles.bottles.png:com.usebottles.bottles.png:bottles.png:Bottles.png"
"mother-vencord.vesktop.png:dev.vencord.Vesktop.png:vesktop.png:Vesktop.png:appimagekit-vesktop.png"
"mother-viber.png:viber.png:com.viber.Viber.png:Viber.png:viberapp.png"
"mother-Vim.png:vim.png:gvim.png:Vim.png:Gvim.png:org.vim.Vim.png"
"mother-vivaldi.vivaldi.png:com.vivaldi.Vivaldi.png:vivaldi.png:vivaldi-stable.png:Vivaldi-stable.png:vivaldi-snapshot.png"
"mother-warp.png:warp-terminal.png:dev.warp.Warp.png:dev.warp.warp.png:Warp.png:warp.png"
"mother-wine.png:wine.png:org.winehq.wine.png:Wine.png:wine-winecfg.png:wine-uninstaller.png"
"mother-winetricks.png:winetricks.png:org.winehq.Winetricks.png:Winetricks.png"
"mother-yaak.png:yaak.png:app.yaak.Yaak.png:app.yaak.yaak.png:Yaak.png:appimagekit-yaak.png"
"mother-zededitor.png:zed.png:dev.zed.Zed.png:Zed.png"
"mother-zenbrowser.png:zen.png:zen-browser.png:io.github.zen_browser.zen.png:Zen.png:appimagekit-zen-browser.png:zen-alpha.png:app.zen_browser.zen.png"
)
for entry in "${MAPS[@]}"; do
    IFS=":" read -r -a aliases <<< "$entry"
    master_file="${aliases[0]}"

    for size in "${SIZES[@]}"; do
        apps_dir="$THEME_DIR/$size/apps"

        if [ -f "$apps_dir/$master_file" ]; then
            for ((i=1; i<${#aliases[@]}; i++)); do
                alias_name="${aliases[i]}"
                alias_clean="${alias_name//.svg/.png}"
                ln -sf "$master_file" "$apps_dir/$alias_clean"
            done
        else
            echo "  !! Missing master for symlinks: $apps_dir/$master_file"
        fi
    done
done

echo "=== 4. Cleaning system caches ==="
gtk-update-icon-cache -f -t ~/.local/share/icons/Arpana 2>/dev/null || true
rm -f ~/.cache/icon-cache.kcache
