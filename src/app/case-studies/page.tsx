import type { Metadata } from "next";
import { StitchHtmlBody } from "@/components/stitch-html-body";
import { readStitchHtml } from "@/lib/stitch-html";

export function generateMetadata(): Metadata {
  const { title } = readStitchHtml("portfolio-case-studies");
  return { title };
}

export default function CaseStudiesPage() {
  return <StitchHtmlBody slug="portfolio-case-studies" />;
}
