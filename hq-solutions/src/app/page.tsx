import Link from "next/link";
import Image from "next/image";
import { Button } from "@/components/ui/button";
import {
  Card,
  CardContent,
  CardDescription,
  CardHeader,
  CardTitle,
} from "@/components/ui/card";

export default function HomePage() {
  return (
    <>
      {/* Hero */}
      <section className="relative overflow-hidden border-b border-border bg-gradient-to-b from-background to-card/50">
        <div className="container mx-auto flex flex-col items-center gap-10 px-4 py-20 md:flex-row md:py-28">
          <div className="flex-1 space-y-6 text-center md:text-left">
            <h1 className="text-3xl font-bold tracking-tight text-foreground sm:text-4xl md:text-5xl">
              Web, POS & applications for your business
            </h1>
            <p className="max-w-xl text-lg text-muted-foreground">
              HQ Solutions delivers modern websites, point-of-sale systems, and
              custom applications for clients and shops. Simple, reliable, and
              built for growth.
            </p>
            <div className="flex flex-wrap justify-center gap-4 md:justify-start">
              <Button asChild size="lg">
                <Link href="#contact">Get started</Link>
              </Button>
              <Button asChild variant="outline" size="lg">
                <Link href="#services">View services</Link>
              </Button>
            </div>
          </div>
          <div className="flex-shrink-0">
            <Image
              src="/logo.png"
              alt="HQ Solutions"
              width={220}
              height={220}
              className="h-48 w-48 object-contain md:h-56 md:w-56"
              priority
            />
          </div>
        </div>
      </section>

      {/* Services */}
      <section id="services" className="border-b border-border bg-background py-20">
        <div className="container mx-auto px-4">
          <div className="mx-auto max-w-2xl text-center">
            <h2 className="text-2xl font-bold text-foreground sm:text-3xl">
              What we offer
            </h2>
            <p className="mt-3 text-muted-foreground">
              From websites to POS and custom apps—everything you need to run
              and grow your business.
            </p>
          </div>
          <div className="mx-auto mt-12 grid max-w-5xl gap-6 sm:grid-cols-2 lg:grid-cols-3">
            <Card className="border-border bg-card transition-colors hover:border-accent/50">
              <CardHeader>
                <div className="mb-2 flex h-12 w-12 items-center justify-center rounded-lg bg-primary/20 text-primary">
                  <svg
                    xmlns="http://www.w3.org/2000/svg"
                    width="24"
                    height="24"
                    viewBox="0 0 24 24"
                    fill="none"
                    stroke="currentColor"
                    strokeWidth="2"
                    strokeLinecap="round"
                    strokeLinejoin="round"
                  >
                    <rect width="18" height="18" x="3" y="3" rx="2" ry="2" />
                    <path d="M3 9h18" />
                    <path d="M9 21V9" />
                  </svg>
                </div>
                <CardTitle>Web development</CardTitle>
                <CardDescription>
                  Modern, fast websites and web apps for your brand. Responsive,
                  secure, and easy to manage.
                </CardDescription>
              </CardHeader>
            </Card>
            <Card className="border-border bg-card transition-colors hover:border-accent/50">
              <CardHeader>
                <div className="mb-2 flex h-12 w-12 items-center justify-center rounded-lg bg-primary/20 text-primary">
                  <svg
                    xmlns="http://www.w3.org/2000/svg"
                    width="24"
                    height="24"
                    viewBox="0 0 24 24"
                    fill="none"
                    stroke="currentColor"
                    strokeWidth="2"
                    strokeLinecap="round"
                    strokeLinejoin="round"
                  >
                    <rect width="20" height="14" x="2" y="5" rx="2" />
                    <line x1="2" x2="22" y1="10" y2="10" />
                    <path d="M6 19h12" />
                  </svg>
                </div>
                <CardTitle>POS systems</CardTitle>
                <CardDescription>
                  Point-of-sale solutions for shops and retail. Sales, inventory, and reports in one place.
                </CardDescription>
              </CardHeader>
            </Card>
            <Card className="border-border bg-card transition-colors hover:border-accent/50 sm:col-span-2 lg:col-span-1">
              <CardHeader>
                <div className="mb-2 flex h-12 w-12 items-center justify-center rounded-lg bg-primary/20 text-primary">
                  <svg
                    xmlns="http://www.w3.org/2000/svg"
                    width="24"
                    height="24"
                    viewBox="0 0 24 24"
                    fill="none"
                    stroke="currentColor"
                    strokeWidth="2"
                    strokeLinecap="round"
                    strokeLinejoin="round"
                  >
                    <path d="M12 3v18" />
                    <rect width="4" height="7" x="4" y="14" rx="1" />
                    <rect width="4" height="12" x="10" y="9" rx="1" />
                    <rect width="4" height="5" x="16" y="16" rx="1" />
                  </svg>
                </div>
                <CardTitle>Custom applications</CardTitle>
                <CardDescription>
                  Tailored desktop and mobile apps for your workflows. Built for your team and your clients.
                </CardDescription>
              </CardHeader>
            </Card>
          </div>
        </div>
      </section>

      {/* CTA */}
      <section id="contact" className="bg-card py-20">
        <div className="container mx-auto px-4">
          <div className="mx-auto max-w-2xl rounded-xl border border-border bg-background p-8 text-center shadow-sm md:p-12">
            <h2 className="text-2xl font-bold text-foreground sm:text-3xl">
              Ready to get started?
            </h2>
            <p className="mt-3 text-muted-foreground">
              Tell us about your project. We’ll get back with a clear quote and next steps.
            </p>
            <div className="mt-8 flex flex-wrap justify-center gap-4">
              <Button asChild size="lg">
                <Link href="mailto:hello@hqsolutions.example">
                  Contact us
                </Link>
              </Button>
              <Button asChild variant="outline" size="lg">
                <Link href="#services">View services</Link>
              </Button>
            </div>
          </div>
        </div>
      </section>
    </>
  );
}
