import type { Metadata } from "next";
import { StitchHtmlBody } from "@/components/stitch-html-body";
import { readStitchHtml } from "@/lib/stitch-html";

export function generateMetadata(): Metadata {
  const { title } = readStitchHtml("contact-ar");
  return { title };
}

export default function ContactArPage() {
  return <StitchHtmlBody slug="contact-ar" />;
}
