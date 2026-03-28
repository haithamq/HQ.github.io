import Link from "next/link";
import Image from "next/image";

export function Footer() {
  return (
    <footer className="border-t border-border bg-card">
      <div className="container mx-auto px-4 py-12">
        <div className="flex flex-col gap-8 md:flex-row md:items-start md:justify-between">
          <div className="flex items-center gap-2">
            <Image
              src="/logo.png"
              alt="HQ Solutions"
              width={36}
              height={36}
              className="h-9 w-9 object-contain"
            />
            <span className="font-semibold text-foreground">HQ Solutions</span>
          </div>
          <div className="grid gap-6 sm:grid-cols-3">
            <div>
              <h4 className="mb-2 text-sm font-medium text-foreground">
                Services
              </h4>
              <ul className="space-y-2 text-sm text-muted-foreground">
                <li>
                  <Link href="#services" className="hover:text-accent">
                    Web development
                  </Link>
                </li>
                <li>
                  <Link href="#services" className="hover:text-accent">
                    POS systems
                  </Link>
                </li>
                <li>
                  <Link href="#services" className="hover:text-accent">
                    Custom applications
                  </Link>
                </li>
              </ul>
            </div>
            <div>
              <h4 className="mb-2 text-sm font-medium text-foreground">
                Company
              </h4>
              <ul className="space-y-2 text-sm text-muted-foreground">
                <li>
                  <Link href="#contact" className="hover:text-accent">
                    Contact
                  </Link>
                </li>
                <li>
                  <Link href="#contact" className="hover:text-accent">
                    Get a quote
                  </Link>
                </li>
              </ul>
            </div>
            <div>
              <h4 className="mb-2 text-sm font-medium text-foreground">
                Connect
              </h4>
              <p className="text-sm text-muted-foreground">
                Freelancing solutions for businesses and shops worldwide.
              </p>
            </div>
          </div>
        </div>
        <div className="mt-8 border-t border-border pt-8 text-center text-sm text-muted-foreground">
          © {new Date().getFullYear()} HQ Solutions. All rights reserved.
        </div>
      </div>
    </footer>
  );
}
