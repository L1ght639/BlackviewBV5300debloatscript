# Blackview BV5300 Interactive ADB Debloater

A lightweight, interactive batch script designed for Windows to safely remove manufacturer bloatware and pre-installed system applications from the Blackview BV5300 via ADB (Android Debug Bridge) without requiring root access.

## Features

* **Environment & Connection Validation:** Automatically checks if ADB is available in your system path and verifies that your Android device is properly connected and authorized.
* **Interactive Menus:** Provides a clean console interface allowing you to choose between bulk cleanup options or granular, individual application selection.
* **Safe Non-Root Operation:** Utilizes standard user-space removal commands (`pm uninstall -k --user 0`) so system integrity remains intact.
* **Custom Console Styling:** Features dynamic color themes for an improved user experience.

## Prerequisites

1. **USB Debugging Enabled:** On your Blackview BV5300, go to **Settings > About phone**, tap **Build number** 7 times to enable Developer Options, then go back and enable **USB Debugging**.
2. **ADB Drivers:** Ensure you have proper Android USB drivers installed on your Windows PC and that you authorize the RSA fingerprint prompt on your phone when connecting.

## Usage

1. Download or clone this repository.
2. Connect your Blackview BV5300 to your PC via USB.
3. Run `BlackviewBV5300debloatscript.bat` (or your local batch menu script) from your command line or by double-clicking the file.
4. Follow the on-screen prompts to check your connection and select the applications you wish to debloat.

## Compatibility

While specifically optimized and tested for the Blackview BV5300, the script can be tested on other Blackview devices. Proceed with caution on alternative hardware.

## Support & Contributions

If you encounter any bugs, issues, or have feature requests, please submit them through the GitHub **Issues** tab.

Follow for updates on TikTok: **`l1ghtstechtok`**
