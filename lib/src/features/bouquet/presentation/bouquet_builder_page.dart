import 'package:flutter/material.dart';

class BouquetBuilderPage extends StatefulWidget {
  const BouquetBuilderPage({super.key});

  @override
  State<BouquetBuilderPage> createState() => _BouquetBuilderPageState();
}

class _BouquetBuilderPageState extends State<BouquetBuilderPage> {
  final _flowers = {'Roses': 2, 'Lilies': 1, 'Gerberas': 3};
  String _ribbon = 'Pink Satin';
  String _wrapping = 'White Kraft';
  bool _wetSponge = true;
  bool _greetingCard = false;

  double get _total =>
      (_flowers.values.fold(0, (sum, quantity) => sum + quantity) * 850) +
      (_wetSponge ? 250 : 0) +
      (_greetingCard ? 200 : 0);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Bouquet Customization', style: Theme.of(context).textTheme.titleLarge),
              const SizedBox(height: 8),
              ..._flowers.entries.map(
                (entry) => ListTile(
                  title: Text(entry.key),
                  trailing: Text('Qty ${entry.value}'),
                ),
              ),
              DropdownButtonFormField<String>(
                value: _ribbon,
                decoration: const InputDecoration(labelText: 'Ribbon'),
                items: const [
                  DropdownMenuItem(value: 'Pink Satin', child: Text('Pink Satin')),
                  DropdownMenuItem(value: 'Gold Silk', child: Text('Gold Silk')),
                ],
                onChanged: (value) => setState(() => _ribbon = value ?? _ribbon),
              ),
              const SizedBox(height: 8),
              DropdownButtonFormField<String>(
                value: _wrapping,
                decoration: const InputDecoration(labelText: 'Wrapping'),
                items: const [
                  DropdownMenuItem(value: 'White Kraft', child: Text('White Kraft')),
                  DropdownMenuItem(value: 'Transparent', child: Text('Transparent')),
                ],
                onChanged: (value) => setState(() => _wrapping = value ?? _wrapping),
              ),
              SwitchListTile(
                value: _wetSponge,
                onChanged: (value) => setState(() => _wetSponge = value),
                title: const Text('Add wet sponge'),
              ),
              CheckboxListTile(
                value: _greetingCard,
                onChanged: (value) => setState(() => _greetingCard = value ?? false),
                title: const Text('Greeting card'),
              ),
              const SizedBox(height: 8),
              Text('AI preview prompt payload: flowers, counts, ribbon, card info'),
              Text('Live Total: LKR ${_total.toStringAsFixed(2)}'),
              const SizedBox(height: 8),
              FilledButton(onPressed: () {}, child: const Text('Save Combination to Cart')),
            ],
          ),
        ),
      ),
    );
  }
}
