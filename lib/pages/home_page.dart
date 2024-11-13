// import 'package:flutter/material.dart';

// class HomePage extends StatefulWidget {
//   const HomePage({super.key});

//   @override
//   // ignore: library_private_types_in_public_api
//   _HomePageState createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {
//   List<Map<String, dynamic>> expenses = List.generate(10, (index) {
//     return {
//       'date': DateTime(2024, 11, index + 1),
//       'title': 'Expense ${index + 1}',
//       'category':
//           index % 2 == 0 ? Icons.shopping_cart : Icons.local_grocery_store,
//       'price': (index + 1) * 20,
//     };
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         padding: const EdgeInsets.symmetric(vertical: 20),
//         child: Column(
//           children: [
//             // Cuadro de texto en la parte superior
//             Center(
//               child: Padding(
//                 padding: const EdgeInsets.only(top: 10.0, left: 20, right: 20),
//                 child: Container(
//                   height: 100.0,
//                   decoration: BoxDecoration(
//                     color: Colors.black,
//                     borderRadius: BorderRadius.circular(8.0),
//                   ),
//                   child: const Center(
//                     child: Text(
//                       'Text inside the square.',
//                       style: TextStyle(
//                         color: Colors.white,
//                         fontSize: 18.0,
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//             ),

//             const SizedBox(height: 20),

//             // Lista de gastos
//             Expanded(
//               child: SingleChildScrollView(
//                 scrollDirection: Axis.vertical,
//                 child: Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 20),
//                   child: Column(
//                     children: List.generate(
//                       expenses.length,
//                       (index) => Padding(
//                         padding: const EdgeInsets.only(bottom: 10.0),
//                         child: Card(
//                           elevation: 5,
//                           shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(10),
//                           ),
//                           child: Padding(
//                             padding: const EdgeInsets.all(15.0),
//                             child: Row(
//                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                               children: [
//                                 Column(
//                                   crossAxisAlignment: CrossAxisAlignment.start,
//                                   children: [
//                                     Text(expenses[index]['title'],
//                                         style: const TextStyle(
//                                             fontWeight: FontWeight.bold)),
//                                     Text(
//                                       '${expenses[index]['date'].day.toString().padLeft(2, '0')}/${expenses[index]['date'].month.toString().padLeft(2, '0')}',
//                                       style:
//                                           const TextStyle(color: Colors.grey),
//                                     ),
//                                   ],
//                                 ),
//                                 Row(
//                                   children: [
//                                     Icon(
//                                       expenses[index]['category'],
//                                       size: 24.0,
//                                       color: Colors.blue,
//                                     ),
//                                     const SizedBox(width: 10),
//                                     Text('\$${expenses[index]['price']}',
//                                         style: const TextStyle(
//                                             fontWeight: FontWeight.bold)),
//                                   ],
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Map<String, dynamic>> expenses = List.generate(10, (index) {
    return {
      'date': DateTime(2024, 11, index + 1),
      'title': 'Expense ${index + 1}',
      'category':
          index % 2 == 0 ? Icons.shopping_cart : Icons.local_grocery_store,
      'price': (index + 1) * 20,
    };
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Column(
          children: [
            // Cuadro de texto en la parte superior
            Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 10.0, left: 20, right: 20),
                child: Container(
                  height: 100.0,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: const Center(
                    child: Text(
                      'Text inside the square.',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18.0,
                      ),
                    ),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 20),

            // Lista de gastos
            Expanded(
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    children: List.generate(
                      expenses.length,
                      (index) => Padding(
                        padding: const EdgeInsets.only(bottom: 10.0),
                        child: Card(
                          elevation: 5,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          color: Colors.black87, // Cambia el color aquí
                          child: Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(expenses[index]['title'],
                                        style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white)),
                                    Text(
                                      '${expenses[index]['date'].day.toString().padLeft(2, '0')}/${expenses[index]['date'].month.toString().padLeft(2, '0')}',
                                      style:
                                          const TextStyle(color: Colors.grey),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Icon(
                                      expenses[index]['category'],
                                      size: 24.0,
                                      color: Colors.blue,
                                    ),
                                    const SizedBox(width: 10),
                                    Text('\$${expenses[index]['price']}',
                                        style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white)),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
