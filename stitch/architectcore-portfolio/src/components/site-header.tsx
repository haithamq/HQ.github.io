import Link from "next/link";

const nav: { href: string; label: string; active?: boolean }[] = [
  { href: "#", label: "Home" },
  { href: "#", label: "Services" },
  { href: "#", label: "Portfolio", active: true },
  { href: "#", label: "Contact" },
];

export function SiteHeader() {
  return (
    <nav className="fixed top-0 z-50 w-full bg-slate-50/60 shadow-sm backdrop-blur-md">
      <div className="mx-auto flex w-full max-w-7xl items-center justify-between px-6 py-4">
        <div className="text-xl font-bold tracking-tighter text-blue-900">
          ArchitectCore IT
        </div>
        <div className="hidden items-center space-x-8 md:flex">
          {nav.map((item) => (
            <Link
              key={item.label}
              href={item.href}
              className={
                item.active
                  ? "border-b-2 border-blue-700 pb-1 font-sans text-sm font-medium tracking-tight text-blue-700 antialiased"
                  : "font-sans text-sm font-medium tracking-tight text-slate-600 antialiased transition-colors hover:text-blue-900"
              }
            >
              {item.label}
            </Link>
          ))}
        </div>
        <button
          type="button"
          className="rounded-xl bg-gradient-to-br from-primary to-primary-container px-6 py-2.5 text-sm font-medium text-on-primary shadow-lg shadow-primary/10 transition-all duration-200 hover:opacity-90 active:scale-95"
        >
          Get a Quote
        </button>
      </div>
    </nav>
  );
}
