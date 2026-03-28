import type { Metadata } from "next";
import { StitchHtmlBody } from "@/components/stitch-html-body";
import { readStitchHtml } from "@/lib/stitch-html";

export function generateMetadata(): Metadata {
  const { title } = readStitchHtml("contact");
  return { title };
}

export default function ContactPage() {
  return <StitchHtmlBody slug="contact" />;
}
