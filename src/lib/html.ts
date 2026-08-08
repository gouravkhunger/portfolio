import { parse } from "node-html-parser";
import { extlinksConfig } from "../config/site";

function containsAny(str: string, fragments: readonly string[]): boolean {
  return fragments.some((f) => str.includes(f));
}

function shouldApplyRel(href: string): boolean {
  if (containsAny(href, extlinksConfig.relInclude)) return true;
  if (containsAny(href, extlinksConfig.relExclude)) return false;
  return true;
}

export function applyExtlinks(html: string): string {
  const doc = parse(html);
  for (const a of doc.querySelectorAll("a")) {
    const href = a.getAttribute("href");
    if (!href || !/^https?:\/\//i.test(href)) continue;

    for (const [attr, value] of Object.entries(extlinksConfig.attributes)) {
      if (a.getAttribute(attr)) continue;
      if (attr.toLowerCase() === "rel" && !shouldApplyRel(href)) continue;
      a.setAttribute(attr, value);
    }
  }
  return doc.toString();
}

export function applyImageAttrs(html: string): string {
  const doc = parse(html);
  for (const img of doc.querySelectorAll("img")) {
    if (!img.getAttribute("loading")) img.setAttribute("loading", "lazy");
    if (!img.getAttribute("decoding")) img.setAttribute("decoding", "async");
  }
  return doc.toString();
}

export function inlineMd(text: string): string {
  return text
    .replace(/&/g, "&amp;")
    .replace(/</g, "&lt;")
    .replace(/>/g, "&gt;")
    .replace(/\*\*(.+?)\*\*/g, "<strong>$1</strong>")
    .replace(/\*(.+?)\*/g, "<em>$1</em>")
    .replace(
      /\[([^\]]+)\]\(([^)]+)\)/g,
      '<a href="$2" class="link-quiet">$1</a>',
    )
    .replace(/\n+/g, "<br />");
}
