<img width="1211" height="291" alt="Screenshot from 2025-11-02 02-48-13" src="https://github.com/user-attachments/assets/09d59ee5-fa7a-4ad6-bb83-b07f8c100c16" />

<img width="1211" height="981" alt="Screenshot from 2025-11-02 02-50-32" src="https://github.com/user-attachments/assets/7866a334-d7d5-404e-997d-6fd265753444" />

<img width="1211" height="981" alt="Screenshot from 2025-11-02 02-51-26" src="https://github.com/user-attachments/assets/ec66522b-f9b1-4eea-83fe-b35cd5d85b7e" />

<img width="1211" height="981" alt="Screenshot from 2025-11-02 02-51-53" src="https://github.com/user-attachments/assets/bb334663-311c-4b1e-bb65-d02aa435d189" />

<img width="1211" height="981" alt="Screenshot from 2025-11-02 02-52-41" src="https://github.com/user-attachments/assets/58dd67bc-6fbd-4fb1-815c-19854dd379e6" />

<img width="1920" height="1080" alt="Screenshot from 2025-11-02 03-02-12" src="https://github.com/user-attachments/assets/ea8e9f6d-9f9b-4f03-a5eb-15035f7fddf2" />


# 🎬 ia-search

**ia-search** is an interactive terminal browser and downloader for the **Internet Archive**, built with `fzf` and `ia-cli`.  
It lets you **search**, **preview**, **play**, and **download** movies, music, images, and documents — all from your terminal.

---

## ✨ Features

- 🔍 Search Internet Archive collections interactively  
- 🎥 Play videos and 🎧 audio directly with `mpv`  
- 🖼️ View images with `nsxiv` or your preferred image viewer  
- 📄 Open PDFs instantly with `zathura`  
- ⬇️ Download any file from Internet Archive  
- 💬 Subtitle auto-detection for videos (`.srt` / `.ass`)  
- 📊 Real progress bar for downloads using `pv`  
- 🧹 Temporary files auto-cleaned after viewing  

---

## ⚙️ Dependencies

Make sure the following tools are installed:

| Tool | Purpose |
|------|----------|
| [`ia`](https://archive.org/services/docs/api/internetarchive/cli.html) | Internet Archive CLI |
| [`fzf`](https://github.com/junegunn/fzf) | Fuzzy finder |
| [`mpv`](https://mpv.io/) | Video & audio player |
| [`nsxiv`](https://github.com/nsxiv/nsxiv) | Image viewer |
| [`zathura`](https://pwmt.org/projects/zathura/) | PDF viewer |
| [`yt-dlp`](https://github.com/yt-dlp/yt-dlp) | Video downloader |
| [`curl`](https://curl.se/) | Downloader |
| [`pv`](https://www.ivarch.com/programs/pv.shtml) | Download progress bar |

### 🧩 Optional viewers
You can replace any of these in the script:
```bash
VIDEO_PLAYER="mpv"
AUDIO_PLAYER="mpv"
IMAGE_VIEWER="nsxiv"
PDF_VIEWER="zathura"
VIDEO_DOWNLOADER="yt-dlp"
```

---

## 🔧 Installation

1. Clone or download this repository:
   ```bash
   git clone https://github.com/ahloiscreamo/ia-search.git
   cd ia-search
   ```

2. Make the script executable:
   ```bash
   chmod +x ia-search
   ```

3. (Optional) Move it to your `$PATH`:
   ```bash
   sudo mv ia-search /usr/local/bin/
   ```

4. Test it:
   ```bash
   ia-search
   ```

---

## 🔍 Usage

When launched, `ia-search` will:

1. Prompt you for a search term  
2. Show matching Internet Archive items via `fzf`  
3. Let you pick a file within that item  
4. Offer to **Play/Open** or **Download**

---

### 🧠 Examples

Search for Japanese movies:
```bash
ia-search "mediatype:movies AND language:japanese"
```

Search for public domain music:
```bash
ia-search "mediatype:audio AND subject:publicdomain"
```

Search for scanned art books:
```bash
ia-search "mediatype:image AND subject:scans"
```

Search for PDFs about animation:
```bash
ia-search "mediatype:texts AND subject:animation"
```

---

## 📜 Available `ia search` Fields

You can use these in your queries (combine with AND/OR/NOT):

| Field | Example | Description |
|--------|----------|-------------|
| `mediatype` | `mediatype:movies` | Filter by content type (movies, audio, image, texts, etc.) |
| `title` | `title:"Studio Ghibli"` | Search by title |
| `creator` | `creator:"NHK"` | Filter by uploader/author |
| `uploader` | `uploader:xxxx@gmail.com` | Filter by uploader |
| `subject` | `subject:japan` | Filter by subject tags |
| `language` | `language:japanese` | Filter by language |
| `year` | `year:1990` | Filter by year |
| `collection` | `collection:anime` | Filter by specific Internet Archive collection |

---

## 💡 Tips

- You can type advanced queries like:
  ```bash
  mediatype:movies AND (subject:tokyo OR subject:japan)
  ```
- For best results, include `mediatype:` in every search.
- Temporary files for PDFs/images are automatically deleted after viewing.

---

## 🧰 Example Flow

```
🔍 Enter search query: mediatype:movies AND subject:japan
🔎 Searching for "mediatype:movies AND subject:japan" ...
📂 Fetching file list for: tokyo-streets-1990 ...
🎥 Select a file to open >
▶️ Play or ⬇️ Download
🎞️ Playing video with mpv...
```
