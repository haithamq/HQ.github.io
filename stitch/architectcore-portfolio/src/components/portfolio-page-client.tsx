"use client";

import { useMemo, useState } from "react";
import {
  CASE_STUDIES,
  type ProjectFilterId,
} from "@/data/case-studies";
import { CaseStudyCard } from "@/components/case-study-card";
import { ProjectFilter } from "@/components/project-filter";

export function PortfolioPageClient() {
  const [filter, setFilter] = useState<ProjectFilterId>("all");

  const visible = useMemo(() => {
    if (filter === "all") return CASE_STUDIES;
    return CASE_STUDIES.filter((s) => s.category === filter);
  }, [filter]);

  return (
    <>
      <ProjectFilter value={filter} onChange={setFilter} />
      <section className="px-6 pb-24">
        <div className="mx-auto max-w-7xl">
          <div className="grid grid-cols-1 gap-8 md:grid-cols-2 lg:grid-cols-3">
            {visible.map((study) => (
              <CaseStudyCard key={study.id} study={study} />
            ))}
          </div>
        </div>
      </section>
    </>
  );
}
