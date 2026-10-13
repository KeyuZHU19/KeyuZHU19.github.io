# Keyu Zhu's Homepage

Static academic homepage hosted with GitHub Pages.

Edit `index.html` to update the biography, publications, and reviewer service.
The layout is adapted from Tairan He's homepage, with its original design
credits retained in the source and footer.

The RADAR preview is stored in this repository at `assets/videos/radar.mp4`
and served by this site's own GitHub Pages deployment.

## Blog

The blog at `/blog/` uses the original Hugo PaperMod theme, also used by
Lilian Weng's blog. The generated HTML, CSS, and JavaScript are stored here
and served by this site's own GitHub Pages deployment.

Write articles as Markdown files in `blog-source/content/posts/`, with front
matter such as `title`, `date`, `tags`, and `draft`. Then run
`pwsh -File blog-source/build.ps1` from the
repository root to regenerate `blog/`, and commit both source and output.
The build script downloads a pinned version of Hugo and PaperMod locally.
Set `draft: true` to keep an unfinished article out of the published blog.

PaperMod: https://github.com/adityatelange/hugo-PaperMod (MIT license).
