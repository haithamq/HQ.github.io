/** WhatsApp (E.164 without +). */
const WHATSAPP_E164 = "971553395449";

function whatsappWithText(message: string): string {
  return `https://wa.me/${WHATSAPP_E164}?text=${encodeURIComponent(message)}`;
}

const WA_QUOTE_EN = whatsappWithText(
  "Hello, I'd like a quote from HQ IT Solutions.",
);
const WA_QUOTE_AR = whatsappWithText(
  "مرحباً، أود الحصول على عرض سعر من HQ IT Solutions.",
);

const WA_LINK_ATTR = 'target="_blank" rel="noopener noreferrer"';

function isArabicSlug(slug: string): boolean {
  return (
    slug === "landing-ar" ||
    slug === "contact-ar" ||
    slug === "portfolio-ar" ||
    slug === "services-detail-ar"
  );
}

function linkLabel(html: string, label: string, href: string): string {
  const needle = `href="#">${label}</a>`;
  const repl = `href="${href}">${label}</a>`;
  if (!html.includes(needle)) return html;
  return html.split(needle).join(repl);
}

function replaceOnce(html: string, from: string, to: string): string {
  if (!html.includes(from)) return html;
  return html.replace(from, to);
}

function applyNavAndFooterLinks(html: string, slug: string): string {
  const ar = isArabicSlug(slug);
  const home = ar ? "/ar" : "/";
  const services = ar ? "/services/ar" : "/services";
  const portfolio = ar ? "/portfolio" : "/case-studies";
  const caseStudies = "/case-studies";

  if (ar) {
    html = linkLabel(html, "الرئيسية", home);
    html = linkLabel(html, "الخدمات", services);
    html = linkLabel(html, "خدماتنا", services);
    html = linkLabel(html, "أعمالنا", portfolio);
    html = linkLabel(html, "اتصل بنا", "/ar/contact");
    html = linkLabel(html, "دراسات الحالة", caseStudies);
    html = linkLabel(html, "من نحن", "#about");
    html = linkLabel(html, "الوظائف", "#careers");
    html = linkLabel(html, "أنظمة نقاط البيع", services);
    html = linkLabel(html, "تطوير الويب", services);
    html = linkLabel(html, "تطوير التطبيقات", services);
    html = linkLabel(html, "الحلول السحابية", services);
    html = linkLabel(html, "الهندسة السحابية", services);
    html = linkLabel(html, "التحول الرقمي", services);
    html = linkLabel(html, "أمن المؤسسات", services);
    html = linkLabel(html, "سياسة الخصوصية", "#privacy");
    html = linkLabel(html, "شروط الخدمة", "#terms");
    html = linkLabel(html, "إعدادات الكوكيز", "#cookies");
  } else {
    html = linkLabel(html, "Home", home);
    html = linkLabel(html, "Services", services);
    html = linkLabel(html, "Portfolio", portfolio);
    html = linkLabel(html, "Contact", "/contact");
    html = linkLabel(html, "Case Studies", caseStudies);
    html = linkLabel(html, "About Us", "#about");
    html = linkLabel(html, "Careers", "#careers");
    html = linkLabel(html, "POS Systems", services);
    html = linkLabel(html, "Web Development", services);
    html = linkLabel(html, "App Development", services);
    html = linkLabel(html, "Cloud Solutions", services);
    html = linkLabel(html, "Cloud Engineering", services);
    html = linkLabel(html, "Digital Transformation", services);
    html = linkLabel(html, "Enterprise Security", services);
    html = linkLabel(html, "Privacy Policy", "#privacy");
    html = linkLabel(html, "Terms of Service", "#terms");
    html = linkLabel(html, "Cookie Settings", "#cookies");
  }

  return html;
}

function applyLogoLinks(html: string, slug: string): string {
  const ar = isArabicSlug(slug);
  const home = ar ? "/ar" : "/";
  html = replaceOnce(
    html,
    '<div class="text-xl font-bold tracking-tighter text-blue-900">HQ IT Solutions</div>',
    `<a href="${home}" class="text-xl font-bold tracking-tighter text-blue-900 hover:opacity-90 transition-opacity">HQ IT Solutions</a>`,
  );
  return html;
}

function applyLandingButtons(html: string, slug: string): string {
  if (slug !== "landing" && slug !== "landing-ar") return html;

  if (slug === "landing") {
    html = replaceOnce(
      html,
      `<button class="bg-gradient-to-br from-primary to-primary-container text-on-primary px-6 py-2 rounded-xl font-medium hover:opacity-80 transition-opacity duration-300 active:scale-95">
                Get a Quote
            </button>`,
      `<a href="${WA_QUOTE_EN}" ${WA_LINK_ATTR} class="inline-flex items-center justify-center bg-gradient-to-br from-primary to-primary-container text-on-primary px-6 py-2 rounded-xl font-medium hover:opacity-80 transition-opacity duration-300 active:scale-95">
                Get a Quote
            </a>`,
    );
    html = replaceOnce(
      html,
      `<button class="bg-gradient-to-r from-primary to-primary-container text-on-primary px-8 py-4 rounded-xl font-bold shadow-xl shadow-primary/10 hover:translate-y-[-2px] transition-all">
                            Start Your Project
                        </button>`,
      `<a href="${WA_QUOTE_EN}" ${WA_LINK_ATTR} class="inline-flex items-center justify-center bg-gradient-to-r from-primary to-primary-container text-on-primary px-8 py-4 rounded-xl font-bold shadow-xl shadow-primary/10 hover:translate-y-[-2px] transition-all">
                            Start Your Project
                        </a>`,
    );
    html = replaceOnce(
      html,
      `<button class="flex items-center gap-2 px-8 py-4 rounded-xl font-bold text-primary hover:bg-surface-container-low transition-colors group">
                            Our Portfolio
                            <span class="material-symbols-outlined group-hover:translate-x-1 transition-transform">arrow_forward</span>
</button>`,
      `<a href="/case-studies" class="inline-flex items-center gap-2 px-8 py-4 rounded-xl font-bold text-primary hover:bg-surface-container-low transition-colors group">
                            Our Portfolio
                            <span class="material-symbols-outlined group-hover:translate-x-1 transition-transform">arrow_forward</span>
</a>`,
    );
    html = replaceOnce(
      html,
      `<button class="bg-secondary-container text-on-secondary-container px-10 py-5 rounded-xl font-bold text-lg hover:brightness-110 transition-all shadow-2xl shadow-black/20">
                        Start Your Project
                    </button>`,
      `<a href="${WA_QUOTE_EN}" ${WA_LINK_ATTR} class="inline-flex items-center justify-center bg-secondary-container text-on-secondary-container px-10 py-5 rounded-xl font-bold text-lg hover:brightness-110 transition-all shadow-2xl shadow-black/20">
                        Start Your Project
                    </a>`,
    );
    html = replaceOnce(
      html,
      `<button class="bg-white/10 backdrop-blur-md text-white border border-white/20 px-10 py-5 rounded-xl font-bold text-lg hover:bg-white/20 transition-all">
                        Schedule a Demo
                    </button>`,
      `<a href="${WA_QUOTE_EN}" ${WA_LINK_ATTR} class="inline-flex items-center justify-center bg-white/10 backdrop-blur-md text-white border border-white/20 px-10 py-5 rounded-xl font-bold text-lg hover:bg-white/20 transition-all">
                        Schedule a Demo
                    </a>`,
    );
  } else {
    html = replaceOnce(
      html,
      `<button class="bg-gradient-to-br from-primary to-primary-container text-on-primary px-6 py-2 rounded-xl font-medium hover:opacity-80 transition-opacity duration-300 active:scale-95">
            احصل على عرض سعر
        </button>`,
      `<a href="${WA_QUOTE_AR}" ${WA_LINK_ATTR} class="inline-flex items-center justify-center bg-gradient-to-br from-primary to-primary-container text-on-primary px-6 py-2 rounded-xl font-medium hover:opacity-80 transition-opacity duration-300 active:scale-95">
            احصل على عرض سعر
        </a>`,
    );
    html = replaceOnce(
      html,
      `<button class="bg-gradient-to-r from-primary to-primary-container text-on-primary px-8 py-4 rounded-xl font-bold shadow-xl shadow-primary/10 hover:translate-y-[-2px] transition-all">
                        ابدأ مشروعك
                    </button>`,
      `<a href="${WA_QUOTE_AR}" ${WA_LINK_ATTR} class="inline-flex items-center justify-center bg-gradient-to-r from-primary to-primary-container text-on-primary px-8 py-4 rounded-xl font-bold shadow-xl shadow-primary/10 hover:translate-y-[-2px] transition-all">
                        ابدأ مشروعك
                    </a>`,
    );
    html = replaceOnce(
      html,
      `<button class="flex items-center gap-2 px-8 py-4 rounded-xl font-bold text-primary hover:bg-surface-container-low transition-colors group">
                        أعمالنا السابقة
                        <span class="material-symbols-outlined rtl-mirror group-hover:-translate-x-1 transition-transform">arrow_forward</span>
</button>`,
      `<a href="/portfolio" class="inline-flex items-center gap-2 px-8 py-4 rounded-xl font-bold text-primary hover:bg-surface-container-low transition-colors group">
                        أعمالنا السابقة
                        <span class="material-symbols-outlined rtl-mirror group-hover:-translate-x-1 transition-transform">arrow_forward</span>
</a>`,
    );
    html = replaceOnce(
      html,
      `<button class="bg-secondary-container text-on-secondary-container px-10 py-5 rounded-xl font-bold text-lg hover:brightness-110 transition-all shadow-2xl shadow-black/20">
                    ابدأ مشروعك الآن
                </button>`,
      `<a href="${WA_QUOTE_AR}" ${WA_LINK_ATTR} class="inline-flex items-center justify-center bg-secondary-container text-on-secondary-container px-10 py-5 rounded-xl font-bold text-lg hover:brightness-110 transition-all shadow-2xl shadow-black/20">
                    ابدأ مشروعك الآن
                </a>`,
    );
    html = replaceOnce(
      html,
      `<button class="bg-white/10 backdrop-blur-md text-white border border-white/20 px-10 py-5 rounded-xl font-bold text-lg hover:bg-white/20 transition-all">
                    احجز عرضاً توضيحياً
                </button>`,
      `<a href="${WA_QUOTE_AR}" ${WA_LINK_ATTR} class="inline-flex items-center justify-center bg-white/10 backdrop-blur-md text-white border border-white/20 px-10 py-5 rounded-xl font-bold text-lg hover:bg-white/20 transition-all">
                    احجز عرضاً توضيحياً
                </a>`,
    );
  }

  return html;
}

function applyPortfolioNavQuoteButtons(html: string, slug: string): string {
  if (slug !== "portfolio-ar" && slug !== "portfolio-case-studies") return html;

  if (slug === "portfolio-case-studies") {
    html = replaceOnce(
      html,
      `<button class="bg-gradient-to-br from-primary to-primary-container text-on-primary px-6 py-2.5 rounded-xl font-medium text-sm hover:opacity-90 active:scale-95 transition-all duration-200 shadow-lg shadow-primary/10">
                Get a Quote
            </button>`,
      `<a href="${WA_QUOTE_EN}" ${WA_LINK_ATTR} class="inline-flex items-center justify-center bg-gradient-to-br from-primary to-primary-container text-on-primary px-6 py-2.5 rounded-xl font-medium text-sm hover:opacity-90 active:scale-95 transition-all duration-200 shadow-lg shadow-primary/10">
                Get a Quote
            </a>`,
    );
  } else {
    html = replaceOnce(
      html,
      `<button class="bg-gradient-to-br from-primary to-primary-container text-on-primary px-6 py-2.5 rounded-xl font-medium text-sm hover:opacity-90 active:scale-95 transition-all duration-200 shadow-lg shadow-primary/10">
            احصل على عرض سعر
        </button>`,
      `<a href="${WA_QUOTE_AR}" ${WA_LINK_ATTR} class="inline-flex items-center justify-center bg-gradient-to-br from-primary to-primary-container text-on-primary px-6 py-2.5 rounded-xl font-medium text-sm hover:opacity-90 active:scale-95 transition-all duration-200 shadow-lg shadow-primary/10">
            احصل على عرض سعر
        </a>`,
    );
  }

  return html;
}

function applyPortfolioCtaButtons(html: string, slug: string): string {
  if (slug !== "portfolio-ar" && slug !== "portfolio-case-studies") return html;

  if (slug === "portfolio-case-studies") {
    html = replaceOnce(
      html,
      `<button class="bg-secondary-container text-on-secondary-container px-10 py-5 rounded-xl font-bold text-lg hover:shadow-2xl hover:shadow-secondary/20 transition-all active:scale-95">
                                Get a Quote
                            </button>`,
      `<a href="${WA_QUOTE_EN}" ${WA_LINK_ATTR} class="inline-flex items-center justify-center bg-secondary-container text-on-secondary-container px-10 py-5 rounded-xl font-bold text-lg hover:shadow-2xl hover:shadow-secondary/20 transition-all active:scale-95">
                                Get a Quote
                            </a>`,
    );
    html = replaceOnce(
      html,
      `<button class="bg-white/10 backdrop-blur-md text-white border border-white/20 px-10 py-5 rounded-xl font-bold text-lg hover:bg-white/20 transition-all">
                                Contact Sales
                            </button>`,
      `<a href="${WA_QUOTE_EN}" ${WA_LINK_ATTR} class="inline-flex items-center justify-center bg-white/10 backdrop-blur-md text-white border border-white/20 px-10 py-5 rounded-xl font-bold text-lg hover:bg-white/20 transition-all">
                                Contact Sales
                            </a>`,
    );
  } else {
    html = replaceOnce(
      html,
      `<button class="bg-secondary-container text-on-secondary-container px-10 py-5 rounded-xl font-bold text-lg hover:shadow-2xl hover:shadow-secondary/20 transition-all active:scale-95">
                            احصل على عرض سعر
                        </button>`,
      `<a href="${WA_QUOTE_AR}" ${WA_LINK_ATTR} class="inline-flex items-center justify-center bg-secondary-container text-on-secondary-container px-10 py-5 rounded-xl font-bold text-lg hover:shadow-2xl hover:shadow-secondary/20 transition-all active:scale-95">
                            احصل على عرض سعر
                        </a>`,
    );
    html = replaceOnce(
      html,
      `<button class="bg-white/10 backdrop-blur-md text-white border border-white/20 px-10 py-5 rounded-xl font-bold text-lg hover:bg-white/20 transition-all">
                            تحدث إلى المبيعات
                        </button>`,
      `<a href="${WA_QUOTE_AR}" ${WA_LINK_ATTR} class="inline-flex items-center justify-center bg-white/10 backdrop-blur-md text-white border border-white/20 px-10 py-5 rounded-xl font-bold text-lg hover:bg-white/20 transition-all">
                            تحدث إلى المبيعات
                        </a>`,
    );
  }

  return html;
}

function applyServicesDetailButtons(html: string, slug: string): string {
  if (slug !== "services-detail" && slug !== "services-detail-ar") return html;

  if (slug === "services-detail") {
    html = replaceOnce(
      html,
      `<button class="architectural-gradient text-on-primary px-6 py-2.5 rounded-xl text-sm font-semibold hover:opacity-80 active:scale-95 transition-all">Get a Quote</button>`,
      `<a href="${WA_QUOTE_EN}" ${WA_LINK_ATTR} class="inline-flex items-center justify-center architectural-gradient text-on-primary px-6 py-2.5 rounded-xl text-sm font-semibold hover:opacity-80 active:scale-95 transition-all">Get a Quote</a>`,
    );
    html = html.replace(
      /<button class="bg-secondary-container text-on-secondary-container px-8 py-4 rounded-xl font-bold hover:opacity-90 transition-all flex items-center gap-2">\s*Consult Now <span class="material-symbols-outlined text-sm" data-icon="arrow_forward">arrow_forward<\/span>\s*<\/button>/g,
      `<a href="${WA_QUOTE_EN}" ${WA_LINK_ATTR} class="inline-flex items-center justify-center bg-secondary-container text-on-secondary-container px-8 py-4 rounded-xl font-bold hover:opacity-90 transition-all gap-2">Consult Now <span class="material-symbols-outlined text-sm" data-icon="arrow_forward">arrow_forward</span></a>`,
    );
    html = replaceOnce(
      html,
      `<button class="bg-secondary-container text-on-secondary-container px-12 py-5 rounded-xl font-bold hover:opacity-90 transition-all flex items-center gap-2 text-lg">
                        Consult Now <span class="material-symbols-outlined" data-icon="arrow_forward">arrow_forward</span>
</button>`,
      `<a href="${WA_QUOTE_EN}" ${WA_LINK_ATTR} class="inline-flex items-center justify-center bg-secondary-container text-on-secondary-container px-12 py-5 rounded-xl font-bold hover:opacity-90 transition-all gap-2 text-lg">
                        Consult Now <span class="material-symbols-outlined" data-icon="arrow_forward">arrow_forward</span>
</a>`,
    );
  } else {
    html = replaceOnce(
      html,
      `<button class="architectural-gradient text-on-primary px-6 py-2.5 rounded-xl text-sm font-semibold hover:opacity-80 active:scale-95 transition-all">اطلب عرض سعر</button>`,
      `<a href="${WA_QUOTE_AR}" ${WA_LINK_ATTR} class="inline-flex items-center justify-center architectural-gradient text-on-primary px-6 py-2.5 rounded-xl text-sm font-semibold hover:opacity-80 active:scale-95 transition-all">اطلب عرض سعر</a>`,
    );
    html = html.replace(
      /<button class="bg-secondary-container text-on-secondary-container px-8 py-4 rounded-xl font-bold hover:opacity-90 transition-all flex items-center gap-2">\s*استشرنا الآن <span class="material-symbols-outlined text-sm rotate-180" data-icon="arrow_forward">arrow_forward<\/span>\s*<\/button>/g,
      `<a href="${WA_QUOTE_AR}" ${WA_LINK_ATTR} class="inline-flex items-center justify-center bg-secondary-container text-on-secondary-container px-8 py-4 rounded-xl font-bold hover:opacity-90 transition-all gap-2">استشرنا الآن <span class="material-symbols-outlined text-sm rotate-180" data-icon="arrow_forward">arrow_forward</span></a>`,
    );
    html = replaceOnce(
      html,
      `<button class="bg-secondary-container text-on-secondary-container px-12 py-5 rounded-xl font-bold hover:opacity-90 transition-all flex items-center gap-2 text-lg">
                    استشرنا الآن <span class="material-symbols-outlined rotate-180" data-icon="arrow_forward">arrow_forward</span>
</button>`,
      `<a href="${WA_QUOTE_AR}" ${WA_LINK_ATTR} class="inline-flex items-center justify-center bg-secondary-container text-on-secondary-container px-12 py-5 rounded-xl font-bold hover:opacity-90 transition-all gap-2 text-lg">
                    استشرنا الآن <span class="material-symbols-outlined rotate-180" data-icon="arrow_forward">arrow_forward</span>
</a>`,
    );
  }

  return html;
}

/** Drop legacy footer blocks (social lists / تواصل معنا) from older Stitch exports. */
function stripLegacySocialFooterColumns(html: string): string {
  let out = html;
  out = out.replace(
    /<div class="col-span-1">\s*<h4 class="[^"]*">تواصل معنا<\/h4>\s*<ul[\s\S]*?<\/ul>\s*<\/div>/g,
    "",
  );
  out = out.replace(
    /<div>\s*<h4 class="font-bold[^"]*">تواصل معنا<\/h4>\s*<ul[\s\S]*?<\/ul>\s*<\/div>/g,
    "",
  );
  out = out.replace(
    /<div>\s*<h4 class="font-bold[^"]*">Connect<\/h4>\s*<ul[\s\S]*?<\/ul>\s*<\/div>/g,
    "",
  );
  out = out.replace(
    /<div>\s*<h4 class="font-bold[^"]*">تواصل<\/h4>\s*<ul[\s\S]*?<\/ul>\s*<\/div>/g,
    "",
  );
  out = out.replace(
    /(<div class="grid grid-cols-1 )md:grid-cols-4( gap-8 px-8 py-12 max-w-7xl mx-auto">)/g,
    "$1md:grid-cols-3$2",
  );
  return out;
}

/** Footer © line: normalize any four-digit year so stale Stitch exports never show an old year. */
function normalizeCopyrightYear(html: string): string {
  const year = new Date().getFullYear();
  return html.replace(/©\s*20\d{2}/g, `© ${year}`);
}

/** Match Next.js `basePath` (no trailing slash). Set when deploying to GitHub Project Pages. */
function applyBasePathToInternalHrefs(html: string): string {
  const base = (process.env.BASE_PATH ?? "").trim().replace(/\/$/, "");
  if (!base) return html;
  return html.replace(/href="(\/[^"]*)"/g, (full, path: string) => {
    if (path.startsWith("//")) return full;
    if (path === "/") return `href="${base}/"`;
    return `href="${base}${path}"`;
  });
}

/**
 * GitHub Pages serves static export as `path/index.html`, which is reachable at `/path/`.
 * Links to `/path` (no trailing slash) often 404; normalize root-relative page links.
 */
function ensureTrailingSlashOnInternalHrefs(html: string): string {
  return html.replace(/href="([^"]+)"/g, (full, raw: string) => {
    if (/^(https?:|mailto:|tel:|javascript:)/i.test(raw)) return full;
    if (raw.startsWith("#")) return full;
    const hashIdx = raw.indexOf("#");
    const pathAndQuery = hashIdx >= 0 ? raw.slice(0, hashIdx) : raw;
    const hash = hashIdx >= 0 ? raw.slice(hashIdx) : "";
    const qIdx = pathAndQuery.indexOf("?");
    const path = qIdx >= 0 ? pathAndQuery.slice(0, qIdx) : pathAndQuery;
    const query = qIdx >= 0 ? pathAndQuery.slice(qIdx) : "";
    if (!path.startsWith("/")) return full;
    if (path === "/" || path.endsWith("/")) return full;
    const lastSeg = path.split("/").filter(Boolean).pop() ?? "";
    if (lastSeg.includes(".")) return full;
    return `href="${path}/${query}${hash}"`;
  });
}

export function applyInternalPageLinks(html: string, slug: string): string {
  let out = html;
  out = applyLogoLinks(out, slug);
  out = applyNavAndFooterLinks(out, slug);
  out = applyLandingButtons(out, slug);
  out = applyPortfolioNavQuoteButtons(out, slug);
  out = applyPortfolioCtaButtons(out, slug);
  out = applyServicesDetailButtons(out, slug);
  out = stripLegacySocialFooterColumns(out);
  out = normalizeCopyrightYear(out);
  out = applyBasePathToInternalHrefs(out);
  out = ensureTrailingSlashOnInternalHrefs(out);
  return out;
}

export type LocaleAlternate = { href: string; label: string };

export function localeAlternateForSlug(slug: string): LocaleAlternate | null {
  const map: Record<string, LocaleAlternate> = {
    landing: { href: "/ar/", label: "العربية" },
    "landing-ar": { href: "/", label: "English" },
    contact: { href: "/ar/contact/", label: "العربية" },
    "contact-ar": { href: "/contact/", label: "English" },
    "services-detail": { href: "/services/ar/", label: "العربية" },
    "services-detail-ar": { href: "/services/", label: "English" },
    "portfolio-case-studies": { href: "/portfolio/", label: "العربية" },
    "portfolio-ar": { href: "/case-studies/", label: "English" },
  };
  return map[slug] ?? null;
}
