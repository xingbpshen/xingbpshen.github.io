---
title: "Formatting Reference for Posts: A Reminder to Myself"
date: 2026-08-08
tldr: "What is available when writing a post here: math, tables, figures, code,
  and footnotes, with no setup needed beyond dropping a Markdown file into
  the posts folder."
---

This post exists to show what is available when writing here, and to confirm the
section renders correctly. Replace or delete it once you have written a real one —
the file is `_posts/2026-08-08-formatting-reference.md`.

To add a post, drop a Markdown file in `_posts/` named `YYYY-MM-DD-some-slug.md`
with a `title`, a `date`, and a `tldr` in the front matter. The `tldr` is a one or
two sentence summary. It appears in a box under the title here, and under the entry
in the list on the homepage, so write it for someone deciding whether to read on.
It is optional, and both places simply omit it if absent. Everything else — layout, the
sidebar, the entry in the list on the homepage — happens automatically. The URL
comes from the slug, so this one lives at `/blog/formatting-reference/`.

## Math

MathJax is already loaded site-wide, so no setup is needed. Write inline math with
double dollars, like $$\mathcal{L}(\theta) = \mathbb{E}_{x \sim p}[\ell(f_\theta(x), y)]$$,
and display math as its own paragraph:

$$
\mathrm{ECE} = \sum_{m=1}^{M} \frac{|B_m|}{n} \Big| \mathrm{acc}(B_m) - \mathrm{conf}(B_m) \Big|
$$

Use `$$` rather than a single `$` even for inline math. Single dollars do work,
but Markdown processes the text first and will eat underscores and asterisks
inside the expression — so `$p_i$` can silently turn into italics. Double dollars
are passed through untouched.

Equations are auto-numbered, so you can label and reference them.

## Tables

Standard pipe tables, styled by the theme:

| Method    | Accuracy | ECE   |
| :-------- | -------: | ----: |
| Baseline  |     84.2 | 0.081 |
| + Calibr. |     84.0 | 0.019 |

Colons in the separator row set alignment: `:---` left, `---:` right, `:---:` centred.

## Figures

Images are constrained to the text width automatically:

![A figure caption goes in the alt text](/images/bayesagent.png)

Keep image paths absolute — starting with `/images/` — so they resolve from a
post URL as well as from the homepage. For a caption underneath, use HTML:

<figure>
  <img src="/images/bayesagent.png" alt="">
  <figcaption>Figure 1. Captions render smaller and centred.</figcaption>
</figure>

## Code

Fenced blocks are syntax-highlighted:

```python
def temperature_scale(logits, T):
    return logits / T
```

## Everything else

Ordinary Markdown works as expected: **bold**, *italics*, `inline code`,
[links](https://www.claude.com), lists, and blockquotes.

> Footnotes are supported too.[^1]

[^1]: Like this one, which renders at the bottom of the post.
