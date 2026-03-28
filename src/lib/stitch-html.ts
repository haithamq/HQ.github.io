import fs from "node:fs";
import path from "node:path";
import { applyInternalPageLinks } from "@/lib/stitch-links";

const ALLOWED = new Set([
  "landing",
  "landing-ar",
  "portfolio-ar",
  "portfolio-case-studies",
  "services-detail",
  "services-detail-ar",
]);

const contentDir = path.join(process.cwd(), "content");

export function readStitchHtml(slug: string): { title: string; bodyHtml: string } {
  if (!ALLOWED.has(slug)) {
    throw new Error(`Unknown stitch page: ${slug}`);
  }
  const filePath = path.join(contentDir, `${slug}.html`);
  const html = fs.readFileSync(filePath, "utf8");
  const titleMatch = html.match(/<title>([^<]*)<\/title>/i);
  const title = titleMatch?.[1]?.trim() ?? "HQ IT Solutions";
  const bodyMatch = html.match(/<body[^>]*>([\s\S]*)<\/body>/i);
  const rawBody = bodyMatch?.[1]?.trim() ?? "";
  const bodyHtml = applyInternalPageLinks(rawBody, slug);
  return { title, bodyHtml };
}
