# ZonovaMistAPI

Backend service for Zonova Flowers.

## Stack
- Node.js + Express
- Firebase Admin SDK
- Cloud Functions compatible handlers
- PayHere + Webxpay service wrappers

## Run locally
```bash
npm install
npm run dev
```

## API modules
- `auth` Firebase token verification and role checks
- `bouquet` AI image prompt generation and price calculation
- `payments` PayHere/Webxpay sandbox-live mode support
- `orders` checkout and status transitions
- `inventory` admin item CRUD
- `addresses` customer address CRUD/default
