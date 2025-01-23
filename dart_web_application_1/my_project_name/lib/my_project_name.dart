import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MenuPage(),
    );
  }
}

class MenuPage extends StatefulWidget {
  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  int selectedMenuIndex = -1; // Ningún menú seleccionado al inicio

  final List<Map<String, dynamic>> menus = [
    {
      'title': 'Menú 1',
      'days': 'Lun - Mier - Vier',
      'price': 'S/. 5',
      'image': 'https://images.unsplash.com/photo-1604908177944-6cc37c35544e',
    },
    {
      'title': 'Menú 2',
      'days': 'Mar - Jue - Sab',
      'price': 'S/. 6',
      'image': 'https://images.unsplash.com/photo-1546069901-7cce9c5c5f45',
    },
    {
      'title': 'Menú 3',
      'days': 'Mar - Jue - Sab',
      'price': 'S/. 7',
      'image': 'https://images.unsplash.com/photo-1606890737303-2e5d9c5f759b',
    },
    {
      'title': 'Menú 4',
      'days': 'Mar - Jue - Sab',
      'price': 'S/. 8',
      'image': 'https://images.unsplash.com/photo-1571115176628-7b8a96224e99',
    },
    {
      'title': 'Menú 5',
      'days': 'Mar - Jue - Sab',
      'price': 'S/. 9',
      'image': 'https://images.unsplash.com/photo-1555939594-58d7cb561ad1',
    },
  ];

  void selectMenu(int index) {
    setState(() {
      selectedMenuIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SetState Cards Assets App'),
        backgroundColor: Colors.amber,
        centerTitle: true,
      ),
      body: Column(
        children: [
          const SizedBox(height: 20),
          const Text(
            'Selecciona tu mejor elección',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          Expanded(
            child: ListView.builder(
              itemCount: menus.length,
              itemBuilder: (context, index) {
                final menu = menus[index];
                final isSelected = selectedMenuIndex == index;

                return GestureDetector(
                  onTap: () => selectMenu(index),
                  child: Container(
                    margin: const EdgeInsets.symmetric(
                        vertical: 8.0, horizontal: 16.0),
                    decoration: BoxDecoration(
                      color: isSelected ? Colors.amber.shade200 : Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: isSelected ? Colors.amber : Colors.grey,
                        width: 1,
                      ),
                    ),
                    child: Row(
                      children: [
                        ClipRRect(
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(12),
                            bottomLeft: Radius.circular(12),
                          ),
                          child: Image.network(
                            menu['image'],
                            width: 100,
                            height: 100,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  menu['title'],
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: isSelected
                                        ? Colors.amber.shade800
                                        : Colors.black,
                                  ),
                                ),
                                Text(menu['days']),
                                Text(
                                  menu['price'],
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: isSelected
                                        ? Colors.amber.shade800
                                        : Colors.black,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
