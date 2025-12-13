# 🎬 ia-search

**ia-search** is an interactive terminal browser and downloader for the **Internet Archive**, powered by `fzf` and `ia`. It lets you **browse**, **search**, **play**, and **download** media directly from your terminal.

---

## ✨ Features

-   **Interactive Menus**: Navigate collections, search results, and files using `fzf` with full cycling (scrolling loops around).
-   **Powerful Search**:
    *   **Search History & Examples**: The search prompt displays your recent queries and a list of useful examples to get you started.
    *   **Comprehensive Help**: A built-in `--help` command provides a detailed guide on all available search fields (`mediatype`, `subject`, `creator`, etc.) and syntax.
    *   **Sub-Searching**: Efficiently drill down into large collections or broad queries without loading massive lists.
-   **Smart Previews & Media Handling**:
    *   **Live Previews**: See a list of files within an item as you browse. Previews are now smarter and will re-fetch if they fail to load.
    *   **Robust Subtitle Matching**: Automatically finds and loads the best matching subtitle file (`.srt`, `.ass`, `.vtt`) for videos, even with complex filenames.
    *   **Multi-Format Player**: Plays videos/audio (`mpv`), views images (`nsxiv`), and opens PDFs (`zathura`) directly.
-   **Robust & User-Friendly**:
    *   **Paginated Results**: All results are loaded in pages for a fast and responsive experience.
    *   **Clear Error Handling**: The script now clearly distinguishes between a failed search (e.g., network error) and a search with no results.
    *   **Downloader Integration**: Download videos with `yt-dlp` or any other file with `curl`.
    *   **Customizable**: Easily change default viewers, icons, and colors by editing variables at the top of the script.

---

## 🔧 Installation

1.  Make sure you have all the dependencies installed (see list below).
2.  Save the script as `ia-search` in a directory in your `$PATH` (e.g., `~/.local/bin/`).
3.  Make it executable: `chmod +x ~/.local/bin/ia-search`

---

## 🧭 Usage

### Running The Script
Simply run the script from your terminal:
```bash
ia-search
```

### Getting Help
For a detailed guide on search syntax, fields, and mediatypes, use the `--help` flag:
```bash
ia-search --help
```

### Main Menu & Searching
The script starts with a list of top collections. From here you can:
-   **Select a collection** to browse its contents.
-   Select **`[🔍 Search all collections]`** to open the search prompt.

The search prompt is now powered by your history. It shows:
-   Your most recent unique searches.
-   A list of helpful example queries.

You can select an entry from the list or just start typing to create a new query. Your new searches will be saved for the next session.

---

## 🔬 Search Guide

The search prompt accepts standard Internet Archive advanced search queries.

-   **Syntax**: `field:value`
-   **Combining Terms**: Use `AND`, `OR`, `NOT` (e.g., `mediatype:movies AND language:jpn`)

#### Common Searchable Fields

| Field | Description | Example |
| :--- | :--- | :--- |
| `mediatype` | The primary content category. | `mediatype:movies` |
| `title` | The title of the work. | `title:"Floating weeds"` |
| `creator` | The author, director, artist, etc. | `creator:"yasujiro ozu"` |
| `subject` | Keywords, topics, or themes. | `subject:"japanese cinema"` |
| `collection` | The collection the item belongs to. | `collection:vhsmovies` |
| `date` | The publication date. | `date:[1980 TO 1989]` |
| `language` | The language of the content (ISO 639-2 code). | `language:jpn` |

#### Common `mediatype` Values
-   `texts` (Books, documents)
-   `audio` (Music, podcasts)
-   `movies` (Videos, films)
-   `software` (Games, applications)
-   `image` (Photos, artwork)

#### Common `language` Codes (ISO 639-2)
-   **English**: `eng`
-   **Japanese**: `jpn`
-   **French**: `fre`
-   **German**: `ger`
-   **Chinese**: `zho`

---

## ⚙️ Dependencies

-   `ia` (Internet Archive CLI)
-   `fzf`
-   `jq`
-   `pv`
-   `mpv`
-   `nsxiv` (or your configured image viewer)
-   `zathura` (or your configured PDF viewer)
-   `yt-dlp`
-   `curl`
-   `python3`

---

## 🧩 Configuration

You can easily change the default media players by editing the variables at the top of the script:
```bash
VIDEO_PLAYER="mpv"
AUDIO_PLAYER="mpv"
IMAGE_VIEWER="nsxiv"
PDF_VIEWER="zathura"
VIDEO_DOWNLOADER="yt-dlp"
```
