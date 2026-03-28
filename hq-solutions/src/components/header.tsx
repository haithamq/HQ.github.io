import Link from "next/link";
import Image from "next/image";
import { Button } from "@/components/ui/button";

export function Header() {
  return (
    <header className="sticky top-0 z-50 w-full border-b border-border bg-background/95 backdrop-blur supports-[backdrop-filter]:bg-background/60">
      <div className="container mx-auto flex h-16 items-center justify-between px-4">
        <Link href="/" className="flex items-center gap-2">
          <Image
            src="/logo.png"
            alt="HQ Solutions"
            width={44}
            height={44}
            className="h-11 w-11 object-contain"
          />
          <span className="text-lg font-semibold text-foreground">
            HQ Solutions
          </span>
        </Link>
        <nav className="hidden items-center gap-6 md:flex">
          <Link
            href="#services"
            className="text-sm font-medium text-muted-foreground transition-colors hover:text-foreground"
          >
            Services
          </Link>
          <Link
            href="#contact"
            className="text-sm font-medium text-muted-foreground transition-colors hover:text-foreground"
          >
            Contact
          </Link>
          <Button asChild variant="default" size="sm">
            <Link href="#contact">Get a quote</Link>
          </Button>
        </nav>
      </div>
    </header>
  );
}
