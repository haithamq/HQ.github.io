export function CtaBanner() {
  return (
    <section className="bg-surface-container-low px-6 py-24">
      <div className="mx-auto max-w-7xl">
        <div className="relative overflow-hidden rounded-[2rem] bg-gradient-to-r from-primary to-primary-container p-12 text-center md:p-20 md:text-left">
          <div
            className="absolute top-0 right-0 h-64 w-64 -translate-y-1/2 translate-x-1/2 rounded-full bg-white/5 blur-3xl"
            aria-hidden
          />
          <div className="relative z-10 flex flex-col items-center justify-between gap-12 md:flex-row">
            <div className="max-w-xl">
              <h2 className="mb-6 text-4xl font-black tracking-tight text-white md:text-5xl">
                Ready to architect your success?
              </h2>
              <p className="text-lg leading-relaxed text-primary-fixed">
                Let&apos;s discuss how our precision engineering can solve your
                most pressing technical challenges.
              </p>
            </div>
            <div className="flex w-full flex-col gap-4 sm:w-auto sm:flex-row">
              <button
                type="button"
                className="rounded-xl bg-secondary-container px-10 py-5 text-lg font-bold text-on-secondary-container transition-all hover:shadow-2xl hover:shadow-secondary/20 active:scale-95"
              >
                Get a Quote
              </button>
              <button
                type="button"
                className="rounded-xl border border-white/20 bg-white/10 px-10 py-5 text-lg font-bold text-white backdrop-blur-md transition-all hover:bg-white/20"
              >
                Contact Sales
              </button>
            </div>
          </div>
        </div>
      </div>
    </section>
  );
}
