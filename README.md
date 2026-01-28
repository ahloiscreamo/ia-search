# ia-search

An interactive terminal browser and downloader for the **Internet Archive**. Built with `fzf` and the `ia` tool to search, play, and download media without leaving the shell.

---
<img width="1460" height="934" alt="Screenshot from 2026-01-26 22-08-43" src="https://github.com/user-attachments/assets/f14f9eb7-b4b6-4bf3-8551-0be599b84683" />

<img width="1460" height="934" alt="Screenshot from 2026-01-26 22-12-17" src="https://github.com/user-attachments/assets/aeca883f-8a93-4a8c-abb4-77ee6ef241d5" />

<img width="1460" height="934" alt="Screenshot from 2026-01-26 22-11-17" src="https://github.com/user-attachments/assets/7792cd32-d4a2-4c5c-96da-80977aca7260" />

---

## Features

* **Interactive Menus**: Uses `fzf` to navigate collections and search results with infinite scrolling.
* ** Search Options**:
* **History & Examples**: The prompt displays your recent queries and useful example searches.
* **Help Guide**: Built-in `--help` command lists all searchable fields like `mediatype` and `creator`.
* **Sub-Searching**: Narrow down large collections or results without reloading the whole list.


* **Media & Previews**:
* **File Previews**: View files within an item before playing/downloading. Auto-retries if a fetch fails.
* **Subtitle Support**: Automatically finds and loads matching `.srt`, `.ass`, or `.vtt` files in `mpv`.
* **Integrated Players**: Opens video/audio in `mpv`, images in `nsxiv`, and PDFs in `zathura`.


* **Functional Tools**:
* **Pagination**: Results load in pages to keep the interface fast and responsive.
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

Pick a collection from the main menu or select **`[🔍 Search all collections]`** to start a query. The search prompt saves your history so you can quickly re-run previous searches or pick from the examples.

---

## Search Guide

Queries use the standard `field:value` syntax. Combine terms with `AND`, `OR`, or `NOT`.

#### Common Fields

| Field | Description | Example |
| --- | --- | --- |
| `mediatype` | Content category | `mediatype:movies` |
| `title` | Work title | `title:"Floating weeds"` |
| `creator` | Author/Director | `creator:"yasujiro ozu"` |
| `subject` | Keywords/Themes | `subject:"japanese cinema"` |
| `collection` | Specific collection | `collection:vhsmovies` |
| `date` | Publication year | `date:[1980 TO 1989]` |
| `language` | ISO 639-2 code | `language:jpn` |

#### Mediatypes

* `texts` (Books/Documents)
* `audio` (Music/Podcasts)
* `movies` (Video/Films)
* `software` (Games/Apps)
* `image` (Photos/Art)

#### Language Codes (ISO 639-2)

* **English**: `eng`
* **Japanese**: `jpn`
* **French**: `fre`
* **German**: `ger`
* **Chinese**: `zho`

---

## Dependencies

### Core

* `ia` (Internet Archive CLI) — Metadata and searching.
* `fzf` — Interactive menus and filtering.
* `jq` — JSON parsing.
* `curl` / `pv` — Downloading and progress bars.
* `python3` — Logic and search history.

### Media Viewers (Optional)

* `mpv` — Video and audio playback.
* `nsxiv` — Image viewing.
* `zathura` — PDF reading.
* `yt-dlp` — For video downloads.

---

## Configuration

You can change the default apps by editing the variables at the top of the script:

```bash
VIDEO_PLAYER="mpv"
AUDIO_PLAYER="mpv"
IMAGE_VIEWER="nsxiv"
PDF_VIEWER="zathura"
VIDEO_DOWNLOADER="yt-dlp"

```
