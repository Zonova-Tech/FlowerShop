import crypto from 'crypto';

import { env } from '../../config/env.js';

export function createPayHereHash({ orderId, amount, currency = 'LKR' }) {
  const amountText = Number(amount).toFixed(2);
  const secretMd5 = crypto
    .createHash('md5')
    .update(env.payHereMerchantSecret)
    .digest('hex')
    .toUpperCase();

  return crypto
    .createHash('md5')
    .update(`${env.payHereMerchantId}${orderId}${amountText}${currency}${secretMd5}`)
    .digest('hex')
    .toUpperCase();
}

export function webxpayPayload(order) {
  return {
    currency: 'LKR',
    amount: order.total,
    order_id: order.id,
    api_key: env.webxpayApiKey,
  };
}
