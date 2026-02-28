import dotenv from 'dotenv';

dotenv.config();

export const env = {
  port: process.env.PORT ?? 8080,
  payHereMerchantId: process.env.PAYHERE_MERCHANT_ID ?? '',
  payHereMerchantSecret: process.env.PAYHERE_MERCHANT_SECRET ?? '',
  webxpayApiKey: process.env.WEBXPAY_API_KEY ?? '',
};
