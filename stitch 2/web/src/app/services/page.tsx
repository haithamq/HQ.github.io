import type { Metadata } from "next";
import { StitchHtmlBody } from "@/components/stitch-html-body";
import { readStitchHtml } from "@/lib/stitch-html";

export function generateMetadata(): Metadata {
  const { title } = readStitchHtml("services-detail");
  return { title };
}

export default function ServicesPage() {
  return <StitchHtmlBody slug="services-detail" />;
}
