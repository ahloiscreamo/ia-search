## 🎬 ia-search

**ia-search** is an interactive terminal browser and downloader for the **Internet Archive**, powered by `fzf` and `ia-cli`.  
It lets you **browse**, **search**, **play**, and **download** media directly from your terminal — no web browser needed.

---

## 🖼️ Screenshots

<img width="1211" height="291" alt="Screenshot from 2025-11-02 02-48-13" src="https://github.com/user-attachments/assets/09d59ee5-fa7a-4ad6-bb83-b07f8c100c16" />
<p align="center"><i>🏁 Main menu showing cached top collections</i></p>

<img width="1211" height="981" alt="Screenshot from 2025-11-02 02-50-32" src="https://github.com/user-attachments/assets/7866a334-d7d5-404e-997d-6fd265753444" />
<p align="center"><i>🔍 Searching across all Internet Archive collections</i></p>

<img width="1211" height="981" alt="Screenshot from 2025-11-02 02-51-26" src="https://github.com/user-attachments/assets/ec66522b-f9b1-4eea-83fe-b35cd5d85b7e" />
<p align="center"><i>🎥 Selecting an item result with fuzzy finder</i></p>

<img width="1211" height="981" alt="Screenshot from 2025-11-02 02-51-53" src="https://github.com/user-attachments/assets/bb334663-311c-4b1e-bb65-d02aa435d189" />
<p align="center"><i>📂 Browsing files within a selected Internet Archive item</i></p>

<img width="1211" height="981" alt="Screenshot from 2025-11-02 02-52-41" src="https://github.com/user-attachments/assets/58dd67bc-6fbd-4fb1-815c-19854dd379e6" />
<p align="center"><i>🎬 Choosing to play or download the file</i></p>

<img width="1920" height="1080" alt="Screenshot from 2025-11-02 03-02-12" src="https://github.com/user-attachments/assets/ea8e9f6d-9f9b-4f03-a5eb-15035f7fddf2" />
<p align="center"><i>↩️ Smooth transition messages when returning between menus</i></p>

---

## ✨ Features

- 🧭 **Interactive collection browser** with pagination & local cache  
- 🔍 **Search across all collections** with fuzzy finder (`fzf`)  
- 🎥 **Play videos** & 🎧 **listen to audio** with `mpv`  
- 🖼️ **View images** instantly using `nsxiv`  
- 📄 **Open PDFs** seamlessly with `zathura`  
- ⬇️ **Download** any file directly from Internet Archive  
- 💬 **Subtitle auto-detection** for `.srt` / `.ass` files  
- 📊 **Progress bar** for downloads with `pv`  
- 🧹 **Temp cleanup** after image/PDF viewing  
- 🧠 **Smart Esc behavior** — no abrupt exits, smooth `↩️ Returning...` transitions between menus  

---

## ⚙️ Dependencies

| Tool | Purpose |
|------|----------|
| [`ia`](https://archive.org/services/docs/api/internetarchive/cli.html) | Internet Archive CLI |
| [`fzf`](https://github.com/junegunn/fzf) | Fuzzy finder |
| [`mpv`](https://mpv.io/) | Video & audio player |
| [`nsxiv`](https://github.com/nsxiv/nsxiv) | Image viewer |
| [`zathura`](https://pwmt.org/projects/zathura/) | PDF viewer |
| [`yt-dlp`](https://github.com/yt-dlp/yt-dlp) | Downloader for videos |
| [`curl`](https://curl.se/) | File downloader |
| [`pv`](https://www.ivarch.com/programs/pv.shtml) | Progress bar for streaming |

### 🧩 Optional Viewer Config

You can replace defaults easily in the script:
```bash
VIDEO_PLAYER="mpv"
AUDIO_PLAYER="mpv"
IMAGE_VIEWER="nsxiv"
PDF_VIEWER="zathura"
VIDEO_DOWNLOADER="yt-dlp"
````

---

## 🔧 Installation

1. Clone the repository:

   ```bash
   git clone https://github.com/ahloiscreamo/ia-search.git
   cd ia-search
   ```

2. Make it executable:

   ```bash
   chmod +x ia-search
   ```

3. (Optional) Move it to your `$PATH`:

   ```bash
   sudo mv ia-search /usr/local/bin/
   ```

4. Run it:

   ```bash
   ia-search
   ```

---

## 🧭 Navigation Overview

```
📚 Top Collections (cached)
 ├── [🔍 Search all collections]
 ├── [🔄 Refresh cache]
 ├── [➡️ Next page]
 └── [❌ Exit]
```

### 🔍 Search Mode

* Type a query → see instant results
* Press `ESC` → return to query input
* Press `ESC` again → return to main collections

### ↩️ Smooth Transitions

Each return step shows:

```
──────────────────────────────────────────────
↩️ Returning to previous menu...
```

with a short delay for clarity.

---

## 🧠 Example Queries

Search for Japanese movies:

```bash
mediatype:movies AND language:japanese
```

Public domain audio:

```bash
mediatype:audio AND subject:publicdomain
```

Scanned art books:

```bash
mediatype:image AND subject:art
```

Animation PDFs:

```bash
mediatype:texts AND subject:animation
```

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

---

## 💡 Tips

* Combine fields for precision:

  ```bash
  mediatype:movies AND (subject:tokyo OR subject:japan)
  ```
* Use `fzf` shortcuts to quickly filter results.
* ESC never exits abruptly — it gracefully returns to the previous view.

---

## 🧰 Example Flow

```
📚 Loading collections from cache...
🔍 Type search query (ESC to return to main) > mediatype:movies AND subject:japan
🔎 Searching for "mediatype:movies AND subject:japan" ...
📂 Fetching file list for: tokyo-streets-1990 ...
🎬 Choose action for file > ▶️ Play / ⬇️ Download
🎞️ Playing video...
──────────────────────────────────────────────
↩️ Returning to query...
```

---

