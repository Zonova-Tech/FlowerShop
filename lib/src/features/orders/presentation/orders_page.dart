import 'package:flutter/material.dart';

class OrdersPage extends StatelessWidget {
  const OrdersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Card(
        child: DataTable(
          columns: const [
            DataColumn(label: Text('Order ID')),
            DataColumn(label: Text('Total')),
            DataColumn(label: Text('Payment')),
            DataColumn(label: Text('Status')),
          ],
          rows: const [
            DataRow(cells: [
              DataCell(Text('#ZNV-1001')),
              DataCell(Text('LKR 4,900')),
              DataCell(Text('Paid')),
              DataCell(Text('Preparing')),
            ]),
          ],
        ),
      ),
    );
  }
}
