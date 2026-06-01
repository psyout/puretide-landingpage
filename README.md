# PureTide Landing Page

Marketing/landing site for PureTide, built with Next.js (App Router) and Tailwind CSS.

## Tech

- **Next.js 14**
- **React 18**
- **TypeScript**
- **Tailwind CSS**
- **framer-motion** (animations)
- **lucide-react** (icons)

## Getting started

### Install

```bash
npm install
```

### Run locally

```bash
npm run dev
```

Then open:

- `http://localhost:3000`

### Production build

```bash
npm run build
npm run start
```

## Project structure

```
.
├── app/
│   ├── layout.tsx
│   ├── page.tsx
│   ├── globals.css
│   ├── not-found.tsx
│   ├── error.tsx
│   └── global-error.tsx
├── public/              # static assets (images, PDFs, etc.)
├── next.config.js
├── tailwind.config.ts
└── package.json
```

## Notes

- This repo is a **landing page** (not an e-commerce app). If you need additional pages/sections, they should generally be added under `app/`.

## License

Private.
