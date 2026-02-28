import { env } from '../../config/env.js';

export function buildMobileConfig() {
  return {
    android: {
      packageName: 'com.zonova.flowers',
      minSdk: 21,
      targetSdk: 34,
      paymentCurrency: 'LKR',
      payHereMerchantId: env.payHereMerchantId,
    },
    ios: {
      bundleId: 'com.zonova.flowers',
      minimumVersion: '13.0',
      paymentCurrency: 'LKR',
      payHereMerchantId: env.payHereMerchantId,
    },
  };
}
