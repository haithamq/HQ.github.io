"use client";

import type { ProjectFilterId } from "@/data/case-studies";
import { FILTER_OPTIONS } from "@/data/case-studies";

type ProjectFilterProps = {
  value: ProjectFilterId;
  onChange: (id: ProjectFilterId) => void;
};

export function ProjectFilter({ value, onChange }: ProjectFilterProps) {
  return (
    <section className="mb-16 px-6">
      <div className="mx-auto max-w-7xl">
        <div className="flex flex-wrap items-center gap-4">
          {FILTER_OPTIONS.map((opt) => {
            const selected = value === opt.id;
            return (
              <button
                key={opt.id}
                type="button"
                onClick={() => onChange(opt.id)}
                className={
                  selected
                    ? "rounded-full bg-primary px-6 py-2 text-sm font-medium text-on-primary transition-all"
                    : "rounded-full bg-surface-container-highest px-6 py-2 text-sm font-medium text-on-surface-variant transition-all hover:bg-surface-variant"
                }
              >
                {opt.label}
              </button>
            );
          })}
        </div>
      </div>
    </section>
  );
}
