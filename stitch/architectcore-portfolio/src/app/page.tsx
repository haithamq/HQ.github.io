import { CtaBanner } from "@/components/cta-banner";
import { PortfolioHero } from "@/components/portfolio-hero";
import { PortfolioPageClient } from "@/components/portfolio-page-client";
import { SiteFooter } from "@/components/site-footer";
import { SiteHeader } from "@/components/site-header";

export default function PortfolioPage() {
  return (
    <>
      <SiteHeader />
      <main className="pt-24">
        <PortfolioHero />
        <PortfolioPageClient />
        <CtaBanner />
      </main>
      <SiteFooter />
    </>
  );
}
