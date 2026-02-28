# Zonova Flowers - Flutter App + ZonovaMistAPI

This workspace now includes both repositories needed for the Zonova platform:

- **`/` (FlowerShop)**: Flutter 3+ app (Android, iOS, Web, null-safety).
  - Includes Android and iOS platform scaffolding files for native packaging setup.
- **`/ZonovaMistAPI`**: Node.js backend service for bouquet preview, pricing, and payment helpers.

---

## 1) Flutter App Architecture (Clean + Scalable)

```text
lib/
  main.dart
  src/
    app/
      zonova_app.dart
    core/
      config/
      theme/
      utils/
    features/
      auth/
      bouquet/
      cart/
      checkout/
      addresses/
      orders/
      payments/
      admin/
    presentation/
      widgets/
```

### Implemented feature shells
- Authentication UI for **Google** and **Email/Password** sign-up flow.
- Bouquet Customization module with:
  - multiple flowers and quantities,
  - ribbon + wrapping selections,
  - wet sponge + optional greeting card,
  - **live total price update**,
  - AI payload prompt summary,
  - save combination button.
- Cart page shell with checkout call-to-action.
- Address page shell for add/edit/delete/default.
- Orders page table with order ID, amount, payment status, and order status.
- Admin page shell for inventory and order management.
- Responsive Material 3 UI with florist soft pink + white theme.
- Footer with required business details.

---

## 2) Backend (`ZonovaMistAPI`) Overview

### Modules implemented
- `bouquet.service.js`
  - bouquet total calculation
  - AI image prompt generator
- `payment.service.js`
  - PayHere hash generation (LKR compatible)
  - Webxpay payload generation
- `server.js`
  - health endpoint
  - bouquet preview endpoint
  - payment helper endpoints
  - mobile runtime config endpoint (`/mobile/config`)
  - Flutter bootstrap guidance endpoint (`/client/bootstrap`)

---

## 3) Firebase & Security

Generated baseline configs:
- `firebase/firestore.rules` with role-based admin/customer access.
- `firebase/storage.rules` for inventory uploads and user preview paths.
- `firebase/firebase.json` for Hosting + Firestore + Storage wiring.

> Keep merchant keys and API secrets in environment files (`.env`) and CI secrets. Never hardcode secrets.

---

## 4) Environment Variables

### Flutter (`.env` based on `.env.example`)
- `FIREBASE_WEB_API_KEY`
- `PAYHERE_MERCHANT_ID`
- `PAYHERE_MERCHANT_SECRET`
- `WEBXPAY_API_KEY`
- `AI_IMAGE_ENDPOINT`

### ZonovaMistAPI (`ZonovaMistAPI/.env`)
- `PORT`
- `PAYHERE_MERCHANT_ID`
- `PAYHERE_MERCHANT_SECRET`
- `WEBXPAY_API_KEY`

---

## 5) Run Instructions

### Flutter app
```bash
flutter pub get
flutter run -d chrome
```

### Backend API
```bash
cd ZonovaMistAPI
npm install
npm run dev
```


### Recreate Flutter native scaffolding (recommended fix for unsupported Gradle projects)
```bash
./scripts/recreate_flutter_project.sh .
```

This script wraps the required `flutter create -t app <app-directory>` flow and refreshes native folders while preserving your app code.

---

## 6) Deployment

### Flutter Web to Firebase Hosting
```bash
flutter build web
firebase deploy --only hosting
```

### Firebase Rules
```bash
firebase deploy --only firestore:rules,storage
```

### Mobile apps
- Android: `flutter build appbundle`
- iOS: `flutter create --platforms=ios .` (if native project metadata is missing), then `flutter build ipa`

---

## 7) Next Production Steps

1. Wire Firebase SDK initialization (`firebase_options.dart`) per target.
2. Add real auth repository implementations for Google + email/password.
3. Connect bouquet save-to-cart and checkout flows to Firestore.
4. Integrate real PayHere/Webxpay client-side + callback verification in backend.
5. Add admin inventory CRUD forms and media upload to Firebase Storage.
6. Add Cloud Functions for AI image generation and secure payment callbacks.
7. Add automated tests (widget + integration + API).
