
import 'package:flutter/material.dart';
import 'student.dart';

void main() {
  runApp(const CafeApp());
}

class CafeItem {
  final String name;
  final int price;
  final IconData icon;
  final bool bestSeller;

  const CafeItem({
    required this.name,
    required this.price,
    required this.icon,
    this.bestSeller = false,
  });
}

const List<CafeItem> menu = [
  CafeItem(
    name: 'Iced Coffee',
    price: 85,
    icon: Icons.coffee,
    bestSeller: true,
  ),
  CafeItem(
    name: 'Hot Chocolate',
    price: 75,
    icon: Icons.local_cafe,
  ),
  CafeItem(
    name: 'Fruit Shake',
    price: 90,
    icon: Icons.local_drink,
    bestSeller: true,
  ),
  CafeItem(
    name: 'Cheeseburger',
    price: 120,
    icon: Icons.lunch_dining,
  ),
  CafeItem(
    name: 'Fries',
    price: 60,
    icon: Icons.fastfood,
  ),
  CafeItem(
    name: 'Ensaymada',
    price: 45,
    icon: Icons.bakery_dining,
  ),
  // Two additional menu items
  CafeItem(
    name: 'Milk Tea',
    price: 80,
    icon: Icons.local_drink,
    bestSeller: true,
  ),
  CafeItem(
    name: 'Sandwich',
    price: 65,
    icon: Icons.breakfast_dining,
  ),
];

class CafeApp extends StatelessWidget {
  const CafeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(colorSchemeSeed: studentColor),
      home: const MenuPage(),
    );
  }
}

class MenuPage extends StatelessWidget {
  const MenuPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Activity 4 - Campus Café'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12),
            child: Text(
              studentName,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          ),
          // Stack layers the banner and the OPEN badge.
          SizedBox(
            height: 140,
            width: double.infinity,
            child: Stack(
              fit: StackFit.expand,
              children: [
                Container(
                  color: Colors.brown.shade700,
                  alignment: Alignment.center,
                  child: const Text(
                    'CAMPUS CAFÉ\nFresh food, happy mood!',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const Positioned(
                  top: 12,
                  right: 12,
                  child: Chip(
                    label: Text('OPEN'),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 58,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.all(10),
              itemCount: 4,
              separatorBuilder: (_, __) =>
                  const SizedBox(width: 8),
              itemBuilder: (context, index) {
                const categories = [
                  'All',
                  'Drinks',
                  'Food',
                  'Best Sellers',
                ];
                return Chip(label: Text(categories[index]));
              },
            ),
          ),
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.all(12),
              itemCount: menu.length,
              gridDelegate:
                  const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
                childAspectRatio: 0.95,
              ),
              itemBuilder: (context, index) {
                return MenuCard(item: menu[index]);
              },
            ),
          ),
        ],
      ),
    );
  }
}

class MenuCard extends StatelessWidget {
  final CafeItem item;

  const MenuCard({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(item.icon, size: 48),
                const SizedBox(height: 8),
                Text(
                  item.name,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 6),
                Text('₱${item.price}'),
              ],
            ),
          ),
          if (item.bestSeller)
            const Positioned(
              top: 4,
              right: 4,
              child: Chip(
                label: Text(
                  'Best seller',
                  style: TextStyle(fontSize: 10),
                ),
                visualDensity: VisualDensity.compact,
              ),
            ),
        ],
      ),
    );
  }
}
