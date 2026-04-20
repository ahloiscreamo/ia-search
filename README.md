# ia-search
An interactive terminal browser and downloader for the **Internet Archive**. Built with `fzf` and the `ia` tool to search, play, and download media without leaving the shell.

---
<img width="1920" height="1080" alt="Screenshot from 2026-04-20 21-01-45" src="https://github.com/user-attachments/assets/08fb5412-7331-4da3-b10c-facd9879ad99" />
<img width="1920" height="1080" alt="Screenshot from 2026-04-20 21-54-21" src="https://github.com/user-attachments/assets/8c3d2449-f06f-4486-9be0-0e413b75739e" />
<img width="1920" height="1080" alt="Screenshot from 2026-04-20 21-56-46" src="https://github.com/user-attachments/assets/6b104475-2284-4a93-996a-829e7a0127a1" />

---
## Features
* **Interactive Menus**: Uses `fzf` to navigate collections and search results with pagination.
* **Search Options**:
  * **History & Examples**: The prompt displays your recent queries and useful example searches.
  * **Exact Search**: Press `Ctrl+E` to search exactly what you typed, ignoring history suggestions.
  * **Help Guide**: Built-in `--help` command lists all searchable fields like `mediatype` and `creator`.
  * **Sub-Searching**: Narrow down large collections or results without reloading the whole list.
* **Media & Previews**:
  * **File Previews**: View files with sizes within an item before playing/downloading.
  * **Subtitle Support**: Automatically finds and loads matching `.srt`, `.ass`, or `.vtt` files in `mpv`.
  * **Integrated Players**: Opens video/audio in `mpv`, images in `nsxiv`/`imv`, PDFs and ePubs in `zathura`, and text files in `vim`.
  * **Gallery Mode**: Open all images in an item at once in your image viewer with `[Open all images]`.
* **Functional Tools**:
  * **Pagination**: Results load in pages to keep the interface fast and responsive.
  * **Caching**: Search results and collection pages are cached indefinitely. Use `[Refresh page]` to force a reload.
  * **Downloads**: Pull videos with `yt-dlp` or any specific file using `curl`.
  * **Customizable**: Change your default players and icons at the top of the script.

---
## Installation
1. Install the dependencies listed below.
2. Move the script to your `$PATH`:
```bash
cp ia-search ~/.local/bin/
```
3. Make it executable:
```bash
chmod +x ~/.local/bin/ia-search
```

---
## Usage
Run the script:
```bash
ia-search
```
Check the search syntax guide:
```bash
ia-search --help
```

### Browsing
Pick a collection from the main menu or select **`[Search all collections]`** to start a query. The search prompt saves your history so you can quickly re-run previous searches or pick from the examples.

### Keybindings
| Key | Action |
| --- | --- |
| `Enter` | Select highlighted item |
| `ESC` | Go back / exit |
| `Ctrl+E` | Submit exact typed query (search prompt only) |

---
## Search Guide
Queries use the standard `field:value` syntax. Combine terms with `AND`, `OR`, or `NOT`.

#### Common Fields
| Field | Description | Example |
| --- | --- | --- |
| `mediatype` | Content category | `mediatype:movies` |
| `title` | Work title | `title:"Floating weeds"` |
| `creator` | Author/Director | `creator:"yasujiro ozu"` |
| `uploader` | Account that uploaded the item | `uploader:someuser` |
| `subject` | Keywords/Themes | `subject:"japanese cinema"` |
| `collection` | Specific collection | `collection:vhsmovies` |
| `date` | Publication year | `date:[1980 TO 1989]` |
| `language` | ISO 639-2 code | `language:jpn` |
| `identifier` | Unique item ID | `identifier:openlibrary` |
| `format` | File format | `format:pdf` |

#### Mediatypes
* `texts` (Books/Documents)
* `audio` (Music/Podcasts)
* `movies` (Video/Films)
* `software` (Games/Apps)
* `image` (Photos/Art)
* `data` (Datasets)
* `web` (Web archives)

#### Language Codes (ISO 639-2)
* **English**: `eng`
* **Japanese**: `jpn`
* **French**: `fre`
* **German**: `ger`
* **Chinese**: `zho`
* **Spanish**: `spa`
* **Korean**: `kor`

## Examples

#### Finding Movies by Director
```bash
mediatype:movies AND creator:"yasujiro ozu"
mediatype:movies AND creator:"wong kar wai"
mediatype:movies AND creator:"edward yang"
```

#### Finding Movies by Language
```bash
mediatype:movies AND language:jpn
mediatype:movies AND language:chi
```

#### Finding Japanese Magazines
```bash
mediatype:texts AND language:jpn AND subject:magazine
collection:magazine_rack AND language:jpn
```

#### Finding Image Galleries
```bash
mediatype:image AND subject:magazine
subject:gravure AND mediatype:image
```

#### Finding by Collection
```bash
collection:anime_miscellaneous
collection:pub_playboy
collection:magazine_rack
```

#### Finding Audio
```bash
mediatype:audio AND subject:album
mediatype:audio AND language:jpn
```

#### Finding Texts
```bash
mediatype:texts AND subject:linux
mediatype:texts AND language:jpn
```

#### Finding by Uploader
```bash
uploader:someuser
```
---
## Dependencies
### Core
* `ia` (Internet Archive CLI) — Metadata and searching.
* `fzf` — Interactive menus and filtering.
* `jq` — JSON parsing.
* `curl` / `pv` — Downloading and progress bars.
* `python3` — URL encoding.

### Media Viewers
* `mpv` — Video and audio playback.
* `nsxiv` — Image viewing (X11). Alternative: `imv` (Wayland).
* `zathura` — PDF and ePub reading.
* `vim` — Text file viewing.
* `yt-dlp` — Video downloads.

---
## Configuration
You can change the default apps by editing the variables at the top of the script:
```bash
VIDEO_PLAYER="mpv"
AUDIO_PLAYER="mpv"
IMAGE_VIEWER="nsxiv"   # X11 — use "imv" for Wayland
PDF_VIEWER="zathura"
EPUB_VIEWER="zathura"
TEXT_VIEWER="vim"
VIDEO_DOWNLOADER="yt-dlp"
```

To use emoji instead of Nerd Font icons, set:
```bash
USE_NERD_ICONS="false"
```
> **Note:** The default icons require a [Nerd Font](https://www.nerdfonts.com/) to display correctly. If you see missing characters, either install a Nerd Font or set `USE_NERD_ICONS="false"`.

---
## Notes
* **Video loading slow?** This is normal — playback speed depends on Internet Archive's server speed, not your connection.
* Search results and previews are cached in `~/.cache/ia-search/`. Use the `[Refresh page]` option in any menu to force a fresh fetch.
