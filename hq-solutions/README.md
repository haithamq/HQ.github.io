# HQ Solutions

A modern freelancing company website for **HQ Solutions**, offering web development, POS systems, and custom applications for clients and shops.

## Stack

- **Next.js 14** (App Router)
- **TypeScript**
- **React 18**
- **Tailwind CSS**
- **shadcn/ui** (Button, Card and design system)

## Theme

Colors are derived from the HQ Solutions logo:

- Dark charcoal background (`#222831`)
- Primary blue (`#3C6E8F`)
- Accent teal/cyan (`#60B6D9`) for CTAs and highlights

## Run locally

```bash
npm install
npm run dev
```

Open [http://localhost:3000](http://localhost:3000).

## Build

```bash
npm run build
npm start
```

## Customize

- Update contact email in `src/app/page.tsx` (replace `hello@hqsolutions.example`).
- Add more pages under `src/app/` as needed.
- Add more shadcn components with `npx shadcn@latest add <component>`.
