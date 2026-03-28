export function PortfolioHero() {
  return (
    <section className="relative overflow-hidden px-6 py-20 md:py-32">
      <div className="relative z-10 mx-auto max-w-7xl">
        <div className="flex flex-col justify-between gap-8 md:flex-row md:items-end">
          <div className="max-w-2xl">
            <span className="mb-6 inline-block rounded-full bg-secondary-container px-3 py-1 text-[10px] font-bold uppercase tracking-[0.1em] text-on-secondary-container">
              Our Portfolio
            </span>
            <h1 className="mb-8 text-5xl leading-[1.1] font-extrabold tracking-tight text-primary md:text-7xl">
              Case Studies
            </h1>
            <p className="max-w-xl text-lg font-light leading-relaxed text-on-surface-variant md:text-xl">
              We architect high-precision digital infrastructure that transforms
              complex operational challenges into competitive advantages.
              Explore our recent engineering triumphs.
            </p>
          </div>
          <div className="flex gap-4 pb-2">
            <div className="h-16 w-1 rounded-full bg-secondary" />
            <div className="h-12 w-1 self-end rounded-full bg-secondary/40" />
            <div className="h-20 w-1 self-start rounded-full bg-secondary/20" />
          </div>
        </div>
      </div>
      <div
        className="absolute top-0 right-0 -z-10 h-full w-1/2 -skew-x-12 translate-x-1/4 bg-surface-container-low"
        aria-hidden
      />
    </section>
  );
}
