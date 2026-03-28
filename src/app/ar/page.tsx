import type { Metadata } from "next";
import { StitchHtmlBody } from "@/components/stitch-html-body";
import { readStitchHtml } from "@/lib/stitch-html";

export function generateMetadata(): Metadata {
  const { title } = readStitchHtml("landing-ar");
  return { title };
}

export default function ArabicHomePage() {
  return <StitchHtmlBody slug="landing-ar" />;
}
