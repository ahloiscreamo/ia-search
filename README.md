# 🎬 ia-search

**ia-search** is an interactive terminal browser and downloader for the **Internet Archive**, powered by `fzf` and `ia`. It lets you **browse**, **search**, **play**, and **download** media directly from your terminal.

This script is designed to be compatible with older versions of `fzf` and various user shells (`bash`, `fish`, etc.) by using portable commands.

---

## ✨ Features

-   **Interactive Collection Browser**: Starts with a list of the top 500 most-downloaded collections, with pagination.
   <img width="1700" height="934" alt="01" src="https://github.com/user-attachments/assets/55d1942f-cfbb-47de-9df3-461e6505e486" />


-   **Efficient Sub-Searching**: Instead of loading huge lists, the `[🔍 Search all results]` option lets you perform a targeted search within a large collection or broad query.
-   **Paginated Results**: Both `search` and `browse` modes display results in pages of 30 items for faster loading and navigation.
   <img width="1700" height="934" alt="02" src="https://github.com/user-attachments/assets/d91c18e4-2590-46e3-8d82-de7d556156d8" />


-   **Loading Progress Bar**: When using `[🔍 Search all results]`, a progress bar shows the status of loading the item list.
-   **Live Item Preview**: While browsing items, a preview window on the right shows the first 20 files within the selected item.
-   **Multi-format Media Player**:
    -   🎥 Play videos & 🎧 listen to audio with `mpv`.
    -   🖼️ View images with `nsxiv`.
    -   📄 Open PDFs with `zathura`.
-   **Downloader Integration**: Download video files with `yt-dlp` or other files with `curl`.
-   **Robust and Portable**:
    -   Designed to work even with very old versions of `fzf`.
    -   Preview commands are wrapped to ensure compatibility with different user shells (like `fish`).
    -   Correctly handles filenames with spaces or special characters.

---

## ⚙️ Dependencies

| Tool                                                                         | Purpose                                   |
| ---------------------------------------------------------------------------- | ----------------------------------------- |
| [`ia`](https://archive.org/services/docs/api/internetarchive/cli.html)       | Internet Archive CLI (Core search/list)   |
| [`fzf`](https://github.com/junegunn/fzf)                                     | Fuzzy finder UI                           |
| [`jq`](https://jqlang.github.io/jq/)                                         | Parsing API JSON responses                |
| [`pv`](https://www.ivarch.com/programs/pv.shtml)                             | Progress bar for loading search results   |
| [`mpv`](https://mpv.io/)                                                     | Video & audio player                      |
| [`nsxiv`](https://github.com/nsxiv/nsxiv) or other image viewer              | Image viewer                              |
| [`zathura`](https://pwmt.org/projects/zathura/) or other PDF viewer          | PDF viewer                                |
| [`yt-dlp`](https://github.com/yt-dlp/yt-dlp)                                 | Downloader for videos                     |
| [`curl`](https://curl.se/)                                                   | File downloader / API fetcher             |


### Ubuntu dependencies
This project includes an Ubuntu installer that sets up all required tools.

```
chmod +x install_deps.sh
./install_deps.sh
```

This installs:

- system packages via apt
- Python packages inside a local virtual environment (.venv)

To use Python-based tools:

```
source .venv/bin/activate
```

---

### 🧩 Viewer Configuration

You can easily change the default media players by editing the variables at the top of the script:

`VIDEO_PLAYER="mpv"`
`AUDIO_PLAYER="mpv"`
`IMAGE_VIEWER="nsxiv"`
`PDF_VIEWER="zathura"`
`VIDEO_DOWNLOADER="yt-dlp"`

---

## 🔧 Installation

1.  Make sure you have all the dependencies installed.
2.  Save the script as `ia-search` in a directory in your `$PATH` (e.g., `~/.local/bin/`).
3.  Make it executable: `chmod +x ~/.local/bin/ia-search`
4.  Run it from anywhere: `ia-search`

---

## 🧭 Usage

### Main Menu

The script starts by showing a paginated list of the top 500 collections on the Internet Archive.

-   **Select a collection** to browse its items.
-   **`[🔍 Search all collections]`**: Opens a prompt to search the entire Internet Archive.
-   **`[🔄 Refresh cache]`**: Fetches the latest top 500 collections.
-   **`[➡️ Next page]` / `[⬅️ Previous page]`**: Navigate through the pages of collections.

### Browsing & Searching (Paginated View)

Whether you are browsing a collection or searching, the results are displayed in pages of 30.

-   **Select an item** to see its files and choose an action (play, download, etc.).
-   **`[➡️ Next page]` / `[⬅️ Previous page]`**: Navigate through the pages of items.
-   **`[🔍 Search all results]`**: This is the efficient way to find something in a very large list.
    1.  Select this option.
    2.  A new prompt will appear, allowing you to type a search term.
    3.  The script will perform a new, targeted search on the server, combining your original context (e.g., the collection) with your new search term.
    4.  A progress bar will show the loading of these new results.

---

## 🧠 Example Queries

When using the `[🔍 Search all collections]` option, you can use advanced Internet Archive search queries.

Search for Japanese movies:
`mediatype:movies AND language:japanese`

Public domain audio:
`mediatype:audio AND subject:publicdomain`

Scanned art books:
`mediatype:image AND subject:art`

Animation PDFs:
`mediatype:texts AND subject:animation`

---

## 📜 Common Search Fields

| Field        | Example                 | Description               |
| ------------ | ----------------------- | ------------------------- |
| `mediatype`  | `mediatype:movies`      | Type of content           |
| `title`      | `title:"Studio Ghibli"` | Search by title           |
| `creator`    | `creator:"NHK"`         | Filter by uploader/author |
| `subject`    | `subject:japan`         | Filter by tags            |
| `language`   | `language:japanese`     | Filter by language        |
| `year`       | `year:1990`             | Filter by year            |
| `collection` | `collection:anime`      | Specific IA collection    |
| `uploader`   | `uploader:xx@gmail.com` | Search by uploader        |
