import type { Metadata } from "next";
import { StitchHtmlBody } from "@/components/stitch-html-body";
import { readStitchHtml } from "@/lib/stitch-html";

export function generateMetadata(): Metadata {
  const { title } = readStitchHtml("portfolio-ar");
  return { title };
}

export default function PortfolioPage() {
  return <StitchHtmlBody slug="portfolio-ar" />;
}
