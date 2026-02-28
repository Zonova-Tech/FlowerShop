import cors from 'cors';
import express from 'express';

import { env } from './config/env.js';
import { buildAIPrompt, calculateBouquetTotal } from './modules/bouquet/bouquet.service.js';
import { createPayHereHash, webxpayPayload } from './modules/payments/payment.service.js';
import { buildMobileConfig } from './modules/config/mobile-config.service.js';

const app = express();
app.use(cors());
app.use(express.json());

app.get('/health', (_req, res) => {
  res.json({ status: 'ok', service: 'ZonovaMistAPI' });
});

app.post('/bouquet/preview', (req, res) => {
  const total = calculateBouquetTotal(req.body);
  const prompt = buildAIPrompt(req.body);
  res.json({ total, prompt, imageUrl: 'generated-by-cloud-function' });
});

app.post('/payments/payhere', (req, res) => {
  res.json({ hash: createPayHereHash(req.body), mode: 'sandbox|live' });
});

app.post('/payments/webxpay', (req, res) => {
  res.json(webxpayPayload(req.body));
});

app.get('/mobile/config', (_req, res) => {
  res.json(buildMobileConfig());
});

app.listen(env.port, () => {
  console.log(`ZonovaMistAPI running on port ${env.port}`);
});
