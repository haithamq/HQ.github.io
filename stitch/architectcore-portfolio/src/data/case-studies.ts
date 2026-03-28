export type CaseStudyCategory = "pos" | "web" | "apps";

export type ProjectFilterId = "all" | CaseStudyCategory;

export interface CaseStudy {
  id: string;
  category: CaseStudyCategory;
  categoryLabel: string;
  title: string;
  challenge: string;
  solution: string;
  imageSrc: string;
  imageAlt: string;
}

export const CASE_STUDIES: CaseStudy[] = [
  {
    id: "retail-pos",
    category: "pos",
    categoryLabel: "POS Systems",
    title: "RetailChain POS Overhaul",
    challenge:
      "Legacy systems causing 15% latency in peak-hour transactions across 200+ locations.",
    solution:
      "Architected a cloud-native, offline-first edge computing layer that reduced latency to sub-200ms.",
    imageSrc:
      "https://lh3.googleusercontent.com/aida-public/AB6AXuBMDDjQ1bXjjwT3qrqG9sMWjzG_GDCrk7NNIPmwBZ_Is9hky2O6yqN7AvzVYoPkiVsPrGqg8VSY8taGySrtnKQqPlD10m8VzOZPjn64LHeOGv7mI8qnQ8eQ04qgYX_hZSGIhsU2RlXF0lBTlqZLtTyKuVq-kO6DZxoaiIxoEZrTYXyj2BeGxeMMHbXgxyuSAPHxFf0M9jqyyRRmqhJ-K65ZS3uj5gGb6XUKV01Wdn3laWf3XO2cOeYgdLkmOhcwuTyboCtotf8nmuE",
    imageAlt: "Retail POS environment",
  },
  {
    id: "nextgen-ecom",
    category: "web",
    categoryLabel: "Web Solutions",
    title: "NextGen E-commerce",
    challenge:
      "Stagnant conversion rates due to monolithic architecture and slow mobile load times.",
    solution:
      "Implemented Headless Commerce with a Next.js frontend, resulting in a 40% boost in mobile conversions.",
    imageSrc:
      "https://lh3.googleusercontent.com/aida-public/AB6AXuDx1Oaat-xlhDy5-1EoPGIaWz93NDSl3hAWsEQ3pz21n9OzndCHmbqDLx1jywcRfiXRxIjrJyr_lKdqZZp7AC3hGDnWxevmV-bZhP3e6GhFFxO4gi8bowT8EJHEYxe37yLywLzup5KvkFcNBcPI4DJMdqmGh1zSob87Wnh7nSwatkJY3PrON86ALBBxqowVQ30LoclqZsGArSChH4yVa1Qk6YMxUAIgiGgkajC4_V3xs1InTpV3_HO_CYNM5JjxE5L3KsvMOLl6-aI",
    imageAlt: "E-commerce network visualization",
  },
  {
    id: "fintech-hub",
    category: "apps",
    categoryLabel: "App Ecosystems",
    title: "FinTech Data Hub",
    challenge:
      "Fragmented financial data silos preventing real-time risk assessment for institutional clients.",
    solution:
      "Built a unified GraphQL orchestration layer that harmonized 12 disparate data sources into one dashboard.",
    imageSrc:
      "https://lh3.googleusercontent.com/aida-public/AB6AXuCHndErAamW1RdluVqmJbAQQqj2N5z3_JgNEerBIh3BMFyEAm_y6v8UzAl3vs1jgDz6ssZDqgr3DWsqbspHoiY_TknW1Fz5KpXPHpKXt4mIjtrmoCMmK1c-N2I-E8d8mOM-mqEUTGEJtguYOJNegUVvb7XKeJZ2i8XzL6mLsFeHktj6vulh7aNUnTgu3fr70Sf5lmZxQodLJGBIGOIVF5hp3NVzSjQm6F6I5p9HHxMp_j6-JO0O1hlce4fSY0ONa_A1dNGH-mdotno",
    imageAlt: "Financial dashboard on tablet",
  },
];

export const FILTER_OPTIONS: { id: ProjectFilterId; label: string }[] = [
  { id: "all", label: "All Projects" },
  { id: "pos", label: "POS" },
  { id: "web", label: "Web" },
  { id: "apps", label: "Apps" },
];
