import Link from "next/link";
import { readStitchHtml } from "@/lib/stitch-html";
import { localeAlternateForSlug } from "@/lib/stitch-links";

export function StitchHtmlBody({ slug }: { slug: string }) {
  const { bodyHtml } = readStitchHtml(slug);
  const localeAlt = localeAlternateForSlug(slug);

  return (
    <>
      {localeAlt ? (
        <div className="fixed bottom-4 end-4 z-[100] print:hidden">
          <Link
            href={localeAlt.href}
            className="rounded-full bg-primary px-4 py-2 text-sm font-semibold text-on-primary shadow-lg shadow-primary/20 transition-opacity hover:opacity-90"
          >
            {localeAlt.label}
          </Link>
        </div>
      ) : null}
      <div
        className="bg-surface text-on-surface min-h-screen"
        dangerouslySetInnerHTML={{ __html: bodyHtml }}
      />
    </>
  );
}
