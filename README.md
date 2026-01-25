# Maintenance of wiki Pages.


## Customization

* Anything under Dev Should go in the WIP folder - this is hidden by default and won't get turned into a page.
* There should be a blank line between a title (#title) and the contents. Likewise between a paragraph and a --- (line break) else Jekell won't format it properly.
* Jekell can handle a Mix of markdown and HTML - But if you want to include a collapaseable section containing markdown - you need to wrap the MD in a <div class="Info" markdown="1"> MD goes here </div> Block to format the MD properly.
* Youtube videos can be embedded  - but you need the embed block from youtube itself - you can't just stick it in an Iframe.
* Unlike regular markdown - you can use HTML to change colors in the page.
* Don't touch the config.yaml or CSS pages - Dylan has final say over the color scheme.
* **Links to wiki pages should use full wiki URLs without extensions and with trailing slashes** - Never use `.html`, `.md`, or relative paths. Always use the format: `https://wiki.wildlandermod.com/_folder/page-name/` with a trailing `/`. For example:
  - ✅ Correct: `https://wiki.wildlandermod.com/_03-YourFirstCharacter/Needs/`
  - ✅ Correct: `[Link text](https://wiki.wildlandermod.com/_03-YourFirstCharacter/Needs/)`
  - ❌ Wrong: `https://wiki.wildlandermod.com/_03-YourFirstCharacter/Needs.html`
  - ❌ Wrong: `Needs.md` or relative paths
  - This ensures links work correctly across the site and in external references.

### Each page should have a header block
```
---                            Required
layout: default                Required - Leave this alone
title: Keybindings             Required - Title of the page (appears on nav bar)
has_toc: true                  Optional - If the page has children - Does it include a Table of contents for its children
has_children: true             Optional - If this page is going to have children underneath it.    Optional - If the page is a child - Its parent should go here
  Optional - If the parent is a child - the parents parent title does here
nav_order: 8                   Optional - Position in the Nav bar under its parent (e.g 1 is the first page under the parent) 
description: Keybinds          Optional - a description for the page which will appear if the page is linked.
---                            Required
```

### For callouts
```
{: .warning}
> Call out text goes here.
>
> Each line should have a blank line between it.

```
* Red - Super important things that users *need* to know
* Yellow - Warnings / Important info that users should know.
* Green - Notes & hints that users might want to know.

### Code blocks should only be used for crafting recipes & formala's - not as a highlight.

code blocks are surrounded by 3 apostrphies, or by being tab indented

### To include a table of contents

Just-the-Docs automatically generates a table of contents using the `{:toc}` tag. **You should include this on pages with multiple sections.**

**To add a TOC to your page:**

1. Add `has_toc: true` to the page's frontmatter
2. Add the following markup where you want the TOC to appear:

```markdown
## Table of contents
{: .no_toc .text-delta }

<details open markdown="block">
  <summary>
    Table of contents
  </summary>
  {: .text-delta }
- TOC
{:toc}
</details>
```

The `{:toc}` tag tells Just-the-Docs to generate the table of contents automatically based on your page's heading hierarchy (h2, h3, h4, etc.). The TOC will also appear in the right sidebar on the rendered page.

References: [Just-the-Docs In-page Navigation](https://just-the-docs.com/docs/navigation/in-page/#collapsible-table-of-contents-with-details-and-summary)

### to include a 'Button' Link
```
[description](link){: .btn .btn-pink }
```


----

[^1]: [It can take up to 10 minutes for changes to your site to publish after you push the changes to GitHub](https://docs.github.com/en/pages/setting-up-a-github-pages-site-with-jekyll/creating-a-github-pages-site-with-jekyll#creating-your-site).


### Other links

* Jekyll https://jekyllrb.com
* Just the Docs https://just-the-docs.github.io/just-the-docs/
* jekyll-default-layout https://github.com/benbalter/jekyll-default-layout

