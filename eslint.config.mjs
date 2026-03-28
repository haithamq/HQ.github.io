import { defineConfig, globalIgnores } from "eslint/config";
import nextVitals from "eslint-config-next/core-web-vitals";
import nextTs from "eslint-config-next/typescript";

const eslintConfig = defineConfig([
  globalIgnores([
    "**/.next/**",
    "**/out/**",
    "**/node_modules/**",
    "out/**",
    "build/**",
    "next-env.d.ts",
    "hq-solutions/**",
    "SCELTA/**",
    "bassera/**",
    "web-hotel-cms/**",
    "web-ingress/**",
    "majistic/**",
    "HQ/**",
    "stitch/**",
    "_next_app/**",
    "stitch 2/**",
  ]),
  ...nextVitals,
  ...nextTs,
]);

export default eslintConfig;
