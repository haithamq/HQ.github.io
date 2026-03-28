import Image from "next/image";
import type { CaseStudy } from "@/data/case-studies";

type CaseStudyCardProps = {
  study: CaseStudy;
};

export function CaseStudyCard({ study }: CaseStudyCardProps) {
  return (
    <article className="group flex flex-col overflow-hidden rounded-xl bg-surface-container-lowest shadow-sm transition-all duration-500 hover:shadow-xl hover:shadow-primary/5">
      <div className="relative aspect-video overflow-hidden">
        <Image
          src={study.imageSrc}
          alt={study.imageAlt}
          fill
          className="object-cover transition-transform duration-700 group-hover:scale-105"
          sizes="(max-width: 768px) 100vw, (max-width: 1200px) 50vw, 33vw"
        />
        <div className="absolute top-4 left-4">
          <span className="glass-effect rounded-full bg-secondary-container/90 px-3 py-1 text-[10px] font-bold tracking-wider text-on-secondary-container uppercase">
            {study.categoryLabel}
          </span>
        </div>
      </div>
      <div className="flex flex-1 flex-col p-8">
        <h3 className="mb-4 text-2xl leading-tight font-bold text-primary">
          {study.title}
        </h3>
        <div className="mb-8 space-y-4">
          <div className="rounded-lg bg-surface-container-low p-4">
            <p className="mb-1 text-[11px] font-bold tracking-widest text-secondary uppercase">
              The Challenge
            </p>
            <p className="text-sm text-on-surface-variant">{study.challenge}</p>
          </div>
          <div className="rounded-lg border-l-2 border-primary bg-primary/5 p-4">
            <p className="mb-1 text-[11px] font-bold tracking-widest text-primary uppercase">
              The Solution
            </p>
            <p className="text-sm text-on-surface-variant">{study.solution}</p>
          </div>
        </div>
        <div className="group/btn mt-auto flex cursor-pointer items-center text-sm font-semibold text-primary">
          <span>View Case Study</span>
          <span className="material-symbols-outlined ml-2 transition-transform group-hover/btn:translate-x-1">
            arrow_forward
          </span>
        </div>
      </div>
    </article>
  );
}
