export function calculateBouquetTotal({ flowers, wetSponge, greetingCard }) {
  const flowerTotal = flowers.reduce(
    (sum, flower) => sum + flower.quantity * flower.unitPrice,
    0,
  );

  return flowerTotal + (wetSponge ? 250 : 0) + (greetingCard ? 200 : 0);
}

export function buildAIPrompt({ flowers, ribbon, wrapping, greetingCardMessage }) {
  const floralMix = flowers.map((f) => `${f.name} x${f.quantity}`).join(', ');
  return `Elegant bouquet with ${floralMix}; ribbon: ${ribbon}; wrapping: ${wrapping}; greeting card: ${greetingCardMessage || 'none'}`;
}
