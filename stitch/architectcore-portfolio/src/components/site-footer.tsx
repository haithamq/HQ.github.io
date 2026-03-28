import Link from "next/link";

export function SiteFooter() {
  return (
    <footer className="border-t border-slate-200 bg-slate-100">
      <div className="mx-auto grid max-w-7xl grid-cols-1 gap-8 px-8 py-12 md:grid-cols-4">
        <div>
          <div className="mb-4 text-lg font-black tracking-tighter text-blue-900">
            ArchitectCore IT
          </div>
          <p className="font-sans text-sm leading-relaxed text-slate-600">
            Engineered for Excellence. We provide high-end IT architecture for
            the world&apos;s most ambitious brands.
          </p>
        </div>
        <div>
          <h4 className="mb-4 font-bold text-blue-900">Services</h4>
          <ul className="space-y-2">
            {["Cloud Engineering", "Digital Transformation", "Enterprise Security"].map(
              (label) => (
                <li key={label}>
                  <Link
                    href="#"
                    className="text-sm text-slate-500 decoration-cyan-500 underline-offset-4 transition-all hover:text-blue-600 hover:underline"
                  >
                    {label}
                  </Link>
                </li>
              ),
            )}
          </ul>
        </div>
        <div>
          <h4 className="mb-4 font-bold text-blue-900">Company</h4>
          <ul className="space-y-2">
            <li>
              <Link
                href="#"
                className="text-sm font-semibold text-blue-700 transition-all"
              >
                Portfolio
              </Link>
            </li>
            <li>
              <Link
                href="#"
                className="text-sm text-slate-500 decoration-cyan-500 underline-offset-4 transition-all hover:text-blue-600 hover:underline"
              >
                About Us
              </Link>
            </li>
            <li>
              <Link
                href="#"
                className="text-sm text-slate-500 decoration-cyan-500 underline-offset-4 transition-all hover:text-blue-600 hover:underline"
              >
                Careers
              </Link>
            </li>
          </ul>
        </div>
        <div>
          <h4 className="mb-4 font-bold text-blue-900">Connect</h4>
          <div className="flex space-x-4">
            <Link
              href="#"
              className="text-slate-500 transition-colors hover:text-blue-600"
              aria-label="Website"
            >
              <span className="material-symbols-outlined">public</span>
            </Link>
            <Link
              href="#"
              className="text-slate-500 transition-colors hover:text-blue-600"
              aria-label="Code"
            >
              <span className="material-symbols-outlined">code</span>
            </Link>
          </div>
          <p className="mt-4 text-xs text-slate-400">
            © 2024 ArchitectCore IT Solutions. Engineered for Excellence.
          </p>
        </div>
      </div>
      <div className="mx-auto flex max-w-7xl flex-wrap gap-6 border-t border-slate-200/60 px-8 py-6 text-[11px] font-medium text-slate-500">
        <Link href="#" className="hover:text-primary">
          Privacy Policy
        </Link>
        <Link href="#" className="hover:text-primary">
          Terms of Service
        </Link>
        <Link href="#" className="hover:text-primary">
          Cookie Settings
        </Link>
        <div className="ml-auto text-slate-400">Ver. 2.4.0-Architect</div>
      </div>
    </footer>
  );
}
